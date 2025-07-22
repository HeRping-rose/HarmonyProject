//用户 作者 简写
import { PersistenceV2 } from '@kit.ArkUI'
import { AppUser, UserClass } from '../../models'

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
}

export const auth = new Auth()