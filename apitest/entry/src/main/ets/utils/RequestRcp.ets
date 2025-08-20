import { rcp } from '@kit.RemoteCommunicationKit'
import { promptAction } from '@kit.ArkUI'

class GlobalVariable {
  static readonly TIME_OUT: number = 60000 // 超时时间
  static readonly BASE_URL: string = "http://192.168.0.67:8000" // 网络请求基础地址  替换为本机IpV4地址
  static readonly SUCCESS_CODE: string = "1" // 成功标识
}

interface ResponseData<T> {
  code: string,
  msg: string,
  result: T
}

class myInterceptor implements rcp.Interceptor {
  async intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    //请求时做一个拦截： 格式化参数
    // context.request.content  =  {__ob_keyword:"貌似zi",xxx:xxxx}
    // if(typeof context.request.content == 'object'){
    //   context.request.content = JSON.parse(JSON.stringify(context.request.content).replace(/__ob_/g,""))
    // }
    let res = await next.handle(context)
    return res
  }
}

//创建rcp会话实例
let instance = rcp.createSession({
  baseAddress: GlobalVariable.BASE_URL, //配置基础网址
  interceptors: [new myInterceptor()], //拦截器
  requestConfiguration: {
    transfer: {
      timeout: {
        connectMs: GlobalVariable.TIME_OUT, //最大连接时间
        transferMs: GlobalVariable.TIME_OUT, //传输超时
        inactivityMs: GlobalVariable.TIME_OUT  //会话超时
      }
    }
  }
})

//封装请求类
export class RequestRcp<T> {
  //get请求
  // 发请求 需要指定两种类型，在请求中携带数据 需要类型
  // 接收数据 也需要指定类型 ， <T> 用于接收 响应数据类型
  //
  static get<T>(url: string, params?: object): Promise<T> {
    // https://meikou-api.itheima.net/home/banner?id=1&name=asd
    return RequestRcp.toRightData<T>(instance.get(url + RequestRcp.objectToQuery(params)))
  }

  static post<T>(url: string, data?: object): Promise<T> {
    return RequestRcp.toRightData<T>(instance.post(url, data))
  }

  static delete<T>(url: string, params?: object, data?: object): Promise<T> {
    const req = new rcp.Request(url + RequestRcp.objectToQuery(params), "DELETE", {}, data)
    return RequestRcp.toRightData<T>(instance.fetch(req))
    // return RequestRcp.toRightData<T>(instance.delete(url + RequestRcp.objectToQuery(params)),data)
  }

  static put<T>(url: string,params?: object, data?: object): Promise<T> {
    // return RequestRcp.toRightData<T>(instance.put(url, data))
    return RequestRcp.toRightData<T>(instance.put(url + RequestRcp.objectToQuery(params),data))
  }

  static patch<T>(url: string, data?: object) {
  }

  static upload<T>() {
  }

  static download<T>() {
  }

  //当请求发出了，给我们返回一个响应的结果，但是这个结果包含了很多信息，我们要挑出body响应体中的信息
  static async toRightData<T>(res: Promise<rcp.Response>) {
    // console.log(JSON.stringify(await res))
    let obj = await res //当前得到的这个obj 是包含了所有响应信息的对象

    let result = obj.toJSON() as ResponseData<T> //从原始响应中 挑出了 服务器实际响应的数据

    //如果响应的状态码为1 就是成功的
    if (result.code == GlobalVariable.SUCCESS_CODE) {
      return result.result
    }
    promptAction.openToast({ message: result.msg })
    //如果报错了，就返回一个错误对象，其中包含的信息是服务器响应的说明
    return Promise.reject(new Error(result.msg))
  }

  //实现一个方法 用于 get请求中的 查询字符串的拼接
  static objectToQuery(params?: object) {
    if (params) {
      return "?" + Object.keys(params).map(i => `${i}=${params[i]}`).join("&")
      // 原 {id:1,name:"asd"}  要 ?id=1&name=asd
      //  Object.keys(params)  ["id","name"]
      // Object.keys(params).map(i=> `${i}=${params[i]}`)  ["id=1","name='asd'"]
      //Object.keys(params).map(i=> `${i}=${params[i]}`).join("&")  id=1&name='asd'
    }
    //如果没有传入params 就不需要拼接了
    return ""
  }
}
