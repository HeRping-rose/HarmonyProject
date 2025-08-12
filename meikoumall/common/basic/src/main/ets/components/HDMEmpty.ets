@Preview
@ComponentV2
export struct HDMEmpty {
  @Param
  icon: ResourceStr = $r("app.media.ic_public_empty")
  @Param
  tip: string = "空空如也"
  @Param
  buttonText: string = "去逛逛"
  @Event
  onBtnClick: () => void = () => {
  }

  build() {
    Column({ space: 20 }) {
      Image(this.icon)
        .width(120)
        .aspectRatio(1)
      Text(this.tip)
        .fontSize(12)
        .fontColor($r("app.color.gray"))
      Button(this.buttonText)
        .height(30)
        .fontSize(12)
        .padding({ left: 10, right: 10 })
        .fontColor($r("app.color.white"))
        .linearGradient({
          angle: 90,
          colors: [['#FD3F8F', 0], ['#FF773C', 1]]
        })
        .onClick(() => {
          this.onBtnClick()
        })
    }
    .justifyContent(FlexAlign.Center)
    .width("100%")
    .padding({
      top: 20,
      bottom: 80
    })
  }
}