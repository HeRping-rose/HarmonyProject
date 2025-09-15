import { HMRouterMgr } from "@hadss/hmrouter"
import { PAGE_PATH } from "basic"

@ComponentV2
export struct HomeHeader {
  build() {
    Row() {
      Text('智音播客')
        .fontSize(24)
        .fontColor('#4A90E2')
      Row({ space: 5 }) {
        // 搜索框
        Row() {
          Image($r('app.media.ic_search'))
            .width(20)
            .height(20)
          Text('请输入...')
            .width(120)
            .height(36)
            .fontColor('#999999')
            .fontSize(14)
            .backgroundColor('#F5F5F5')
            .borderRadius(18)
            .padding({ left: 12, right: 12 })
        }
        // .backgroundColor('#ffdbb6b6')
        .borderRadius(18)
        // .layoutWeight(1)
        .padding({ left: 12, right: 12 })
        .onClick(() => {
          HMRouterMgr.push({
            pageUrl: PAGE_PATH.SEARCH_PAGE
          })
        })

        Row({ space: 5 }) {
          // 麦克风和菜单图标
          Image($r('app.media.ic_voice'))
            .width(20).aspectRatio(1)
            .margin({ left: 12 })
          Image($r('app.media.ic_menu'))
            .width(20).aspectRatio(1)
            .margin({ left: 8 })
        }
      }.justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .padding({ left: 16, right: 16, bottom: 16 })
  }
}