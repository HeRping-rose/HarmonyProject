import { HDMGuessGoods, HDMNavBar, CartGoodsModel, AppBreakPoint, AppSafeArea, auth, HDMEmpty, PAGE_PATH,
  GlobalVariable,
  getCartListAPI,
  authCart,
  updateCartAPI,
  selectOrUnSelectAPI,
  SelectCartParams,
  AppCart,
  delCartAPI} from 'basic'
import { CartItem } from '../components'
import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'
import { AppStorageV2, PersistenceV2 } from '@kit.ArkUI'
import { emitter } from '@kit.BasicServicesKit'


@HMRouter({ pageUrl: PAGE_PATH.CART })
@ComponentV2
export struct CartView {
  // 用户信息
  user =auth.getUser()
  // 商品信息
  breakPointClass: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  // @Local cartList: CartGoodsModel[] = []
  // @Local cartList: CartGoodsModel[] = authCart.getCartList()
  @Local appCart: AppCart = AppStorageV2.connect(AppCart, () => new AppCart())!
  @Local selected: boolean = false
  // 获取购物车数据
  async getCartList(){
    let res =await getCartListAPI()
    this.appCart.cartList = res.map(item => new CartGoodsModel(item))
  }

  // 检查是否全选中
  @Computed
  get isCheckAll() {
    //整个列表中所有列表都为真返回真
    return this.appCart.cartList.every(item => item.selected)
  }
  @Computed
  get totalPrice(){
    return this.appCart.cartList.filter(item => item.selected).reduce((acc, item) => acc+=item.price * item.count, 0)
  }

  aboutToAppear(): void {
    // this.getCartList()

  }

  @Builder
  DeleteBuilder(cart: CartGoodsModel) {
    Text('删除')
      .fontSize(14)
      .width(60)
      .height(100)
      .backgroundColor($r('[basic].color.red'))
      .fontColor($r('[basic].color.white'))
      .textAlign(TextAlign.Center)
      .onClick(async () => {
        // 删除 购物车中的当前商品
        delCartAPI({ids:[cart.skuId ]  } )
        authCart.updateCartCount()

      })
  }

  onCheckOrder() {
    AlertDialog.show({
      message: '去结算'
    })
  }

  build() {
    Column() {
      HDMNavBar({
        onLeftClick: () => {
          // this.stackPath.pop()
          // emitter.emit(GlobalVariable.SWITCH_TAB, { data: { index: 0 } })
          HMRouterMgr.pop()

        },
        title: '购物袋',
        showRightIcon: true
      })
        .border({
          width: { bottom: 0.5 },
          color: '#e4e4e4'
        })

      List() {
        if (this.user.token) {

          if (this.appCart.cartList.length) {
            ForEach(this.appCart.cartList, (cart: CartGoodsModel) => {
              ListItem() {
                CartItem({
                  cart: cart,
                  onChangeSelected: async selected => {
                    await updateCartAPI(cart.skuId, { selected: selected, count: cart.count })
                    await authCart.updateCartCount()
                  },
                  onChangeCount: async count => {
                    await updateCartAPI( cart.skuId,{selected: cart.selected, count: count})
                    await authCart.updateCartCount()
                  }
                })
              }
              .backgroundColor($r('[basic].color.under'))
              .padding({ left: 8, right: 8 })
              .transition({ type: TransitionType.Delete, opacity: 0 })
              .swipeAction({
                end: this.DeleteBuilder(cart)
              })
            })
          } else {
            ListItem() {
              // 登录&购物车为空
              HDMEmpty({
                tip: '空空如也',
                buttonText: '去逛逛',
                onBtnClick: () => {
                  // 切换到首页  订阅者(触发事件)   需要传index
                  emitter.emit(GlobalVariable.SWITCH_TAB, { data: { index: 0 } })
                  // 方法二
                  // HMRouterMgr.push({pageUrl:PAGE_PATH.HOME})
                }
              })
            }
          }
        } else {
          // 未登录
          ListItem() {
            HDMEmpty({
              tip: '请先登录才可查看购物车',
              buttonText: '去登录',
              onBtnClick: () => {
                HMRouterMgr.push({
                  pageUrl: PAGE_PATH.LOGIN_PAGE
                })
              }
            })
          }
        }
        ListItem() {
          HDMGuessGoods()
            .margin({ top: 8, bottom: 8 })
        }
      }
      .contentStartOffset(8)
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)

      if (this.appCart.cartList.length) {
        Row() {
          Checkbox()
            .selectedColor($r('[basic].color.red'))
            .select(this.isCheckAll)
            // .onChange(async (val) => {
            //   await selectOrUnSelectAPI({ selected: val} as SelectCartParams)
            //   await authCart.updateCartCount()
            //   // this.appCart.cartList = authCart.getCartList()
            // })
            .onClick(async () => {
              // this.selected == !this.selected
              await selectOrUnSelectAPI({ selected: !this.isCheckAll } as SelectCartParams)
              await authCart.updateCartCount()
            })
          Text('全选')
            .fontSize(14)
            .fontColor($r('[basic].color.black'))
            .margin({ right: 20 })
          Text('合计:')
            .fontSize(14)
            .fontColor($r('[basic].color.black'))
            .margin({ right: 2 })
          Text(this.totalPrice.toFixed(2))
            .fontSize(16)
            .fontWeight(500)
            .fontColor($r('[basic].color.red'))
            .layoutWeight(1)
          Button('去结算')
            .enabled(this.appCart.cartList.some(item => item.selected))
            .fontSize(14)
            .height(36)
            .backgroundColor($r('[basic].color.red'))
            .onClick(() => {

            })
        }
        .height(50)
        .width('100%')
        .backgroundColor($r('[basic].color.white'))
        .border({
          width: { top: 0.5, bottom: 0.5 },
          color: '#e4e4e4'
        })
        .padding({ left: 16, right: 16 })
      }
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('[basic].color.under'))

  }
}