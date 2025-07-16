import { pageStack, user } from './utils'
import promptAction from '@ohos.promptAction'
import { AppStorageV2 } from '@kit.ArkUI'

@Builder
function loginFn() {
  login()
}

// @ObservedV2
// class User {
//   @Trace username: string
//   @Trace password: number
//   constructor(username: string, password: number) {
//     this.username = username
//     this.password = password
//   }
// }

@Entry
@ComponentV2
struct login {
  @Local username: string = ''
  @Local password: string = ''
  // connect 用于创建或获取一个数据存储对象，并绑定到当前组件。
  // 第一个参数: 数据类型 (获取|创建的数据)
  // 第二个参数: 要获取|创建的哪项数据的键key
  // 第三个参数: 默认值用于创建 函数 不会直接执行 只有调用才会执行 只有当仓库中没有数据时才会执行
  // @Local user: User=AppStorageV2.connect(User,'user',()=>new User('admin',123))!  //类似于  as User  非空断言
  build() {
    NavDestination(){
      Column({space: 10}){
        TextInput({ placeholder: '请输入用户名' ,text: $$this.username})
        TextInput({ placeholder: '请输入密码' ,text:$$this.password})
          .type(InputType.Password)
        Button("登录").width('100%').onClick(() => {
          console.log(this.username,this.password)
          user.username=this.username
          user.password=this.password

          promptAction.openToast({message:"登录成功"})
          pageStack.replacePath({ name: 'mine'})

        })
      }
      .width('100%')

    }
    .title("首页")
  }
}

export { loginFn }