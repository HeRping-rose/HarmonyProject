import { avSession } from '@kit.AVSessionKit'
import { wantAgent } from '@kit.AbilityKit';
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';

import { AppStorageV2 } from '@kit.ArkUI';
import { playerManager } from './AvPlayerManager';
import { GlobalMusic, SongItemType } from '../viewmodels';

// import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager'

// 创建后台管理器
class AvSessionManager{
  // private context: Context | undefined = this.getUIContext().getHostContext();
  session:avSession.AVSession|null =null

  playState:GlobalMusic=AppStorageV2.connect(GlobalMusic,'SONG_KEY',()=>new GlobalMusic())!

  async init(content:Context){
    this.session=await avSession.createAVSession(content,'bgPlay','audio')
    //注册播控命令事件
    this.registerEvent()
  }

//申请长时后台任务
  async startBackgroundTask(){
     let wantAgentInfo: wantAgent.WantAgentInfo = {
      // 点击通知后，将要执行的动作列表
      // 添加需要被拉起应用的bundleName和abilityName
      wants: [
        {
          bundleName: "com.ron.music",
          abilityName: "EntryAbility"
        }
      ],
      // 指定点击通知栏消息后的动作是拉起ability
      actionType: wantAgent.OperationType.START_ABILITY,
      // 使用者自定义的一个私有值
      requestCode: 0,
      // 点击通知后，动作执行属性
      actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
    };
    const want=await wantAgent.getWantAgent(wantAgentInfo)
    // const list=backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK
    let list: Array<string> = ["audioPlayback"];
    await backgroundTaskManager.startBackgroundRunning(getContext(), backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK, want)

  }

//   设置元数据
  setAvMetaData(song:SongItemType){

    this.session?.setAVMetadata({
      assetId:song.id,
      title:song.name,
      mediaImage:song.img,
      artist:song.author,
      duration:this.playState.duration
    })
  }

//   设置播放状态   播放暂停状态改变的时候 时间变化的时候调用该 方法重新设置播放状态
  setAvPlayBackState(){
    this.session?.setAVPlaybackState({
      state:this.playState.isPlay? avSession.PlaybackState.PLAYBACK_STATE_PLAY:avSession.PlaybackState.PLAYBACK_STATE_PAUSE,
      speed:1,
      position:{
        elapsedTime:this.playState.time, //歌曲播放的时间
        updateTime:new Date().getTime()// 获取ms系统时间
      },
      duration:this.playState.duration

    })
  }

//   注册控制 播控命令事件
  registerEvent(){
    this.session?.on('play',()=>{
      playerManager.singPlay(this.playState.playList[this.playState.playIndex])
    })
    this.session?.on('pause',()=>{
      playerManager.paused()
    })
    this.session?.on('playPrevious',()=>{
      playerManager.prevPlay()
    })
    this.session?.on('playNext',()=>{
      playerManager.nextPlay()
    })
    this.session?.on('seek',(value:number)=>{
      playerManager.seekPlay(value
      )
    })

    this.session?.activate() // 激活命令

  }

  //注销会话
  async destroy(){
    await this.session?.destroy()
  }

}
export const sessionManager:AvSessionManager=new AvSessionManager()