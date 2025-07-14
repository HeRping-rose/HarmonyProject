
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
        .width('100%')
        .textAlign(TextAlign.Center)
        .height('100%')
      Button('change')
    }
  }
}