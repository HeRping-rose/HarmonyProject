// PodcastCard.ets
@ComponentV2
export struct PodcastCard {
  @Param title: string=''
  @Param subtitle: string='';
  @Param coverImage: ResourceStr='';
  @Param playCount: number=0;
  @Param episode: string='';

  build() {
    Column() {
      Row({space:10}) {
        Row(){
          Image(this.coverImage)
            .width(100)
            .height(100)
            .borderRadius(8)
            .margin({ left: 16, right: 12 })

          Column({space:5}) {
            Text(this.title)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .maxLines(2)

            Text(this.subtitle)
              .fontSize(14)
              .fontColor(Color.Gray)

            Row() {
              Image($r('app.media.ic_play'))
                .width(16)
                .height(16)
                .margin({ right: 4 })
              Text(`${this.playCount}`)
                .fontSize(14)
                .fontColor(Color.Gray)
            }

            Text(this.episode)
              .fontSize(12)
              .fontColor(Color.Blue)
              .margin({ top: 4 })
          }
          .width('50%')
          .alignItems(HorizontalAlign.Start)
        }

        // 播放按钮
        Image($r('app.media.ic_play'))
          .width(40)
          .height(40)
          .borderRadius(8)
          .onClick(() => {
            // 播放逻辑
            console.log("Playing: " + this.title);
          })
          .margin({ top: 8, right: 16 })
          .alignSelf(ItemAlign.Center)
      }
      .width('100%')
      .padding({ top: 16, bottom: 16 })
      .justifyContent(FlexAlign.SpaceBetween)


    }
    .width('100%')
    .padding({ left: 16, right: 16 })
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ bottom: 16 })
  }
}
