import { OrderSku } from "basic"

// 订单信息
@ComponentV2
export struct OrderSkuComp {
  @Param goods: OrderSku={} as OrderSku

  build() {
    Row({ space: 10 }) {
      Image(this.goods.image)
        .width(80)
        .height(80)
      Column({ space: 10 }) {
        Text(this.goods.name)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontColor($r('[basic].color.black'))
          .fontSize(14)
          .width('100%')
        Text(this.goods.attrsText)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
          .fontColor($r('[basic].color.text'))
          .fontSize(14)
      }
      .justifyContent(FlexAlign.Start)
      .layoutWeight(1)
      .height(80)

      Column({ space: 10 }) {
        Text('¥' + this.goods.curPrice)
          .fontSize(14)
          .fontColor($r('[basic].color.black'))
        Text('x' + this.goods.quantity)
          .fontSize(14)
          .fontColor($r('[basic].color.gray'))
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.End)
      .width(70)
      .height(80)
    }
    .padding({ top: 10, bottom: 10 })
  }
}
