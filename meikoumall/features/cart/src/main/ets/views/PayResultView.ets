import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'
import { HDMGuessGoods, HDMNavBar, PAGE_PATH } from 'basic'

interface PayResultParams {
  orderId: string
  payResult: boolean
}

@HMRouter({ pageUrl: PAGE_PATH.PAY_RESULT_PAGE })
@ComponentV2
export struct PayResultView {
  @Local
  payResult: boolean = false
  @Local
  orderId: string = ''

  aboutToAppear(): void {
    const params = HMRouterMgr.getCurrentParam() as PayResultParams
    if (params) {
      //https://meikou-api.itheima.net/pay/redirect?payResult=true&orderId=订单 id
      this.orderId = params.orderId
      this.payResult = params.payResult
      // 清空路由栈

    }
  }

  build() {
    Column() {
      HDMNavBar({
        title: this.payResult ? '付款成功' : '付款失败', onLeftClick: () => {
          HMRouterMgr.pop()
        }
      })
      List() {
        ListItem() {
          Column({ space: 20 }) {
            Image(this.payResult ? $r('[basic].media.ic_public_check_filled') :
            $r('[basic].media.ic_public_close_filled'))
              .width(60)
              .height(60)
              .fillColor(this.payResult ? '#00C1BF' : '#B0171F')
            Text(this.payResult ? '付款成功' : '付款失败')
            Row({ space: 20 }) {
              Button('返回首页')
                .backgroundColor($r('[basic].color.black'))
                .fontSize(14)
                .height(36)
                .onClick(() => {

                })
              Button('查看订单')
                .fontSize(14)
                .height(36)
                .backgroundColor($r('[basic].color.white'))
                .fontColor($r('[basic].color.black'))
                .border({ width: 0.5, color: $r('[basic].color.border') })
                .onClick(() => {
                  //查看订单
                  HMRouterMgr.push({
                    pageUrl: PAGE_PATH.ORDER_PAGE
                  })

                })
            }
            .width('100%')
            .justifyContent(FlexAlign.Center)
          }
          .padding(40)
          .backgroundColor($r('[basic].color.under'))
        }

        ListItem() {
          HDMGuessGoods()
            .height("100%")
        }
      }
      .layoutWeight(1)
      .height('100%')
      .width('100%')
      .scrollBar(BarState.Off)
    }

  }
}