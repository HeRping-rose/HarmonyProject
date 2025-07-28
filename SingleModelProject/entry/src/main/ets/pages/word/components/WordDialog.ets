// createAvPlayer() 创建 一个播放器
//idle (空闲| 状态 )只是创建 了不知道要加载什么内容的状态
// reset  重置URL地址 (切换下一个 音视频)
//initialized 初始化状态  在这一步我们会加上在播放的URL地址 会进入 预加载的状态
// surfaceId 视频播放时当前这一帧画面的唯一标识符
// prepared (已经进入准备就绪状态)  -->就可以执行播放暂停
// seek(3000)  跳转到整个音频的3000毫秒位置 滑块
// play() 播放 stop():回到开头   pause() 暂停在某个位置
// playing 状态  seek ()  eos:音视屏播放结束标志
// completed 完成状态  --> 播放结束  --> 播放完成
// release 释放播放器  节约资源
// on::stateChange 状态改变触发的事件
import { media } from "@kit.MediaKit"

@CustomDialog
export struct WordDialog {
  controller: CustomDialogController
  @Prop en: string = ''
  @Prop zh: string = ''
  avPlayer:media.AVPlayer|null=null

  async audioManage(){
    // 1. 创建播放器
    let avPlayer =await  media.createAVPlayer()
    //3. 监测 onStateChange 当状态改变会绘触发的时间
    avPlayer.on("stateChange",state=>{
      //得到的state状态取决定做某事
      if(state==='initialized'){
        //播放器初始化状态  go on 去执行 prepare()执行 让播放器准备就绪
        avPlayer.prepare()
      }else if(state==='prepared'){
        //播放器准备就绪状态  go on 去执行 play()执行 让播放器开始播放 |停止
        avPlayer.loop=true  //循环播放
        avPlayer.play()
      }
      // else if(state==='playing'){
      //   //播放器正在播放状态  go on 去执行 pause()执行 让播放器暂停播放
      //   avPlayer.pause()
      // }else if(state==='paused'){
      //   //播放器暂停播放状态  go on 去执行 stop()执行 让播放器停止播放
      //   avPlayer.stop()
      // }else if(state==='completed'){}
      this.avPlayer=avPlayer //拿到外部去用
    })

    //2. 制定 URL地址
    avPlayer.url= `https://dict.youdao.com/dictvoice?type=1&audio=${this.en}`
  }

  // 一进入页面 就播放音频
  aboutToAppear(): void {
    this.audioManage()

  }
  aboutToDisappear(): void {
    //一离开页面 就停止播放并释放 内存
    if(this.avPlayer){
      this.avPlayer.stop()
      this.avPlayer.release()
    }
  }


  build() {
    Column({ space: 10 }) {
      Row({ space: 10 }) {
        Text(this.en)
          .fontSize(20)
          .fontColor($r('app.color.white'))
          .fontWeight(500)
        WordSoundComp()
      }

      Text(this.zh)
        .fontColor($r('app.color.white'))
    }
    .constraintSize({ minWidth: 175 })
    .padding({ left: 16, right: 16 })
    .height(90)
    .borderRadius(45)
    .backgroundColor('#8f000000')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct WordSoundComp {
  @State flag: boolean = false
  timerId?: number

  aboutToAppear(): void {
    this.timerId = setInterval(() => {
      this.flag = !this.flag
    }, 500)
  }

  aboutToDisappear(): void {
    clearInterval(this.timerId)
  }

  build() {
    Image($r('sys.media.ohos_ic_public_sound'))
      .width(20)
      .aspectRatio(1)
      .fillColor(this.flag ? $r('app.color.common_green') : $r('app.color.white'))
  }
}