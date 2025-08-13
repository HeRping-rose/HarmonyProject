import { ActivityBadgeCard } from "../components/ActivityBadgeCard"
import { FunctionList } from "../components/FunctionList"
import { ServiceGrid } from "../components/ServiceGrid"
import { UserInfoCard } from "../components/UserInfoCard"
import { VipCard } from "../components/VipCard"

@ComponentV2
export struct MineView {
  build() {
    Column() {
      Scroll() {
        Column({ space: 12 }) {
          UserInfoCard()
          VipCard()
          ServiceGrid().width('100%').backgroundColor('#ccc')
          ActivityBadgeCard()
          FunctionList()
        }
      }
      .scrollBar(BarState.Off)

    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding({right: 16, left: 16})
    .backgroundColor('#F5F5F5')
    .height('100%')
  }
}
