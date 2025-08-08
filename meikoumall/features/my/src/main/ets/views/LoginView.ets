
import { AppSafeArea, auth, HDMNavBar, Log, PAGE_PATH } from 'basic'
import { AppStorageV2, promptAction } from '@kit.ArkUI'

import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'
import { LoginFormModel } from '../viewmodels'
import { loginAPI } from '../api'

@Preview
@HMRouter({ pageUrl: PAGE_PATH.LOGIN_PAGE })
@ComponentV2
export struct LoginView {
  // @Local account: string = '13200000010'
  // @Local password: string = '123456'

  loginForm:LoginFormModel=new LoginFormModel({
  account:'13200000010',
  password:'123456'
})
  @Local agree: boolean = false
  // @Local btnEnable:boolean=false  //改为计算属性使
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!


  // @Monitor('account','password')
  //计算属性  通过计算得到一个属性(给到当前this实例对象的属性)
  //用到计算属性时一定是出现了要定义这个属性时我们并不确定他的值的情况时
  //计算属性是一个函数 就可以在逻辑中参与进来的任何变量或者属性只要他们有任意一个发生改变 那么计算属性就会重新计算
  @Computed
  get btnEnable(){
    return Boolean(this.loginForm.account  && this.loginForm.password)  //两个都为真才会返回真
  }

  aboutToAppear(): void {


  }

  async onSubmit() {
    if (!this.agree) {
      promptAction.openToast({ message: '请先勾选协议' })
      return
    }

    //发请求
    let res =await loginAPI(this.loginForm)
    Log.info(res)
    auth.setUser(res)

    Log.info(auth.getUser())

    HMRouterMgr.pop()


  }

  @Styles
  form() {
    .width('100%')
    .height(42)
    .padding({
      left: 16,
      right: 16,
      top: 0,
      bottom: 0
    })
  }

  build() {
    Column() {
      HDMNavBar({
        title: '华优购登录',
        onLeftClick: () => {
          HMRouterMgr.pop()
        }
      })
      Column({ space: 16 }) {
        Text('账号密码登录')
          .fontSize(18)
          .fontColor($r('[basic].color.black'))
          .width('100%')
          .fontWeight(500)
          .margin({ bottom: 10 })
        TextInput({ placeholder: '请输入账号', text: $$this.loginForm.account })
          .placeholderColor($r('[basic].color.gray'))
          .placeholderFont({ size: 14 })
          .form()
        TextInput({ placeholder: '请输入密码', text: $$this.loginForm.password })
          .type(InputType.Password)
          .showPasswordIcon(false)
          .placeholderColor($r('[basic].color.gray'))
          .placeholderFont({ size: 14 })
          .form()

        Row({ space: 4 }) {
          Checkbox()
            .select($$this.agree)
            .width(12)
            .aspectRatio(1)
            .selectedColor($r('[basic].color.black'))
            .mark({ size: 10, strokeWidth: 1 })
          Text() {
            Span('查看并同意')
            Span('《隐私条款》')
              .fontColor('#007DFB')
            Span('和')
            Span('《用户协议》')
              .fontColor('#007DFB')
          }
          .width('100%')
          .fontSize(12)
          .fontColor($r('[basic].color.gray'))
        }

        Button('登录')// .backgroundColor(this.valid ? $r('[basic].color.black') : '#D4D2D9')
          .fontColor($r('[basic].color.white'))
          .form()
          .enabled(this.btnEnable)
          .onClick(() => {
            this.onSubmit()
          })

        Row() {
          Blank()
          Text('忘记密码')
            .fontColor('#007DFB')
            .fontSize(12)
        }
        .width('100%')

        Column({ space: 16 }) {
          Stack() {
            Text()
              .width(200)
              .height(1)
              .backgroundColor($r('[basic].color.under'))
            Text('其他登录方式')
              .width(100)
              .fontSize(12)
              .backgroundColor($r('[basic].color.white'))
              .fontColor($r('[basic].color.text'))
              .textAlign(TextAlign.Center)
          }

          Row() {
            // 后续放置华为登录
          }
        }
        .margin({ top: 200 })
      }
      .padding(30)
    }
    .width('100%')
    .height('100%')

  }
}