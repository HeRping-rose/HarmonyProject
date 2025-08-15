import { media } from '@kit.MediaKit'
import { AppStorageV2 } from '@kit.ArkUI'
// import { pageStack } from './utils'
import { sessionManager } from './AvSessionManager'
import { GlobalMusic, SongItemType } from '../viewmodels'

class AvPlayerManager {
  //   播放器
  player: media.AVPlayer | null = null
  //共享播放数据
  currentSong: GlobalMusic = AppStorageV2.connect(GlobalMusic, 'SONG_KEY', () => new GlobalMusic())!

  // 创建播放器  +监听播放器的状态

  //调用  一打开应用就加载播放器
  async init() {
    if (!this.player) {
      this.player = await media.createAVPlayer()
    }
    //监听状态变化
    this.player.on('stateChange', (state) => {
      if (state === 'initialized') {
        this.player?.prepare()
      } else if (state == 'prepared') {
        this.player?.play()

        this.currentSong.isPlay = true
      } else if (state == 'completed') {
        this.nextPlay(true)
      } else if (state == 'released') {
        this.currentSong.reset()
      }
    })

    //监听时间变化
    this.player.on('durationUpdate', (duration) => {
      this.currentSong.duration = duration
      // 总时长变化设置元数据
      sessionManager.setAvMetaData(this.currentSong.playList[this.currentSong.playIndex])
    })
    this.player.on('timeUpdate', (time) => {
      this.currentSong.time = time
      //设置播放状态
      sessionManager.setAvPlayBackState()

    })
  }

  //播放歌曲 设置播放资源  接收不同歌曲
  // singPlay(song:SongItemType){
  //   this.player!.url=song.url  //非空才赋值
  //
  //   this.currentSong.img=song.img
  // }
  singPlay(song: SongItemType) {
    // 申请长时任务
    sessionManager.startBackgroundTask()
    sessionManager.setAvPlayBackState()
    //是否在列表 some 检查数组里面的数据是否 满足条件 满足返回true else false
    const inList = this.currentSong.playList.some(item => item.id === song.id)
    if (inList) {
      //在列表里面 是否是正在播放的  url
      if (this.currentSong.url == song.url) {
        this.player?.play()
        this.currentSong.isPlay = true

      } else {
        //设置新的索引 ->切换
        this.currentSong.playIndex == this.currentSong.playList.findIndex(item => item.id === song.id)

        //切换歌曲
        this.changeSong()
      }

    } else {
      //不在列表里面  添加到播放列表 ->切换歌曲
      this.currentSong.playList.unshift(song)
      this.currentSong.playIndex = 0
      //切换歌曲
      this.changeSong()

    }
  }

  //切换歌曲 -> 重置播放器
  async changeSong() {
    await this.player?.reset()
    this.currentSong.time = 0
    this.currentSong.duration = 0
    this.currentSong.img = this.currentSong.playList[this.currentSong.playIndex].img
    this.currentSong.name = this.currentSong.playList[this.currentSong.playIndex].name
    this.currentSong.author = this.currentSong.playList[this.currentSong.playIndex].author
    this.currentSong.url = this.currentSong.playList[this.currentSong.playIndex].url
    this.player!.url = this.currentSong.url

  }

  //   定义跳转进度的方法seek
  seekPlay(value: number) {
    this.player?.seek(value)
  }

  //暂停
  paused() {
    this.player?.pause()
    this.currentSong.isPlay = false
    sessionManager.setAvPlayBackState()

  }

  //上一首
  prevPlay() {
    if (this.currentSong.playMode == 'random') {
      //   随机
      this.currentSong.playIndex =
        Math.floor(Math.random() * this.currentSong.playList.length) //random()  -->[0,1) 随机小数 floor()向下取整


    } else {
      this.currentSong.playIndex--
      if (this.currentSong.playIndex < 0) {
        //去最后一首
        this.currentSong.playIndex = this.currentSong.playList.length - 1
      }


    }
    this.singPlay((this.currentSong.playList[this.currentSong.playIndex]))
  }

  nextPlay(autoNextPlay?: boolean) {

    // 下一首  根据 播放模式 计算索引  播放 if
    // 真的重复播放 ->播放模式为repeat 并且自动播放下一首 --completed-->传入一个参数 表示是自动结束的
    //随机 随机索引
    // 列表循环  index++
    if (this.currentSong.playMode === 'repeat' && autoNextPlay) {
      // 循环播放
      this.currentSong.playIndex === this.currentSong.playIndex

    } else if (this.currentSong.playMode === 'random') {
      //随机播放
      this.currentSong.playIndex =
        Math.floor(Math.random() * this.currentSong.playList.length) //random()  -->[0,1) 随机小数 floor()向下取整


    } else {
      // 列表
      this.currentSong.playIndex++
      if (this.currentSong.playIndex >= this.currentSong.playList.length) {
        //去第一首
        this.currentSong.playIndex = 0
      }
    }
    this.singPlay((this.currentSong.playList[this.currentSong.playIndex]))
  }

  // 列表移除歌曲
  removeSong(index: number) {
    if (index === this.currentSong.playIndex) {
      //   删除正在播放的
      if (this.currentSong.playList.length > 1) {
        //   当前播放列表有多首歌
        this.currentSong.playList.splice(index, 1)
        // 播放索引如果大于等于播放列表的长度回到第一首位置播放
        if (this.currentSong.playIndex >= this.currentSong.playList.length) {
          this.currentSong.playIndex = 0
        }
        //按照新索引找个歌曲播放一下
        this.singPlay(this.currentSong.playList[this.currentSong.playIndex])
      } else {
        //   当前播放列表只有一首 歌曲  数据要重置 播放器要重置
        this.player?.reset()
        this.currentSong.reset() //重置数据
        // pageStack.pop()


      }

    } else {
      //   删除不是正在播放的歌曲
      if (index < this.currentSong.playIndex) {
        //   删除的在正在播放歌曲的前面
        this.currentSong.playIndex--
      }
      //移除一首歌曲  参数1 删除的索引 参数2 删除个数
      this.currentSong.playList.splice(index, 1)
    }
  }

  //释放播放器 和 播放数据
  async release() {
    await this.player?.release()
  }
}

export const playerManager: AvPlayerManager = new AvPlayerManager()