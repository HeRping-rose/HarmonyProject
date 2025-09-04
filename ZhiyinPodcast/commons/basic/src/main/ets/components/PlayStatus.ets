import { HMRouterMgr } from "@hadss/hmrouter"
import { PAGE_PATH } from "../constants"

@ComponentV2
export struct PlayStatus {
  build() {
    //播放栏
    Column() {
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
          Image($r('app.media.ic_play')).width(30).aspectRatio(1).fillColor('#ffb5b2b2')
          Image($r('app.media.ic_pod')).width(20).aspectRatio(1).fillColor('#ffb5b2b2')
            .margin({right:16})
        }
      }.width('100%')
      .margin({right: 16,left: 16})
    }
    // .padding({left: 16,right: 16})
    .borderRadius(10)
    .backgroundColor('#e6eeff')

  }
}