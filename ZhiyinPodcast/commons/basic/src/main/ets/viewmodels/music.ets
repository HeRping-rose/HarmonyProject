export interface SongItemType {
  img: string
  name: string
  author: string
  url: string
  id: string
}

@ObservedV2
//类属性观测变化  直接观测 深层观测  与@trace一起使用
export class GlobalMusic {
  @Trace img: string = '' // 音乐封面
  @Trace name: string = '' // 音乐名称
  @Trace author: string = '' //作者
  @Trace url: string = '' //当前播放链接
  @Trace time: number = 0 //播放时间
  @Trace duration: number = 0 //歌曲总时长


  //博方歌曲列表
  @Trace playIndex: number = 0 // 当前播放索引
  @Trace playList: SongItemType[] = [] //播放歌曲列表

  //播放和暂停
  @Trace isPlay: boolean = false //播放的状态

  //播放模式
  @Trace playMode: 'auto' | 'random' | 'repeat' = 'auto'

  //重置数据的方法reset
  reset() {
    this.img = '' // 音乐封面
    this.name = '' // 音乐名称
    this.author = '' //作者
    this.url = '' //当前播放链接
    this.time = 0 //播放时间
    this.duration = 0 //歌曲总时长
    this.playIndex = 0 // 当前播放索引
    this.playList = [] //播放歌曲列表
    this.isPlay = false //播放的状态
    this.playMode = 'auto'
  }
}