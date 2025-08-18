import { rcp } from '@kit.RemoteCommunicationKit'
import { GlobalVariable } from '../constants/GlobalVariaable'
import { staticMap } from '@kit.MapKit'
import { Log } from './Logger'
import { ResponseData } from '../viewmodels'
import { promptAction } from '@kit.ArkUI'
import { auth } from './Auth'
import { HMRouterMgr } from '@hadss/hmrouter'
import { PAGE_PATH } from '../constants'

class myInterceptor implements rcp.Interceptor {
  async intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    // 请求`拦截
    // 搜索 格式化参数请求拦截
    // context.request.content :对请求的参数拦截并处理 = {__ob_keyword:'maoZi',xxx:'ss'}
    if(typeof context.request.content=='object'){
      //replaceAll()匹配到了全部替换 没有就略过   /__ob_/  正则表达式
      context.request.content = JSON.parse(JSON.stringify(context.request.content).replaceAll(/__ob_/g, ""))
    }

    //常规拦截  请求拦截
    //  注入token
    const user = auth.getUser()
    // ['index','xxx'].includes(  context.request.url )根据xxx来判断拦截
    if (user.token) {
      context.request.headers!.authorization = `Bearer ${user.token}`
    }

    let res=await next.handle((context))   //next 分割

    //处理401错误
    //  处理401异常问题

    // 响应拦截
    if (res.statusCode === 401) {
      auth.removeUser()
      HMRouterMgr.push({
        pageUrl: PAGE_PATH.LOGIN_PAGE
      })
    }
    // 响应拦截
    return res
  }
}

// 创建rcp会话实例
let instance = rcp.createSession({
  baseAddress:GlobalVariable.BASE_URL,
  interceptors:[new myInterceptor()], //拦截器
  requestConfiguration:{
    transfer:{
      timeout:{
        connectMs:GlobalVariable.TIME_OUT,//最大连接时间
        transferMs:GlobalVariable.TIME_OUT,//传输时间
        inactivityMs:GlobalVariable.TIME_OUT,//最大会话时间 ,会话超时
      }
    }
  }
})

//封装请求类
export class RequestRcp {
  // get 请求
  //<T>:用来接收响应的数据类型  发请求和接收数据需要指定 res,req指定数据类型
  //RequestRcp.get('/xxx',{id:1,name:'xxx})
  static get<T> (url:string,params?:object):Promise<T>{ //实例化 公共 属性
    // https://meikou-api.itheima.net/xxx ? id=1&name=xxx
    let insGet= instance.get(url+RequestRcp.objectToQueryString(params))
    return RequestRcp.toRightData<T>(insGet)

  }
  static post<T>(url:string,data?:object): Promise<T>{
    return RequestRcp.toRightData<T>(instance.post(url,data))

  }
  static put<T>(url:string,data?:object){}
  static delete<T>(url:string,params?:object){}
  static patch<T>(url:string,data?:object){}

  static upload<T>(url:string,data?:object){}
  static download<T>(url:string,params?:object){}

  //请求发出后返回响应的结果 但是这个结果包含了复杂信息 要挑出body响应体中的信息
  static async toRightData<T>(res:Promise<rcp.Response>){
    let obj=await res
    Log.info('res:',JSON.stringify(obj))//  body:ArrayBuffer  .toString()|toJSON()
    let result=obj.toJSON() as ResponseData<T>
    if(result.code===GlobalVariable.SUCCESS_CODE){
      return result.result
    }else{
      // promptAction.openToast({ message: result.msg })
      // throw new Error(result.msg)
    }
    promptAction.showToast({ message: result.msg })
    return Promise.reject(new Error(result.msg))
  }

  //用于get请求中的查询字符串的拼接
  static objectToQueryString(params?:object){
    if(!params){
      //如果没有param就不拼接
      return ''
    }
    Log.info('params:',JSON.stringify(params))
    // {id:1,name:'xxx}  -->id=1&name=xxx
    // Object.keys(params)  // ['id','name']
    //   .map(key => `${key}=${params[key]}`) // ['id=1','name=xxx']
    return '?'+ Object.keys(params).map(key=>`${key}=${params[key]}`).join('&') // 'id=1&name=xxx'
  }
}
//通过类调用 不需要创建实例



