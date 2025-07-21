import { SortType } from "../../../models"

@ComponentV2
struct FilterButton {
  @Param text: string = ''
  @Param isNew: boolean = false
  @Param isSort: boolean = false
  @Param isSelect: boolean = false
  @Param sort:SortType= SortType.Default

  build() {
    Row() {
      Text(this.text)
        .fontSize(12)
        .fontColor($r(this.isSelect ? 'app.color.common_main_color' :'app.color.black'))
      if (this.isNew) {
        Image($r('app.media.ic_home_new'))
          .width(32)
          .height(14)
          .objectFit(ImageFit.Contain)
          .position({ right: -26, top: -7 })
      }
      if (this.isSort) {
        Column() {
          if (this.isSelect) {
            Image(
              this.sort % 2 === 0
                ? $r('sys.media.ohos_ic_public_arrow_up')
                : $r('sys.media.ohos_ic_public_arrow_down')
            )
              .size({ width: 12, height: 6 })
              .fillColor($r('app.color.common_main_color'))
          } else {
            Image($r('sys.media.ohos_ic_public_arrow_up'))
              .size({ width: 12, height: 6 })
            Image($r('sys.media.ohos_ic_public_arrow_down'))
              .size({ width: 12, height: 6 })
          }
        }
        .margin({ top: -0.5, left: 2 })
      }
    }
    .height(30)
    .padding({ left: 10, right: 10 })
    .backgroundColor($r('app.color.common_gray_bg'))
    .borderRadius(4)
    .margin({ top: 12, right: this.isNew ? 26 : 10 })
  }
}

export { FilterButton }