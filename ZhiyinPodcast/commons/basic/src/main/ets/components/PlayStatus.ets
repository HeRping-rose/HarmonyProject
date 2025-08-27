import { HMRouterMgr } from "@hadss/hmrouter"
import { PAGE_PATH } from "../constants"

@ComponentV2
export struct PlayStatus {
  build() {
    //播放栏
    Column() {
      Row({space:10}) {
        Image($r('app.media.swiper1'))
          .width(50).aspectRatio(1).borderRadius(10)
          .margin({ right: 16 })
          .onClick(() => {
            HMRouterMgr.push({
              pageUrl: PAGE_PATH.PLAY_PAGE
            })
          })
        Column({space:5}) {
          Text('最近上新')
            .fontSize(18)
            .fontColor('#333333')
          Text('00:00/60:00')
        }.layoutWeight(1).alignItems(HorizontalAlign.Start)
        Row({space:2}){
          Image($r('app.media.ic_like')).width(24).aspectRatio(1).fillColor('#ffb5b2b2')
          Image($r('app.media.ic_play')).width(30).aspectRatio(1).fillColor('#ffb5b2b2')
          Image($r('app.media.ic_pod')).width(22).aspectRatio(1).fillColor('#ffb5b2b2')
        }
      }.width('100%')
      .margin({right: 16,left: 16})
    }
    .borderRadius(10)
    .backgroundColor('#e6eeff')

  }
}