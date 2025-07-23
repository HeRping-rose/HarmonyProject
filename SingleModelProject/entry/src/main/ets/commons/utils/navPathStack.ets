import { auth } from "./auth"
import { promptAction } from "@kit.ArkUI"

export const navPathStack=new NavPathStack()

// 创建一个要维护的路由的数组
const routerNames=["question"]

// 路由拦截
// 设置路由跳转拦截器
navPathStack.setInterception({
  willShow(from,to){
    // to->"navBar" 去首页
    // to->{} 去其他页面这个对象 是navPathStack的子集
    //排除navigation的首页  这个页面不做拦截
    if(typeof to === 'string'){
      return
    }

    // 对于其他的页面 判断要不要做验证登录
    if(routerNames.includes(to.pathInfo.name)){
      //在  ->做验证
      let user=auth.getUser()
      if(!user.token){
      //   不存在
        promptAction.openToast({message:"请先登录"})

        //去登录
        // 本来是想去 b页面(已经被记录到路由栈) 由于 拦截被拦截 可以把这个b页面从路由栈中删除
        to.pathStack.pop()
        to.pathStack.pushPath({name:"login"})
      }
    }else{
      // 不在
    }
  }

})