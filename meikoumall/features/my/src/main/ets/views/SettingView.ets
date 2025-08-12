
import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'
import { User, HDMNavBar, HDMCellGroup, HDMCell, PAGE_PATH, AppSafeArea, AppUser, auth, authCart } from 'basic'
import { AppStorageV2, PersistenceV2 } from '@kit.ArkUI'


@HMRouter({ pageUrl: PAGE_PATH.SETTING_PAGE })
@ComponentV2
export struct SettingView {
  // appUser: AppUser = PersistenceV2.connect(AppUser, () => new AppUser())!
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  appUser=auth.getUser()

  @Builder
  getProfileBuilder() {
    RelativeContainer() {
      Image($r("[basic].media.ic_public_right"))
        .fillColor($r("[basic].color.gray"))
        .width(30)
        .aspectRatio(1)
        .alignRules({
          center: {
            anchor: '__container__',
            align: VerticalAlign.Center
          },
          right: {
            anchor: '__container__',
            align: HorizontalAlign.End
          }
        })
        .onClick(() => {

        })

      Image(this.appUser.avatar)
        .alt($r("app.media.ic_user_avatar"))
        .width(50)
        .aspectRatio(1)
        .borderRadius(25)
        .alignRules({
          center: {
            anchor: '__container__',
            align: VerticalAlign.Center
          }
        })
        .id("avatar")
      Column({ space: 4 }) {
        Text(this.appUser.nickname || this.appUser.account)
          .fontColor($r('[basic].color.black'))
          .fontWeight(500)
        Text('账号名：' + this.appUser.account)
          .fontColor($r('[basic].color.gray'))
          .fontSize(12)
      }

      .alignRules({
        center: {
          anchor: '__container__',
          align: VerticalAlign.Center
        },
        left: {
          anchor: 'avatar',
          align: HorizontalAlign.End
        }
      })
      .alignItems(HorizontalAlign.Start)
      .margin({
        left: 10
      })
    }
    .constraintSize({
      maxHeight: 100
    })
    .padding({ top: 16, bottom: 16 })
  }

  aboutToAppear(): void {
    // 下载混合开发压缩包的工具

  }

  build() {
    Column() {
      HDMNavBar({
        title: '设置',
        onLeftClick:  () => {
          // 点击返回
           HMRouterMgr.pop()

        }
      })
      Column({ space: 8 }) {
        // 头像昵称 还有账号
        HDMCellGroup() {
          this.getProfileBuilder()
        }

        Blank() // 空格
        HDMCellGroup() {
          HDMCell({
            title: '收货地址管理', onRightClick: () => {

            }
          })

          HDMCell({ title: '账号安全' })
          HDMCell({ title: '消息设置' })
          HDMCell({ title: '隐私设置' })
          HDMCell({ title: '通用设置' })
        }

        Blank() // 空格

        HDMCellGroup() {
          HDMCell({ title: '退出登录' })
            .onClick(() => {
              // 弹出层
              this.getUIContext().showAlertDialog({
                message: '确定要退出登录吗？',
                primaryButton:{
                    value: '取消',
                    action:()=>{

                  },
                },
                secondaryButton:{
                    value: '确定',
                    action: async ()=>{
                      auth.removeUser()
                      await authCart.updateCartCount()
                      // HMRouterMgr.replace({
                      //   pageUrl:PAGE_PATH.SETTING_PAGE
                      // })
                      // HMRouterMgr.pop()
                      HMRouterMgr.pop({
                        navigationId: PAGE_PATH.MAIN_PAGE_ID // 替换为你的登录页面路径
                      })
                  },
                },

              })

            })

        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('[basic].color.under'))
  }
}