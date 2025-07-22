import { PersistenceV2, promptAction } from "@kit.ArkUI"
import { auth } from "../../commons/utils/auth"
import { httpClient } from "../../commons/utils/httpClient"
import { navPathStack } from "../../commons/utils/navPathStack"
import { AppUser, LoginParam, UserClass } from "../../models"

@ComponentV2
struct Login {
  @Local mobile:string='hmheima'
  @Local code:string='Hmheima%123'
  @Local isAgree: boolean = false
  @Local isLoading:boolean=false
  async  login(){
    if(this.isLoading){
      return
    }
    if(!this.mobile){
      promptAction.openToast({message:'用户名或者电话没有填写'})
      return
    }
    if (!this.code) {
      promptAction.openToast({ message: '密码没有填写' })
      return
    }
    if (this.isAgree) {
      promptAction.openToast({ message: '请勾选用户协议和隐私政策' })
      return
    }
    this.isLoading=true

    let res =await httpClient.request<UserClass, LoginParam >({
      method: 'post',
      url:'login',
      data: {
        username: this.mobile,
        password: this.code
      } as LoginParam
    })
    this.isLoading = false

    console.log(JSON.stringify(res))
    //{"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
    // eyJpZCI6IjEiLCJpYXQiOjE3NTMxNzMxMDQsImV4cCI6MTc1MzE3NjcwNH0.
    // N6xz_6XSRGl4vhGlsbnHNLAurfdhJ_nEINBXbvb2a-E",
    // "refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEiLCJpYXQiOjE3NTMxNzMxMDQsImV4cCI6MTc1MzQzMjMwNH0.
    // N6Rn-9aWMoyNYQKj83DJzeCB2QSd5HNxEf5rhgsKPQg",
    // "id":"1",
    // "username":"hmheima",
    // "avatar":"http://dummyimage.com/100x100","
    // nickName":"Success",
    // "totalTime":87194526,
    // "shareInfo":"b4e3722a4734aa445ce5e189375d37c9",
    // "clockinNumbers":172}
    //参1:类 参2:key名 ,参3:默认值
    // let appUser=PersistenceV2.connect(AppUser,()=>new AppUser())!
    // appUser.user.token=res.token
    //封装一个方法存储数据
    auth.setUser( res )
    navPathStack.pop()
  }
  build() {
    NavDestination(){
      Column() {
        Column({space:10}){
          Image($r('app.media.ic_mine_logo')).width(80)
            .margin({top:30,bottom:10})
          Text('面试通')
            .fontSize(24)
          Text('搞定企业面试真题,就用面试通')
            .fontSize(13)
            .fontColor('#ccc')
            .margin({bottom:20})
          TextInput({ placeholder: '请输入用户名' })
            .placeholderColor('#ccc')
            .backgroundColor('#fff')
            .margin({left:20,right:20})
            .border({width:{bottom:1} ,radius:0,color:'#ccc'})
          TextInput({ placeholder: '请输入密码' ,})
            .type(InputType.Password)
            .placeholderColor('#ccc')
            .backgroundColor('#fff')
            .margin({ left: 20, right: 20 })
            .border({ width: { bottom: 1 },radius:0, color: '#ccc' })


          Row(){
            Checkbox()
              .shape(CheckBoxShape.ROUNDED_SQUARE)
              .selectedColor(0xed6f21)
              .select(this.isAgree)
              .width(14)
              .height(14)
              .onChange((value: boolean) => {
                this.isAgree==value
              })
            Text('已阅读并同意')
              .fontColor('#ccc')
              .fontSize(14)
            // TODO 跳转
            Text('《用户协议》')
              .fontSize(14)

            Text('和')
              .fontColor('#ccc')
              .fontSize(14)
            // TODO 跳转
            Text('《隐私政策》')
              .fontSize(14)

          }.width('100%')
          .margin({left:20})
          Button('立即登录')
            .fontSize(14)
            .width('80%')
            .fontColor('#eee')
            .margin({right:20,left:20})
            .backgroundColor(  '#fb8e1d' )
            .border({ width: 1, radius:4, color: '#ccc' })
            .linearGradient({
              direction:GradientDirection.Right,
              // angle:0,
              colors:[['#fffc9b1c',0],['#fffa721e',1]]
            })
            .onClick(() => {
              this.login()
            })
          Text('其他登录方式').margin({top:30})
            .fontSize(14)
            .fontColor('#ccc')
          Image($r('app.media.ic_mine_huawei')).width(30)
        }

      }
    }
    // .hideTitleBar( true)

  }
}
@Builder
function LoginFn(){
  Login()
}


export { LoginFn }