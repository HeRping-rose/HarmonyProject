
import { CartGoods, CartGoodsModel } from "basic"

@ComponentV2
export struct CartItem {
  @Param
  cart: CartGoodsModel = new CartGoodsModel({} as CartGoods) //
  @Event
  onChangeSelected: (selected: boolean) => void = () => {

  }
  @Event
  onChangeCount: (count: number) => void = () => {

  }

  build() {
    Row({ space: 10 }) {

      Checkbox()
        .selectedColor($r('[basic].color.red'))
        .size({ width: 14, height: 14 })
        .select(this.cart.selected)// 和上级的item公用的是一个数据
        .onChange((val) => {
          // 取反
          this.cart.selected = !this.cart.selected // 改的是本地的
          this.onChangeSelected(val)

        })
        .onClick(()=>{


        })
      Image(this.cart.picture)
        .width(80)
        .height(80)
        .syncLoad(true)
      Column({ space: 8 }) {
        Text(this.cart.name)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontSize(14)
          .fontColor($r('[basic].color.black'))
          .width('100%')
        Row() {
          Text(this.cart.attrsText)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
            .fontSize(12)
            .fontColor($r('[basic].color.text'))
            .layoutWeight(1)
          Image($r('sys.media.ohos_ic_public_arrow_down'))
            .fillColor($r('[basic].color.gray'))
            .width(16)
            .height(16)
        }
        .padding({ left: 6, right: 4 })
        .width(100)
        .height(24)
        .backgroundColor($r('[basic].color.under'))
        .borderRadius(2)

        Row() {
          Text(`¥${this.cart.price}`)
            .fontSize(14)
            .fontWeight(500)
          Counter() {
            Text(this.cart.count.toString())
          }
          .enableDec(this.cart.count > 1)
          .onInc(() => {
            this.cart.count++
            this.onChangeCount(this.cart.count)
          })
          .onDec(() => {
            this.cart.count--
            this.onChangeCount(this.cart.count)
          })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height(100)
    .padding(10)
    .border({ width: { bottom: 0.5 }, color: '#e4e4e4' })
    .backgroundColor($r('[basic].color.white'))
  }
}