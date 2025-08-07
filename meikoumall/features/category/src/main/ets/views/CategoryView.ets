
import { AppBreakPoint, AppCategory, AppSafeArea,
  BreakPointType,
  CategoryItem, CategoryItemChild, HDMNavBar,
  PAGE_PATH } from 'basic'
import { AppStorageV2 } from '@kit.ArkUI'
import { HMRouterMgr } from '@hadss/hmrouter'

@ComponentV2
export struct CategoryView {
  breakPointClass: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  categories:CategoryItem[] = AppStorageV2.connect(AppCategory, () => new AppCategory())!.category
  // appCategory: AppCategory = AppStorageV2.connect(AppCategory, () => new AppCategory())!
  //  Mock分类数据
  /*categories: CategoryItem[] = new Array(10).fill({
    id: "1181622001",
    name: "气质女装",
    picture: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png"
  })*/
  // categories: CategoryItem[] =[]
  @Local activeIndex: number = 0

  build() {
    Column() {
      // MkNavbar({
      // })
      //   .border({ width: { bottom: 0.5 }, color: $r('[basic].color.under') })
      HDMNavBar({
        title: "商品分类",
        showLeftIcon: false,
        showRightIcon: true,
        rightIcon: $r("[basic].media.ic_public_search"),
        onRightClick: () => {
          HMRouterMgr.push({
            pageUrl: PAGE_PATH.SEARCH_PAGE
          })
        }
      })
        .border({ width: { bottom: 0.5 }, color: $r('[basic].color.under') })

      Row() {
        Column() {
          /*ForEach(this.categories, (item: CategoryItem, i) => {
            Text(item.name)// 文本
              .backgroundColor(this.activeIndex === i ? $r('[basic].color.black') : $r('[basic].color.white'))
              .fontSize(14)
              .fontColor(this.activeIndex === i ? $r('[basic].color.white') : $r('[basic].color.black'))
              .textAlign(TextAlign.Center)
              .width('100%')
              .height(56)
              .onClick(() => {
                this.activeIndex = i
              })

          })*/
          Repeat<CategoryItem>(this.categories)
            .each((obj: RepeatItem<CategoryItem>) => {
              Text(obj.item.name)// 文本
                .backgroundColor(this.activeIndex === obj.index ? $r('[basic].color.black') : $r('[basic].color.white'))
                .fontSize(14)
                .fontColor(this.activeIndex === obj.index ? $r('[basic].color.white') : $r('[basic].color.black'))
                .textAlign(TextAlign.Center)
                .width('100%')
                .height(56)
                .onClick(() => {
                  this.activeIndex = obj.index
                })
            })

        }
        .width(88)
        .border({ width: { right: 0.5 }, color: $r('[basic].color.under') })

        Scroll() {
          Column() {
            // 顶部图片
            Image(this.categories[this.activeIndex].picture)
              .width('100%')
              .height(new BreakPointType({
                sm: 136,
                md: 316,
                lg: 316
              }).getValue(this.breakPointClass.breakPoint))
              .objectFit(ImageFit.Contain)
              .backgroundColor('#f6f6f6')
              .borderRadius(8)
              .margin({ bottom: 8 })

            GridRow({ columns: {
              sm:2,
              md:4,
              lg:4
            }, gutter: 8 }) {
              // 子分类
              // 子分类
              Repeat<CategoryItemChild>(this.categories[this.activeIndex]?.children || [])
                .each((obj: RepeatItem<CategoryItemChild>) => {
                  GridCol() {
                    Column() {
                      // 图片
                      Image(obj.item.picture)
                        .width(64)
                        .aspectRatio(1)
                      Text(obj.item.name)// 文本
                        .fontSize(14)
                        .fontColor($r('[basic].color.text'))
                        .margin({ top: 8 })
                    }
                    .height('100%')
                    .justifyContent(FlexAlign.Center)
                  }
                  .aspectRatio(1)
                  .backgroundColor('#f6f6f6')
                  .borderRadius(8)
                })
              // ForEach(this.categories[this.activeIndex].children, (sub: CategoryItemChild) => {
              //   GridCol() {
              //     Column() {
              //       // 图片
              //       Image(sub.picture)
              //         .width(64)
              //         .aspectRatio(1)
              //       Text(sub.name)// 文本
              //         .fontSize(14)
              //         .fontColor($r('[basic].color.text'))
              //         .margin({ top: 8 })
              //     }
              //     .height('100%')
              //     .justifyContent(FlexAlign.Center)
              //   }
              //   .aspectRatio(1)
              //   .backgroundColor('#f6f6f6')
              //   .borderRadius(8)
              // })
            }
          }
          .padding(8)
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
      }
      .layoutWeight(1)
      .alignItems(VerticalAlign.Top)
    }
    .width('100%')
    .height('100%')
  }
}