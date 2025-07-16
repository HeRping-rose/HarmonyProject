import { pageStack, user } from './utils'
import { AppStorageV2, promptAction } from '@kit.ArkUI'

@Builder
function mineFn() {
  mine()
}

// @ObservedV2
// class User {
//   @Trace username: string
//   @Trace password: number
//
//   constructor(username: string, password: number) {
//     this.username = username
//     this.password = password
//   }
// }

@Entry
@ComponentV2
struct mine {
  // @Local user: User = AppStorageV2.connect(User, 'user', () => new User('admin', 123))! //类似于  as User  非空断言

  build() {
    NavDestination(){
      Column({space: 10}){
        Text("用户信息").width('100%').textAlign(TextAlign.Center)
        Row({space: 10}){
          Image($r('app.media.person')).width(50).borderRadius(50)
          Text(`用户名: ${user.username}`).fontSize(20) //把 this去掉  this.user.username
        }.width('100%')
        Button("编辑用户名").width('100%').onClick(() => {
          promptAction.openToast({message:"修改成功"})
          user.username = 'admin'
        })
        Row(){
          Button("去列表浏览").onClick(() => {
            pageStack.pushPath({ name: 'list' })
          })
        }
        Button("退出登录").width('100%').onClick(() => {
          promptAction.openToast({message:"退出成功"})
          user.username = ''
          user.password = ''
          AppStorageV2.remove('user')
          pageStack.clear()
        })
        Button('查看').onClick(() => {
          promptAction.openToast({message:"查看成功"})
          // AppStorageV2.keys()
          console.log(JSON.stringify(AppStorageV2.keys()))
        })

      }
    }
    .title("我")
  }
}

export { mineFn }