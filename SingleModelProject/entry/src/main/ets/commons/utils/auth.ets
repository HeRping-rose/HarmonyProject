//用户 作者 简写
import { PersistenceV2 } from '@kit.ArkUI'
import { AppUser, UserClass } from '../../models'
import { navPathStack } from './navPathStack'

class Auth{
  //存用户 信息
  setUser(user:UserClass){
    let appUser = PersistenceV2.connect(AppUser, () => new AppUser())!
    appUser.user.token=user.token
    appUser.user.id=user.id
    appUser.user.username=user.username
    appUser.user.avatar=user.avatar
    appUser.user.nickName=user.nickName
    appUser.user.totalTime=user.totalTime
    appUser.user.clockinNumber=user.clockinNumber
    appUser.user.refreshToken=user.refreshToken
  }

  // 获取用户信息
  getUser(){
    let appUser = PersistenceV2.connect(AppUser, () => new AppUser())!
    return appUser.user
  }

  //检查用户是否登录
  checkUser(fn:Function){
    const user=this.getUser()
    if(user.token){
      //go on
      fn()
    }else{
      navPathStack.pushPath({name:'login'})
    }
  }

}

export const auth = new Auth()