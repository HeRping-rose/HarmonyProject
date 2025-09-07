import { MiniPlayerAnimation } from '../view/MiniPlayerAnimation';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column(){
      MiniPlayerAnimation()
    }
    .height('100%')
    .width('100%')
  }
}