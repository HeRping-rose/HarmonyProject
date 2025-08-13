import { HMRouter, HMRouterMgr } from "@hadss/hmrouter";
import { AppSafeArea, GlobalVariable, PAGE_PATH } from "basic";
import { webview } from "@kit.ArkWeb";
import { AppStorageV2 } from "@kit.ArkUI";
import { DialogHelper, SpinType } from "@pura/harmony-dialog";

@HMRouter({ pageUrl: PAGE_PATH.PAY_PAGE })
@ComponentV2
export struct PayView {
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  controller: webview.WebviewController = new webview.WebviewController()
  orderId: string = "" // 订单号
  dialogKey: string = "" // 弹层的key

  aboutToAppear(): void {
    this.orderId = HMRouterMgr.getCurrentParam() as string
    this.openDialog()
  }

  async openDialog() {
    this.dialogKey = DialogHelper.showLoadingDialog({
      loadColor: Color.White,
      loadSize: 40,
      backgroundColor: '#BB000000',
      content: "正在唤起支付…",
      fontSize: 18,
    })
  }

  build() {
    Column() {
      // Web({
      //   src: `${GlobalVariable.BASE_URL}/pay/wap/aliPay?orderId=${this.orderId}`,
      //   controller: this.controller
      // }).onPageEnd(() => {
      //   DialogHelper.closeDialog(this.dialogKey)
      // })
      Button('已经支付完成')
        .onClick(() => {
          HMRouterMgr.push({
            pageUrl:PAGE_PATH.PAY_RESULT_PAGE,
            param:{
              orderId:this.orderId,
              payResult:true
            }

          })
        })
    }
    .width("100%")
    .height("100%")
    .padding({
      top: this.safeArea.topHeight,
      bottom: this.safeArea.bottomHeight
    })

  }
}