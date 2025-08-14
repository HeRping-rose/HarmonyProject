import { MyNavBar, PlayStatus } from "basic"
import { ActivityBadgeCard } from "../components/ActivityBadgeCard"
import { FunctionList } from "../components/FunctionList"
import { ServiceGrid } from "../components/ServiceGrid"
import { UserInfoCard } from "../components/UserInfoCard"
import { VipCard } from "../components/VipCard"

@ComponentV2
export struct MineView {
  build() {
    Column() {
      //顶部navBar
      MyNavBar({title:'',showLeftIcon:false,showRightIcon:true,rightIcon:$r('[basic].media.ic_setting')})

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
      //播放栏
      PlayStatus()
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding({right: 16, left: 16})
    .backgroundColor('#F5F5F5')
    .height('100%')
  }
}
