@ComponentV2
struct HotQuestion {
  build() {
    Scroll(){
      Row({space:10}){
        scrollItem()
        scrollItem()
        scrollItem()
        scrollItem()
      }
    }
    .width('100%')
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
  }
}

@Builder
function scrollItem(){
  Column() {
    Text('鸿蒙NEXT').fontColor('#fff')
      .width('100%')
    Text('热门面试题').fontSize(12).fontColor('#fff')
      .width('100%')
  }
  .width(150)
  .height(120)
  .backgroundColor('#ccc')
  .linearGradient({
    angle:0,
    colors: [['#ff97d4c5',0],['#ff8941dd',1.0]]
  })
  .borderRadius(20)
  .padding(10)
  .backgroundImage($r('app.media.card01'))
  .backgroundImageSize({width:60,height:60})
  .backgroundImagePosition({x:80,y:55})
}

export { HotQuestion }