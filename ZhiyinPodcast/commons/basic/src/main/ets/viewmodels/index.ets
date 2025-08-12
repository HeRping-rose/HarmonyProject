import { Type } from "@kit.ArkUI"

// 接口返回数据结构  定义统一的返回结构体
export interface ResponseData<T> {
  code: string
  msg: string
  result: T
}

export interface loginResult {
  token: string
  avatar: string
  mobile:string
  nickname: string
  account: string
}
@ObservedV2
export  class User{
  @Trace token: string=''
  @Trace avatar: string=''
  @Trace mobile: string=''
  @Trace nickname: string=''
  @Trace account: string=''
}

// 又嵌套了一层对象 针对user进行整体赋值就简单了！！！
@ObservedV2
export class  AppUser{
  //监测的是复杂数据
  @Type(User)
  @Trace user:User=new User()
}
export * from './break_point'
export * from './common'
