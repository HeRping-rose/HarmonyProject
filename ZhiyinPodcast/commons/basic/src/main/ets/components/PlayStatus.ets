import { HMRouterMgr } from "@hadss/hmrouter"
import { PAGE_PATH } from "../constants"
import { AnimationInfo } from "../viewmodels";
import { AnimatorResult } from "@kit.ArkUI";

@ComponentV2
export struct PlayStatus {
  @Local isPlay:boolean=true
  @Local animationInfo: AnimationInfo=new AnimationInfo();
  @Param animatorObject: AnimatorResult|null=null;
  build() {
    //播放栏
    Row({space:8}) {
      Image($r('app.media.swiper1'))
        .width(50).aspectRatio(1).borderRadius(10)
        .margin({ right: 8 })
        .onClick(() => {
          HMRouterMgr.push({
            pageUrl: PAGE_PATH.PLAY_PAGE
          })
        })
      Column({space:5}) {

        Row(){
          Text('第57次取消发送')
            .fontSize(16)
            .fontColor('#333333')
          Text('-')
            .fontSize(16)
            .fontColor('#333333')
          Text('白允y')
            .fontSize(16)
            .fontColor('#666666')
        }

        //时间进度条
        Text('00:00/00:00')
          .fontSize(12)
      }.layoutWeight(1).alignItems(HorizontalAlign.Start)
      Row({space:16}){
        // Image($r('app.media.ic_like')).width(24).aspectRatio(1).fillColor('#ffb5b2b2')
        Image(this.isPlay?$r('app.media.ic_play'):$r('app.media.ic_paused')).width(24).aspectRatio(1).fillColor('#ffb5b2b2')
        Image($r('app.media.ic_next'))
          .width(24).aspectRatio(1)
          .fillColor('#ffb5b2b2')
          .onClick(() => {
            AlertDialog.show({
              message: '目前还没开发',
              alignment: DialogAlignment.Center
            });
          })
        Image($r('app.media.ic_pod')).width(20).aspectRatio(1).fillColor('#ffb5b2b2')
          .margin({right:16})
      }
    }.width('100%')
    .margin({right: 16,left: 16})
    .borderRadius(10)
    .backgroundColor('#e6eeff')
    .opacity(this.animationInfo.miniPlayerOpacity)
    .id('mini')
    .onClick(() => {
      if (this.animatorObject) {
        // 计算Mini条距离屏幕底部的高度（Mini条高度+TabBar高度+底部非安全区域高度（导航栏高度））
        this.animationInfo.miniDistanceToBottom =
          48 + 56 + this.animationInfo.bottomUnsafeHeight;
        // Mini条实际歌曲封面的透明度
        this.animationInfo.miniImgOpacity = 0;
        // 用于动画的Mini条歌曲封面的透明度
        this.animationInfo.miniImgAnimateOpacity = 1;
        // TODO 知识点：通过play()启动动画。
        // 启动动画。这里为展开动画。
        this.animatorObject.play();
        this.animationInfo.isAnimating = true;
      }
    })

  }
}