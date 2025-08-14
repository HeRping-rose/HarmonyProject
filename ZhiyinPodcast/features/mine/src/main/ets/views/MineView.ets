import { MyNavBar, PlayStatus } from "basic"
import { ActivityBadgeCard } from "../components/ActivityBadgeCard"
import { FunctionList } from "../components/FunctionList"
import { ServiceGrid } from "../components/ServiceGrid"
import { UserInfoCard } from "../components/UserInfoCard"
import { VipCard } from "../components/VipCard"

// 自定义右侧图标区域
@Builder
function  customRight() {
  Row() {
    Image($r('[basic].media.ic_message'))
      .width(30)
      .aspectRatio(1)
      .onClick(() => {
        console.log("点击了消息图标")
      })

    Image($r('[basic].media.ic_setting'))
      .width(30)
      .aspectRatio(1)
      .margin({ left: 16 })
      .onClick(() => {
        console.log("点击了设置图标")
      })
  }
  .alignItems(VerticalAlign.Center)
}

@ComponentV2
export struct MineView {
  build() {
    Column() {
      // 顶部navBar
      MyNavBar({title:'',showLeftIcon:false,showRightIcon:false,
        customRight: customRight,bgColor:'#f5f5f5'})
      // rightIcon: $r('[basic].media.ic_setting')

      Scroll() {
        Column({ space: 12 }) {
          UserInfoCard()
          VipCard()
          // ServiceGrid().width('100%').backgroundColor('#ccc').height(100)
          ServiceGrid()
          ActivityBadgeCard()
          FunctionList().width('100%')

        }
      }
      .scrollBar(BarState.Off)
      .layoutWeight(1)
      //播放栏
      PlayStatus()
    }
    // .alignItems(HorizontalAlign.Start)
    .width('100%')
    .width('100%')
    .padding({right: 16, left: 16})
    .backgroundColor('#F5F5F5')
  }
}
