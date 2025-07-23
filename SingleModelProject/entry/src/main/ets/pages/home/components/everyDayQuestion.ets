import { GetDate, Idate } from "../utils/GetDate"

@ComponentV2
struct everyDayQuestion {
  @Local date: Idate = {month: '', day:'' }
  aboutToAppear(): void {
    this.date = GetDate()
  }
  build() {
    Column(){
      Row(){
        Column(){
          Text(this.date.month).fontColor(Color.Red)
          Text(this.date.day.toString())
        }.backgroundColor('#fff').borderRadius(20).width(60).height(90)
        .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center)
        .translate({x: 10, y: -13})
        .shadow({
          color:'#666',
          radius:100,
          offsetX:5,
          offsetY:5,
        })
        Column({space:5}){
          Text('每日一题')
          Text('ArkTs语言开发注意事项是什么?')
        }
        .alignItems(HorizontalAlign.Start)
        .width(200)
        .translate({x:40})
      }
      .borderRadius(20)
      .width('100%')
      .backgroundColor('#edecf2')
      .backgroundImage($r('app.media.card04'))
      .backgroundImagePosition({x:300,y:50})
    }
    .width('100%')
    .padding(12)
  }
}

export { everyDayQuestion }