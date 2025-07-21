//http 客户端
// let res=
// await Axios.get<result,AxiosResponse<result, null>,null('路径')
//返回最终需要的数据的类型  参2服务器 返回的数据类型 发送请求时携带headers信息  参3 post发送的参数类型
import axios, { Axios, AxiosError, AxiosInstance,
  AxiosRequestConfig,
  AxiosResponse } from "@ohos/axios"


// url1 : 根地址提取出来 域名 +参数

//泛型传入麻烦 ? 响应拦截器, 进一步包装


export  const baseUrl='https://api-harmony-teach.itheima.net/hm/' //根地址

// 自定义一个axios的实例对象 根地址 ,拦截器  AxiosInstance:axios实例类型
const instance:AxiosInstance =axios.create({
  baseURL:baseUrl,//根地址
  timeout:10000,//超时时间5000

})
//请求拦截器   判断登录 发送请求的时候处理一些公共事务
// instance.interceptors.request.use((res: AxiosRequest) => {
//   return res
// })

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







