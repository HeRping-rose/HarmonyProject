//http 客户端
// let res=
// await Axios.get<result,AxiosResponse<result, null>,null('路径')
//返回最终需要的数据的类型  参2服务器 返回的数据类型 发送请求时携带headers信息  参3 post发送的参数类型
import axios, { Axios, AxiosError, AxiosInstance,
  AxiosRequestConfig,
  AxiosResponse,
  InternalAxiosRequestConfig} from "@ohos/axios"
import { UserClass } from "../../models"
import { auth } from "./auth"
import promptAction from "@ohos.promptAction"
import { navPathStack } from "./navPathStack"


// url1 : 根地址提取出来 域名 +参数

//泛型传入麻烦 ? 响应拦截器, 进一步包装


export  const baseUrl='https://api-harmony-teach.itheima.net/hm/' //根地址

// 自定义一个axios的实例对象 根地址 ,拦截器  AxiosInstance:axios实例类型
const instance:AxiosInstance =axios.create({
  baseURL:baseUrl,//根地址
  timeout:10000,//超时时间5000

})

//须有携带token的请求地址
let axiosValueDate: string[] = ["question/list","question","question/unOpt","question/opt"]
// let axiosValueDate: string[] = []
//请求拦截器   判断登录 发送请求的时候处理一些公共事务
instance.interceptors.request.use((req: InternalAxiosRequestConfig) => {
  // 在请求发出时 给请求上携带一个信息 然后继续向服务器发送请求
  console.log("当前的url:"+req.url)
  //先判断需不需要携带凭证
  // if(axiosValueDate.includes(req.url as string)){
    const user=auth.getUser()
    //拦截token 有没有 token
    if(user.token){
      //Authorization 用于携带jwt的字段凭证 专用 固定格式
      req.headers.Authorization=`Bearer ${user.token}`
    }
  //   return req
  // }
  return req  //request
},(err:AxiosError)=>{
  return Promise.reject(err)
})

// 响应拦截器 返回res 包含很多层 第一层固定返回  只剩下data了
// {headers,code,state,info,xx,data:{
// success,code,message,data:}} 数据类型验证
// app得到的res->res.data.data (响应拦截器)
instance.interceptors.response.use((res: AxiosResponse) => {
  if(res.data.code===10000){
    return res.data.data
  }
//防范错误
  return Promise.reject(res.data)  //返回错误信息
},(error:AxiosError)=>{
//   失败回调  网络崩溃 ...等等
//   401错误 权限不够 访问这个接口需要携带token访问 如果没有正确携带 token返回401
  if(error.response?.status==401){
    //退出之前的那个登录 跳转到登录页面
    auth.setUser({} as UserClass)
    promptAction.openToast({message:'请重新登录'})
    //MOVE_TO_TOP_SINGLETON 跳转模式 单例模式  只会出现一次
    // 找到login放到顶部
    navPathStack.pushPath({name:'login'},{launchMode:LaunchMode.MOVE_TO_TOP_SINGLETON})
  }
  return Promise.reject(error)
})

class HttpClient {
  // 自定义一个类 ,只封装了一个请求方法
  // Res 收到的数据类型  Req 发送的数据类型null| object 默认值类型null
  request<Res,Req=object>(config:AxiosRequestConfig<Req>){
    return instance.request<Res,Res,Req>(config)
    //  请求方式  method url params data
    //  config要符合配置项格式
  }
}
export const httpClient=new HttpClient()







