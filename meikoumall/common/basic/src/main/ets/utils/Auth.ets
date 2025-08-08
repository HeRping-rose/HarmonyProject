import { PersistenceV2 } from '@kit.ArkUI'
import { AppUser, loginResult } from '../viewmodels'

class Auth{
  //设置用户
  setUser(user:loginResult){
    let appUser=PersistenceV2.connect(AppUser,'appUser',()=>new AppUser())!

    appUser.user.account=user.account
    appUser.user.avatar=user.avatar
    appUser.user.mobile=user.mobile
    appUser.user.nickname=user.nickname
    appUser.user.token=user.token

  }

  getUser(){
    let appUser = PersistenceV2.connect(AppUser, 'appUser', () => new AppUser())!
    return appUser.user
  }

  removeUser(){
    PersistenceV2.remove('appUser')
    let appUser = PersistenceV2.connect(AppUser, 'appUser', () => new AppUser())!
    appUser.user.account = ''
    appUser.user.avatar = ''
    appUser.user.mobile = ''
    appUser.user.nickname =''
    appUser.user.token = ''

  }
}

export const auth=new Auth()