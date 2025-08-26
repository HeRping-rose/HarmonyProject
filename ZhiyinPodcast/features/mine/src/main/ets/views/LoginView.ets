import { HMRouter, HMRouterMgr } from '@hadss/hmrouter';
import { PAGE_PATH } from 'basic';
import { text } from '@kit.ArkGraphics2D';
import { promptAction } from '@kit.ArkUI';
import { userLoginAPI } from '../api/login';

@HMRouter({ pageUrl: PAGE_PATH.LOGIN_PAGE })
@ComponentV2
export  struct LoginView {
  @Local username: string = '';
  @Local password: string = '';

  build() {
    //登录页面结构
    //账号输入框
    Column(){

      Text('账号')
      TextInput({ placeholder: '请输入账号' ,text: $$this.username})
      Text('密码')
      TextInput({ placeholder: '请输入密码', text: $$this.password})
        .type(InputType.Password)
      Button('登录')
        .onClick(async ()=>{
          let res = await userLoginAPI({
            username: this.username,
            password: this.password,
          })
          console.log(JSON.stringify(res))

          promptAction.openToast({ message: JSON.stringify(res) })

        })
      Button('注册')
        .onClick(()=>{
          HMRouterMgr.push({pageUrl:PAGE_PATH.REGISTER_PAGE})

        })
    }
  }
}