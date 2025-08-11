import {
  AppBreakPoint,
  AppSafeArea,
  auth,
  HDMGuessGoods,
  HDMLoading,
  HDMNavBar,
  HDMSku,
  HDMSkuType,
  PAGE_PATH,
  RequestRcp
} from 'basic'
import { Goods } from '../viewmodels'
import { AppStorageV2 } from '@kit.ArkUI'
import { GoodsInfo, GoodsComment, GoodsDetail } from '../components'
import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'
import { getGoodsDetailAPI } from '../api'


@HMRouter({ pageUrl: PAGE_PATH.GOODS_PAGE })
@ComponentV2
export struct GoodsView {
  breakPointClass: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  @Local goods: Goods = {} as Goods
  @Local activeIndex: number = 0
  @Local loading: boolean = false
  @Local
  showSheet: boolean = false   //半模态框 弹出 控制 状态
  @Local count: number = 1  // 商品数量 计数
  @Local
  sku: HDMSkuType = {} as HDMSkuType
  scroller = new Scroller()
  tabsList: string[] = ["商品", "评价", "详情", "推荐"]

  @Builder
  CustomTitleBuilder() {
    // 楼层切换
    Row() {
      Row({ space: 10 }) {
        Repeat<string>(this.tabsList).each((obj:RepeatItem<string>)=>{
          Text(obj.item)
            .fontColor(this.activeIndex === obj.index ? Color.Black : Color.Gray)
            .onClick(() => {
              this.activeIndex = obj.index
              this.scroller.scrollToIndex(obj.index)
            })

        }).key((item,index)=>`${index}`)
        // ForEach(this.tabsList, (tabName: string, index: number) => {
        //   Text(tabName)
        //     .fontColor(this.activeIndex === index ? $r("[basic].color.black") : $r("[basic].color.gray"))
        //     .onClick(() => {
        //
        //     })
        // })
      }

      Image($r('[basic].media.ic_public_shared'))
        .iconButton()
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width("100%")
    .height("100%")
    .padding({
      left: 50,
      right: 50
    })

  }

  @Builder
  AddCartBuilder() {
    Column() {
      Text(`已选:${this.sku.specsText}`)
        .fontWeight(300)
        .width('100%')
        .fontColor($r('[basic].color.black'))
        .fontSize(14)
        .padding({ bottom: 10, right: 50 })
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .visibility(this.sku.id ? Visibility.Visible : Visibility.Hidden)

      Row({ space: 10 }) {
        // Image(this.goods.mainPictures?.[0])
        Image(this.sku.picture || this.goods.mainPictures?.[0])
        // .alt($r('app.media.sku'))
          .alt($r('[basic].media.ic_sku_img'))
          .width(80)
          .height(80)
          .backgroundColor($r('[basic].color.under'))
          .borderRadius(4)
        Column() {
          Row() {
            Text('现价¥')
              .fontSize(14)
              .fontColor($r('[basic].color.black'))
              .offset({ y: -4 })
            Text(this.sku.price || this.goods.price)
              .fontSize(24)
              .fontColor($r('[basic].color.black'))
              .fontWeight(500)
            Text('原价¥' +this.sku.oldPrice || this.goods.price)
              .fontSize(12)
              .fontColor($r('[basic].color.gray'))
              .margin({ left: 10 })
              .offset({ y: -4 })
              .decoration({
                type: TextDecorationType.LineThrough,
                color: $r('[basic].color.gray')
              })
          }
          .alignItems(VerticalAlign.Bottom)

          Row({ space: 10 }) {
            // 计数器  -  1   +
            Counter(){
              TextInput({ text: this.count.toString() })
                .type(InputType.Number)
                .borderRadius(0)
                .backgroundColor('#fff')
                .onChange((value: string) => {
                  let numValue = parseInt(value);
                  if (!isNaN(numValue)) {
                    // 确保输入的值在合理范围内
                    if (numValue < 1) {
                      this.count = 1;
                    } else if (numValue > this.goods.inventory) {
                      this.count = this.goods.inventory;
                    } else {
                      this.count = numValue;
                    }
                  }
                })
                .padding(0)
                .margin(0)
                .width(40)
                .height(30)
                .textAlign(TextAlign.Center)

            }
            .onInc(() => {
              this.count ++
            })
            .onDec(() => {
              this.count --
            })
            .enableDec(this.count > 0)
            .enableInc(this.goods.inventory <=this.goods.inventory)


            if(this.sku.inventory){
              Text(this.goods.inventory > 10 ? '库存充足' : "库存紧张")
                .fontSize(12)
                .fontColor(this.goods.inventory > 10 ? $r('[basic].color.gray') : $r('[basic].color.red'))
            }else {
              Text(this.goods.inventory > 100 ? '库存充足' : "库存紧张")
                .fontSize(12)
                .fontColor(this.goods.inventory > 100 ? $r('[basic].color.gray') : $r('[basic].color.red'))
            }

          }
        }
        .height(80)
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')

      Divider()
        .strokeWidth(4)
        .color($r('[basic].color.under'))
        .margin({ left: -8, right: -8, top: 13 })

      List() {
        ListItem() {
          // Sku 组件
          HDMSku({
            skus:this.goods.skus,// skus  商品sku列表
            specs:this.goods.specs,// specs 商品规格列表
            onSkuChange: (sku) => {
              this.sku = sku // 接收sku组件传递过来的规格商品
            }
          })

        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)

      Row() {
        Button(this.loading ? '加入中...' : '加入购物袋')
          .buyButton($r('[basic].color.black'), true)
          .onClick(() => {
            // 实现加入购物车

          })
        Button('立即购买')
          .buyButton($r('[basic].color.red'), false)
          .onClick(async () => {

          })
      }
      .width('100%')
    }
    .height(600)
    .padding({
      left: 16,
      right: 16,
      top: 16,
      bottom: this.safeArea.bottomHeight || 16
    })
  }

  aboutToAppear(): void {
    //获取跳转过来携带的参数 商品信息参数
    this.goods = HMRouterMgr.getCurrentParam() as Goods

    // this.goods.id
    this.getGoodsDetail()

  }

  async getGoodsDetail() {
    this.loading = true
    this.goods = await getGoodsDetailAPI({ id: this.goods.id })
    this.loading = false
  }

  build() {
    Column() {
      HDMNavBar({
        title: '',
        showRightIcon: true,
        customTitle: () => {
          this.CustomTitleBuilder()

        },
        onLeftClick: () => {
          HMRouterMgr.pop()
        }
      })
      if(this.loading){
        HDMLoading()
      }else {
        Column() {
          List({ scroller: this.scroller }) {
            ListItem() {
              // 商品信息
              GoodsInfo({ goods: this.goods })
                .geometryTransition(this.goods.id)
            }

            ListItem() {
              // 评论 目前无评论数据
              GoodsComment({ goods: this.goods })
            }

            ListItem() {
              // 商品详情
              GoodsDetail({ goods: this.goods })
            }

            ListItem() {
              // 猜你喜欢
              HDMGuessGoods()
            }
          }
          //
          .onScrollIndex((index) => {
            // 滚动 监听  获取当前索引  赋值给activeIndex
            this.activeIndex = index
          })
          .scrollBar(BarState.Off)
          .width('100%')
          .height('100%')
        }
        .layoutWeight(1)
        .backgroundColor($r('[basic].color.under'))
      }


      Row() {
        Image($r('[basic].media.ic_public_like'))
          .iconButton()
        Image($r('[basic].media.ic_public_comment'))
          .iconButton()
        Badge({
          count: 0,
          style: {},
          position: { x: 30, y: 4 }
        }) {
          Image($r('[basic].media.ic_public_cart'))
            .iconButton()
            .onClick(() => {

            })
        }

        Row() {
          Button('加入购物袋')
            .buyButton($r('[basic].color.black'), true)
            .onClick(() => {
              this.showSheet=true
            })
          Button('立即购买')
            .buyButton($r('[basic].color.red'), false)
            .onClick(async () => {
              this.showSheet = true
            })
        }
        .layoutWeight(1)
        .padding({ right: 16, left: 6 })
      }
      .height(54)
      .width('100%')
      .margin({ bottom: this.safeArea.topHeight })
    }
    .height('100%')
    .bindSheet($$this.showSheet, this.AddCartBuilder(),
      {
        height: SheetSize.FIT_CONTENT,
        backgroundColor: $r('[basic].color.white'),
        preferType: SheetType.CENTER
      })

  }
}

@Extend(Image)
function iconButton() {
  .width(24)
  .aspectRatio(1)
  .margin(13)
  .fillColor($r('[basic].color.black'))
}

@Extend(Button)
function buyButton(color: ResourceStr, isLeft: boolean) {
  .fontSize(14)
  .height(36)
  .type(ButtonType.Normal)
  .layoutWeight(1)
  .backgroundColor(color)
  .borderRadius({
    topLeft: isLeft ? 18 : 0,
    bottomLeft: isLeft ? 18 : 0,
    topRight: isLeft ? 0 : 18,
    bottomRight: isLeft ? 0 : 18
  })
  .pixelRound({
    end: PixelRoundCalcPolicy.FORCE_CEIL,
    start: PixelRoundCalcPolicy.FORCE_FLOOR
  })
}