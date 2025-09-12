import { rcp } from '@kit.RemoteCommunicationKit'
import { ResponseData } from '../models';

//拦截器
class myInterceptor implements rcp.Interceptor {
  async intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    //请求拦截
    //每发一个请求都会被拦截 这是让他通过
    let res = await next.handle(context) // 用于区分请求和响应
    //响应拦截
    return res;
  }
}
//准备实例
let instance=rcp.createSession({
  baseAddress:'http://192.168.0.74:8000',
  interceptors:[
    new myInterceptor()
  ]
})

//封装 各种请求方式的类
class Request<T> {
  get<T>(url:string):Promise<T>{
    return this.getRes<T>(instance.get(url))
  }

  async getRes<T>(res:Promise<rcp.Response>){
    let obj=await res; //获取到外层对象,是二进制数据
    let resultObj=obj.toJSON() as ResponseData<T>

    return resultObj.data

  }
  post(){
  }
}

export const  requestRcp=new Request<rcp.Response>()