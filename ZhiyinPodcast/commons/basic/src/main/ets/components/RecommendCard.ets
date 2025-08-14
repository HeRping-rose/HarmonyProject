// RecommendCard.ets
@ComponentV2
export struct RecommendCard {
  @Param coverImage: ResourceStr = '';
  @Param playCount: number = 0;
  @Param title: string = '';
  @Param subtitle: string = '';
  @Param tag: string = '';
  @Param author: string = '';

  build() {
    Column() {
      Row({space:20}) {
        Stack({alignContent:Alignment.BottomEnd}){
          Image(this.coverImage)
            .width(100)
            .height(100)
            .borderRadius(8)
            .margin({ left: 16, right: 12 })
          Text(`${this.playCount}W`)
            .fontSize(12)
            .fontColor(Color.Blue)
            .margin({ bottom: 4 , left: 16, right: 12})
        }

        Column({space:10}) {
          Text(this.title)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .maxLines(2)

          Text(this.subtitle)
            .fontSize(14)
            .fontColor(Color.Gray)
          Row({space:10}){
            Text(this.author).fontSize(12)
            .fontColor(Color.Gray)
            // 标签
            Text(this.tag)
              .fontSize(12)
              .fontColor(Color.Blue)
              .padding({ left: 8, right: 8 })
              .backgroundColor(Color.Blue)
              .opacity(0.1)
              .borderRadius(4)
              .margin({ top: 4 })
          }


        }.alignItems(HorizontalAlign.Start)
      }
      .alignItems(VerticalAlign.Center)
      .padding({ top: 16, bottom: 16 })
    }
    .width('100%')
    .padding({ left: 16, right: 16 })
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ bottom: 16 })
  }
}
