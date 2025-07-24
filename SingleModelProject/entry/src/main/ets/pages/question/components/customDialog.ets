@CustomDialog
export struct  myCustomDialog {
  // 需需要声明一个控制 必须要有
  controller:CustomDialogController
  build() {
    Column(){
      LoadingProgress()
        .width(50)
        .height(50)
        .color("#fff")
      Text('Loading...')
        .fontSize(12)
        .fontColor('#fff')


    }
    // .width('80%')
    .height(90)
    .width(90)
    .borderRadius(20)
    .backgroundColor('rgba(0,0,0,0.3)')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }

  }