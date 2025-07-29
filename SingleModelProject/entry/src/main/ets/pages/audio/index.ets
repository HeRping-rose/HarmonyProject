import { HcNavBar } from "../../commons/components/HcNavBar"
import { abilityAccessCtrl, common } from "@kit.AbilityKit"
import { promptAction } from "@kit.ArkUI"
import { navPathStack } from "../../commons/utils/navPathStack"
import { permission } from "../../commons/utils/Permission"
import { media } from "@kit.MediaKit"
import { fileIo as fs } from '@kit.CoreFileKit';
import { AudioBoComp } from "./components/AudioBoComp"

@ComponentV2
struct audio {
  context =this.getUIContext().getHostContext() as common.UIAbilityContext
  avRecorder:media.AVRecorder|null =null //全局录音管理器实例
  avPlayer:media.AVPlayer|null =null
  @Local maxAmplitude:number=0 //最大振幅
  @Local timer:number=0
  // 进入页面需要录音权限
  async getPerMission(){
    // //创建权限管理实例
    // const myManage =abilityAccessCtrl.createAtManager()
    // //设置权限 向用户发起权限申请 的请求
    // const res =await myManage.requestPermissionsFromUser(this.context,["ohos.permission.MICROPHONE"])
    //
    //
    // console.log(JSON.stringify(res))  //"authResults":[-1]  不全是0的情况 则二次请求
    // if(res.authResults.every(i=>i===0)){
    //   promptAction.openToast({message:"权限获取成功 ",alignment:Alignment.Bottom})
    // }else {
    //   const  res2= await myManage.requestPermissionOnSetting(this.context, ["ohos.permission.MICROPHONE"])
    //   console.log(JSON.stringify(res2)) //[-1] 是否所有权限都通过的数组  其中-1不通过 0 通过
    //   if (res2.every(i=>i===0)){
    //     promptAction.openToast({message:"权限获取成功 ",alignment:Alignment.Bottom})
    //   }else {
    //     navPathStack.pop()
    //   }
    // }
    let flag=await permission.requestPermissions(["ohos.permission.MICROPHONE"])
    if(!flag){
      let flag2=await permission.openPermissionSetting(["ohos.permission.MICROPHONE"])
      if(!flag2){
        promptAction.openToast({message:"该页面必须要有麦克风权限,才能正常访问 ",alignment:Alignment.Bottom})
        navPathStack.pop()
      }
    }
  }
//开始录音
  async startRecorder(){
    // 配置文件路径 并打开文件  存cache与files不同 存到cache中 如果用户清理缓存文件 则文件会丢失 如果是存files则缓存文件不会丢失
    const  filePath =this.context.filesDir+'/'+Date.now() +'.m4a'
    // 文件模块打开
    let file =fs.openSync(filePath,fs.OpenMode.READ_WRITE|fs.OpenMode.CREATE)
    console.info('file fd:' +file.fd)  // 文件描述符 就是一个数字3


    // 录音参数配置
    let options:media.AVRecorderConfig={
      audioSourceType:media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC ,//录音源
      // 音频工程的配置 录制的profile 必要参数
      profile:{
        audioBitrate:100000, //音频比特率 值越大 音频文件越大 音质越好
        audioChannels:1, //音频通道数 单声道1,打电话 录音  双声道2:听歌
        audioCodec:media.CodecMimeType.AUDIO_AAC,      //音频编码格式  压缩方式
        audioSampleRate:48000,  //音频采样率0-48000Hz  声音波动的评率
        fileFormat: media.ContainerFormatType.CFT_MPEG_4A  //文件容器的格式 文件要保存成什么格式
        // m4a:mp4没有图像画面只有声音的文件 更兼容
      },
      // 输出url:fd://xx (fd number) 录音文件描述符 写入文件
      url: `fd://${file.fd}`
    }



    //创建录音实例
    const avRecorder =await media.createAVRecorder()
    //调用prepare() 状态空闲-->准备就绪
    await avRecorder.prepare(options)
    //  状态就绪-->开始录音状态
    await avRecorder.start()

    //4.获取最大振幅
    this.timer=setInterval(async ()=>{
      this.maxAmplitude=await avRecorder.getAudioCapturerMaxAmplitude()
      //定时器 每间隔100ms获取 最大振幅
      console.log(this.maxAmplitude.toString())
    },100)  // todo:关闭定时器
    // 将录音管理器实例保存到全局
    this.avRecorder=avRecorder
  }
  // 结束录音
  endRecorder(){
    if(this.avRecorder){
      // 停止录音
      this.avRecorder.stop()
      // 释放资源
      this.avRecorder.release()
      clearInterval(this.timer)
    }
  }
  @Local duration:number=0//总时长
  @Local time:number=0
  @Local isPlay:boolean=false

  async startAvPlayer() {
    const avPlayer = await media.createAVPlayer()
    const filePath = this.context.filesDir + '/' +'1753769844141'+ '.m4a'
    ///data/app/el2/100/base/com.ron.single_model_project/haps/entry/files/1753759642415.m4a
    ///data/app/el2/100/base/com.ron.single_model_project/haps/entry/files/1753769844141.m4a
    const file = fs.openSync(filePath, fs.OpenMode.READ_ONLY)
    avPlayer.url = `fd://${file.fd}`
    avPlayer.on('stateChange', state => {
      if (state == 'initialized') {
        avPlayer.prepare()
      } else if (state == 'prepared') {
        this.duration = avPlayer.duration
        avPlayer.play()
        this.isPlay=true
      }
    })
    // 监听事件改变
    avPlayer.on('timeUpdate',time=>{
      this.time=time
    })
    this.avPlayer = avPlayer
  }

  async endAvPlayer() {
    if (this.avPlayer) {
      this.avPlayer.stop()
      this.avPlayer.release()
    }
  }
  aboutToAppear(): void {
    this.getPerMission()
  }

  build() {
    NavDestination(){
      Column({ space: 10 }){
        //title
        HcNavBar({ title: '面试录音', showRightIcon: false })

        // 录音动态显示
        AudioBoComp({ maxAmplitude: this.maxAmplitude })
          .backgroundColor('#ccc')

        Row({space:30}){
          Button('开始录音').onClick(() => {
            this.startRecorder()
          })

          Button('停止录音').onClick(() => {
            this.endRecorder()
          })
        }
        Row({ space: 30 }){
          //播放音频
          Button('播放音频').onClick(() => {
            this.startAvPlayer()
          })
          //停止播放
          Button('停止播放').onClick(() => {
            this.endAvPlayer()
          })
        }
        Row(){
          if(this.isPlay){
            // SymbolGlyph($r('sys.symbol.ohos_trash')) 󰂱󰂱
            SymbolGlyph($r('sys.symbol.pause')).width(60).margin({left:20})
              .onClick(() => {
                this.avPlayer?.pause()
                this.isPlay=false
              })
          }else{
            SymbolGlyph($r('sys.symbol.play_fill')).width(60).margin({ left: 20 })
              .onClick(() => {
                this.avPlayer?.play()
                this.isPlay = true
              })
          }
          Progress({ total: this.duration, value: this.time })
            .margin({ right: 20 })
            .layoutWeight(1)
        }
        Text(`total:`+this.duration.toString()+`time:`+this.time.toString())
      }
    }.hideTitleBar(true)
  }


}

@Builder
function audioFn() {
  audio()
}

export { audio }