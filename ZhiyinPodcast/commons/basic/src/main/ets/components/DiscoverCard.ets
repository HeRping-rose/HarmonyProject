// DiscoverCard.ets
@ComponentV2
export struct DiscoverCard {
  @Param coverImage: ResourceStr = '';
  @Param updateStatus: string = '';
  @Param title: string = '';
  @Param subtitle: string = '';
  @Param playCount: number = 0;

  build() {
    Column() {
      // 封面图 + 更新状态
      Row() {
        Stack({alignContent:Alignment.Bottom}){
          Image(this.coverImage)
            .width(140)
            .height(140)
            .borderRadius(12)
            .margin({ left: 16, right: 12 })

          Row() {
            Text(this.updateStatus)
              .fontSize(12)
              .fontColor(Color.Blue)
              .alignSelf(ItemAlign.Start)
              .textAlign(TextAlign.Center)
              .padding({top:12})
          // 播放按钮
          Image($r('app.media.ic_play'))
            .width(30).aspectRatio(1)
            .borderRadius(60)
            .onClick(() => {
              console.log("Playing: " + this.title);
            })
            .alignSelf(ItemAlign.End)
          }.justifyContent(FlexAlign.SpaceBetween)
          .width(140)
        }
      }
      .alignItems(VerticalAlign.Center)
      .padding({ top: 16, bottom: 16 })

      // 标题 + 描述
      Column(){
        Text(this.title)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .maxLines(2)

        Text(this.subtitle)
          .fontSize(14)
          .fontColor(Color.Gray)
          .maxLines(2)
      }.width('100%')
      .alignItems(HorizontalAlign.Start)

    }
    .width('100%')
    .padding({ left: 16, right: 16 })
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ bottom: 16 })
  }
}
