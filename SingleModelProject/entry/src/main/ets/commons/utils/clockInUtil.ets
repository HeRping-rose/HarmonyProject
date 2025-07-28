import { auth } from "./auth"
import { httpClient } from "./httpClient"
import { navPathStack } from "./navPathStack";

interface ClockInRes {
  /**
   * 连续打卡的天数
   */
  clockinNumbers: number;
}

export const clockInUtil = async ()=>{
  console.log('clockInUtil')
  // 检测用户登录  是否 有携带token
  const user=auth.getUser()

  // 如果存在 token
  if(user.token){
    //如果 user.clockinNumbers是0  说明没有打卡就需要发请求去打卡
    if(user.clockinNumber===0){
      let  res =await httpClient.request<ClockInRes>({
        url:'clockin',
        method:'post',
      })
      // 更新用户身上的连续打卡天数
      user.clockinNumber=res.clockinNumbers

      console.log('no1')
      // //跳转到 日历内页
      navPathStack.replacePath({name:'calendarPage'})
    }else {
      console.log('no2')
      // 不是0 则直接进日历内页面
      navPathStack.replacePath({ name: 'calendarPage' })
    }
    console.log('no3')
    navPathStack.replacePath({ name: 'calendarPage' })
  }else{
    // 没有登录
    console.log('no4')
    navPathStack.pushPath({ name: 'login' })
  }

}