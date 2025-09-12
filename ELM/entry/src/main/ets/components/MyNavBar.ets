@ComponentV2
export  struct MyNavBar {
  @Param title: string = 'MyNavBar';
  @BuilderParam left: () => void= this.customBuilder;
  @BuilderParam right: () => void= this.customBuilder;

  @Builder
  customBuilder() {
  }
  build() {
    Row(){
      //左 返回
      Row(){
        this.left()
      }.margin({left: 10})
      .width(100)
      //标题
      Text(this.title).fontColor('#fff')
      //右
      Row() {
        this.right()
      }
      .margin({ right: 10 })
      .width(100)
      .justifyContent(FlexAlign.End)


    }.width('100%')
    .height(50)
    .backgroundColor($r('app.color.main_color'))
    .justifyContent(FlexAlign.SpaceBetween)
  }
}