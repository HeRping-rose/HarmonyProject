// deepseek的数据和我们平时请求的数据有什么区别
import { rcp } from "@kit.RemoteCommunicationKit"
import { util } from "@kit.ArkTS"
// import { rcp } from '@kit.RemoteCommunicationKit'
// import { Choices, LLMData } from '../../models'
// import { util } from '@kit.ArkTS'
// 自定义拦截器 Interceptor  并且要实现接口
//外层的类的定义 扩展
const url =
  'https://maas-cn-southwest-2.modelarts-maas.com/v1/infers/271c9332-4aa6-4ff5-95b3-0cf8bd94c394/v1/chat/completions'
const key = 'wpWhoozWVZwbF7l0RFcSyhQ_f715RKe4lLX1hv9pVEXowWYqiXzBRYFsR2G5MIO9SUGHYkCDfWMsstNO5p5q3A'

class myInterceptor implements rcp.Interceptor {
  // async去掉
  intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    context.request.headers!.authorization = `Bearer ${key}`
    return next.handle(context) //多个拦截器之间传递数据  context
  }
}
// const url: string = 'https://maas-cn-southwest-2.modelarts-maas.com/v1/infers/271c9332-4aa6-4ff5-95b3-0cf8bd94c394/v1/chat/completions'
//封装 专门用于处理大语言模型的类
class DeepSeekRcp {
  session: rcp.Session | null = null
  globalFn: (content: string, finish: string | null) => void = (content: string, finish: string | null) => {
  }
  globalRequest: rcp.Request | null = null
  initSession() {
    // 创建会话
    let session = rcp.createSession({
      //查找选择器具体代码时 会自动调用类的intercept()
      interceptors: [
        new myInterceptor(),
      ],
      requestConfiguration: {
        transfer: {
          timeout: { connectMs: 10000 } //最大连接时间
        },
        tracing: {
          //追踪http响应的详细信息
          // 监听 每次服务器响应的数据 详细信息
          httpEventsHandler: {
            //接收数据
            onDataReceive: (ArrayBuffer) => {
              //为收到的http数据(二进制数据)
              //ArrayBuffer是二进制数据容器  0,1 是不可以直接转成字符串
              // 然后由unit8Array转成字符串
              // 转unit8
              let unit8 = new Uint8Array(ArrayBuffer)
              //转str
              let decoder = new util.TextDecoder()
              let str = decoder.decodeToString(unit8)
              console.log('str' + str) //SSE 流式返回数据
              let forMat = str.split("data: ")[1].split("\n")[0] //得到只包含sse对象的字符串
              if (forMat.includes('choices')) {
                //检查返回的数据中是否包含choice 我们要的部分
                // console.log('id:'+JSON.parse(forMat).id) //得到了id
                let choices: Choices = JSON.parse(forMat).choices[0]
                if (choices) {
                  console.log(choices.delta.content + '' + choices.finish_reason)
                  this.globalFn(choices.delta.content, choices.finish_reason) //调用函数
                }
              }
            }
          }
        }
      }
    })
    this.session = session
  }
  async postDeepSeek(data: LLMData, callback: (content: string, finish: string | null) => void) {
    if (!this.session) {
      // 创建会话  全局会话如果不存在会话 则创建 初始化一次
      this.initSession()
    }
    this.globalFn = callback
    //发请求
    //鸿蒙原生的session会话回答http请求中 有 get put post delete fetch()
    // xhr =new XMLHttpRequest()  ajax->axios 支持promise回调
    // fetch 原生就支持promise回调 在鸿蒙中session中get put post delete 默认并没有实现中途取消发送请求
    //fetch 在发送请求前 需要包装 请求 ,在这个包中 就实现中间取消发送请求
    //  this.session?.post(url,data) //不使用异步 可以异步返回数据测试
    this.globalRequest = new rcp.Request(url, 'POST', {}, data) //包装请求  (类)
    let res = await this.session?.fetch(this.globalRequest) //更换为fetch请求实现中途取消发送请求
    console.log('res:' + JSON.stringify(res))
  }
  cancelSend() {
    this.session?.cancel(this.globalRequest)
  }
}
// export const rcpClient = new RcpClient()

export const deepSeekRcp = new DeepSeekRcp()

// 大模型数据参数类型
export interface LLMData {
  model: string
  messages: LLMDataMsg[]
  stream: boolean // 是否流式返回数据
  stream_options?: StreamOpt
  temperature: number // 0-1  温度 温度越高 模型越 deterministic活泼 温度越低 模型越 stochastic严谨
}

export interface LLMDataMsg {
  id: string
  role: 'user' | 'system' | 'assistant'
  content: string
}

interface StreamOpt {
  include_usage: boolean
}

export interface Choices {
  index: number
  delta: Delta
  logprobs: null
  finish_reason: string | null
}

interface Delta {
  content: string
}