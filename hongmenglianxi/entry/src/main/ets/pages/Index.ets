// import { PictureManagerComponent } from './components/PictureManager';
import { PictureManagerComponent } from '../components/PictureManager';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      PictureManagerComponent()
    }
    .height('100%')
    .width('100%')
  }
}