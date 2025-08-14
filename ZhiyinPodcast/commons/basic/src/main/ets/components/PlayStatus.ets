@ComponentV2
export struct PlayStatus {
  build() {
    //播放栏
    Column() {
      Row({space:10}) {
        Image($r('app.media.swiper1'))
          .width(60).aspectRatio(1).borderRadius(10)
          .margin({ right: 16 })
        Column() {
          Text('最近上新')
            .fontSize(18)
            .fontColor('#333333')
          Text('00:00/60:00')
        }.layoutWeight(1).alignItems(HorizontalAlign.Start)
        Image($r('app.media.ic_like')).width(24).aspectRatio(1)
        Image($r('app.media.ic_play')).width(30).aspectRatio(1)
        Image($r('app.media.ic_pod')).width(24).aspectRatio(1)
      }.width('100%')
      .margin({right: 16,left: 16})
    }
    .borderRadius(10)
    .backgroundColor('#e6eeff')

  }
}