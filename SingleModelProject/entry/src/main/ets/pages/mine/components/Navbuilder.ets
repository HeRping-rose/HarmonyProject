import { Nav } from '../utils'

// @Component
// struct navBuilder {
//
//   build() {
//
//   }
// }

@Builder
function navBuilder(nav: Nav)
{
  GridCol() {
    Column() {
      Image(nav.icon)
        .width(30)
        .aspectRatio(1)
        .margin({ bottom: 10 })
      Text(nav.name)
        .fontSize(14)
        .fontColor($r('app.color.common_gray_03'))
        .margin({ bottom: 4 })
      if (nav.other) {
        Row() {
          Text(nav.other)
            .fontSize(12)
            .fontColor($r('app.color.common_gray_01'))
          Image($r('sys.media.ohos_ic_public_arrow_right'))
            .width(12)
            .aspectRatio(1)
            .fillColor($r('app.color.common_gray_01'))
        }
      }
    }
    .onClick(() => {
      nav.onClick && nav.onClick()
    })
  }
}

export { navBuilder }