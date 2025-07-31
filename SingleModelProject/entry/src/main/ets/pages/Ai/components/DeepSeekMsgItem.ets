import { AppUser, MessageItem, UserClass } from '../../../models'
import { PersistenceV2 } from '@kit.ArkUI'
import { auth } from '../../../commons/utils/auth'

@ComponentV2
export  struct DeepSeekMsgItem {
  // V2所有传入的属性必须加param
  @Param
  item: MessageItem = {} as MessageItem
  // appUser: AppUser = PersistenceV2.connect(AppUser, () => new AppUser())!

  user: UserClass = auth.getUser()

  @Builder
  getAvatar() {
    if (this.item.role === "system") {
      Image($r("app.media.customer"))
        .width(30)
        .aspectRatio(1)
        .borderRadius(15)
    } else {
      Image(this.user.avatar || $r('app.media.ic_mine_avatar'))
        .width(30)
        .aspectRatio(1)
        .borderRadius(15)
    }
  }

  build() {
    Row({ space: 20 }) {
      this.getAvatar()
      Row() {
        Text(this.item.content)
          .borderRadius(10)
          .padding(10)
          .lineHeight(24)
          .backgroundColor(this.item.role === "system" ? "#f8fafb" : "#3273e8")
          .fontColor(this.item.role === "system" ? "#373737" : "#fff")
          .constraintSize({
            minWidth: 40
          })
      }.layoutWeight(1)
      .justifyContent(this.item.role === "system" ? FlexAlign.Start : FlexAlign.End)

      Row()
        .width(30)
    }
    .direction(this.item.role === "system" ? Direction.Ltr : Direction.Rtl) // 反转方向
    .width('100%')
    .alignItems(VerticalAlign.Top)

  }
}