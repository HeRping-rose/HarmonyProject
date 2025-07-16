@Entry
@ComponentV2
struct Food {
  build() {
    Column() {
      Text('Food')
      Button('返回上一个窗口').onClick(() => {
      })
    }
    .height('100%')
    .width('100%')
  }
}