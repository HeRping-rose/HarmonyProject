import { HMRouter, HMRouterMgr } from '@hadss/hmrouter';
import { PAGE_PATH } from 'basic';

@HMRouter({ pageUrl: PAGE_PATH.LOGIN_PAGE })
@ComponentV2
struct LoginView {
  build() {
    //登录页面结构
    //账号输入框
    Column(){

      Text('账号')
      TextInput({ placeholder: '请输入账号'})
      Text('密码')
      TextInput({ placeholder: '请输入密码'})
        .type(InputType.Password)
      Button('登录')
        .onClick(()=>{

        })
      Button('注册')
        .onClick(()=>{

        })
    }
  }
}