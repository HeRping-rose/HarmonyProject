import { OrderItem, OrderSku } from "basic"
import { OrderSkuComp } from "./OrderSkuComp"

@ComponentV2
export struct OrderItemComp {
  @Param order: OrderItem={} as OrderItem
  timer: number = 0
  @Local countDown: string = ''

  @Builder
  StateBuilder() {
    if (this.order.orderState === 1) {
      Row() {
        Text('待付款')
          .textAlign(TextAlign.Center)
          .width(50)
          .fontColor($r('[basic].color.white'))
          .fontSize(11)
          .height(18)
          .borderRadius({ bottomRight: 9 })
          .linearGradient({
            angle: 90,
            colors: [[$r('[basic].color.linear_begin'), 0], [$r('[basic].color.linear_end'), 1]]
          })
        Text(this.countDown)
          .textAlign(TextAlign.Center)
          .width(60)
          .fontSize(11)
          .fontColor($r('[basic].color.red'))
      }
      .backgroundColor('#FFDEE2')
      .height(18)
      .borderRadius(9)
      .clip(true)
    } else if (this.order.orderState === 2) {
      Text('待发货')
        .fontSize(12)
        .fontColor($r('[basic].color.red'))
    } else if (this.order.orderState === 3) {
      Text('待收货')
        .fontSize(12)
        .fontColor($r('[basic].color.red'))
    } else if (this.order.orderState === 4) {
      Text('待评价')
        .fontSize(12)
        .fontColor($r('[basic].color.black'))
    } else if (this.order.orderState === 5) {
      Text('已完成')
        .fontSize(12)
        .fontColor($r('[basic].color.black'))
    } else if (this.order.orderState === 6) {
      Text('已取消')
        .fontSize(12)
        .fontColor($r('[basic].color.gray'))
    }
  }

  @Builder
  ButtonBuilder() {
    Row({ space: 10 }) {
      if ([5, 6].includes(this.order.orderState)) {
        Button('删除订单')
          .whiteStyle()
          .onClick(() => {
            // TODO
          })
      }
      if ([5].includes(this.order.orderState)) {
        Button('查看评价')
          .whiteStyle()
          .onClick(() => {
            // TODO
          })
      }
      if ([3, 4, 5].includes(this.order.orderState)) {
        Button('查看物流')
          .whiteStyle()
          .onClick(() => {
            // router.pushUrl({ url: 'pages/OrderLogisticsPage' })
          })
      }
      if ([1].includes(this.order.orderState)) {
        Button('取消订单')
          .whiteStyle()
          .onClick(() => {
            // TODO
          })
      }
      if ([1].includes(this.order.orderState)) {
        Button('立即付款')
          .redStyle()
          .onClick(() => {
            // TODO
          })
      }
      if ([2, 5, 6].includes(this.order.orderState)) {
        Button('再次购买')
          .redStyle()
          .onClick(() => {
            // TODO
          })
      }
      if ([3].includes(this.order.orderState)) {
        Button('确认收货')
          .redStyle()
          .onClick(() => {
            // TODO
          })
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.End)
  }

  build() {
    Row() {
      Column() {
        Row() {
          Text(this.order.createTime)
            .fontSize(12)
            .fontColor($r('[basic].color.gray'))
          this.StateBuilder()
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        ForEach(this.order.skus, (sku: OrderSku) => {
          OrderSkuComp({ goods: sku })
        })

        Text('实付款：¥' + this.order.payMoney)
          .fontWeight(500)
          .fontColor($r('[basic].color.black'))
          .alignSelf(ItemAlign.End)
          .padding({ top: 10, bottom: 10 })

        this.ButtonBuilder()
      }
      .padding(10)
      .borderRadius(8)
      .backgroundColor($r('[basic].color.white'))
    }
    .padding({ left: 8, right: 8 })
  }
}

// 扩展按钮
@Extend(Button)
function whiteStyle() {
  .fontWeight(400)
  .fontSize(14)
  .height(30)
  .backgroundColor($r('[basic].color.white'))
  .fontColor($r('[basic].color.black'))
  .padding({
    left: 10,
    right: 10,
    top: 0,
    bottom: 0
  })
  .border({ width: 0.5, color: $r('[basic].color.border') })
}

@Extend(Button)
function redStyle() {
  .fontWeight(400)
  .fontSize(14)
  .height(30)
  .padding({
    left: 10,
    right: 10,
    top: 0,
    bottom: 0
  })
  .backgroundColor($r('[basic].color.red'))
}
