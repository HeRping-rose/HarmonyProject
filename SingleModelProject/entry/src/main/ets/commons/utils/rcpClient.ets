import { rcp } from '@kit.RemoteCommunicationKit'
import { Choices, LLMData } from '../../models'
import { util } from '@kit.ArkTS'


// 自定义拦截器 Interceptor  并且要实现接口
//外层的类的定义 扩展
const url='https://maas-cn-southwest-2.modelarts-maas.com/v1/infers/271c9332-4aa6-4ff5-95b3-0cf8bd94c394/v1/chat/completions'
const key='wpWhoozWVZwbF7l0RFcSyhQ_f715RKe4lLX1hv9pVEXowWYqiXzBRYFsR2G5MIO9SUGHYkCDfWMsstNO5p5q3A'

class myInterceptor implements rcp.Interceptor{
  // async去掉
   intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    // throw new Error('Method not implemented.')
    // this.step()
    // this.step2()
    // this.step3()
    context.request.headers!.authorization=`Bearer ${key}`
    // context.header.cookies='xxxx'

    // context.header.authorization='Bearer token 123456789'

    // let response=await next.handle(context)  //当已经没有下一个拦截器时 正常发http请求
    // if(response.statusCode==401){
    //   // 刷新token
    //   return Promise.reject('fail')
    // }
    return next.handle(context)  //多个拦截器之间传递数据  context


  }
  // 步骤1,2,3
  step(){}
  step2(){}
  step3(){}
}

// const url: string = 'https://maas-cn-southwest-2.modelarts-maas.com/v1/infers/271c9332-4aa6-4ff5-95b3-0cf8bd94c394/v1/chat/completions'
//封装 专门用于处理大语言模型的类
class RcpClient{
  session:rcp.Session|null = null
  globalFn:(content:string,finish:string|null)=>void = (content: string, finish: string | null)=>{}
  globalRequest:rcp.Request|null = null
  initSession(){
    // 创建会话
    let session=rcp.createSession({
      //查找选择器具体代码时 会自动调用类的intercept()
      interceptors:[
        new myInterceptor(),
      ],
      requestConfiguration:{
        transfer:{
          timeout:{connectMs:10000} //最大连接时间
        },
        tracing:{ //追踪http响应的详细信息
          // 监听 每次服务器响应的数据 详细信息
          httpEventsHandler:{
            //接收数据
            onDataReceive:(ArrayBuffer)=>{
              //为收到的http数据(二进制数据)
              //ArrayBuffer是二进制数据容器  0,1 是不可以直接转成字符串
              // 然后由unit8Array转成字符串
              // 转unit8
              let unit8=new Uint8Array(ArrayBuffer)
              //转str
              let decoder=new util.TextDecoder()
              let str =decoder.decodeToString(unit8)
              console.log('str'+ str)   //SSE 流式返回数据
              let forMat=str.split("data: ")[1].split("\n")[0]   //得到只包含sse对象的字符串
              if(forMat.includes('choices')){
                //检查返回的数据中是否包含choice 我们要的部分
                // console.log('id:'+JSON.parse(forMat).id) //得到了id
                let  choices:Choices=JSON.parse(forMat).choices[0]
                if(choices){
                  console.log(choices.delta.content + '' + choices.finish_reason)
                  this.globalFn(choices.delta.content,choices.finish_reason)  //调用函数
                }
              }
            }
          }
        }
      }
    })
    this.session=session

  }

  async sendToLLM(data:LLMData, callback:(content: string, finish: string | null)=>void){

    if(!this.session){
      // 创建会话  全局会话如果不存在会话 则创建 初始化一次
      this.initSession()
    }
    this.globalFn=callback
    //发请求

    //鸿蒙原生的session会话回答http请求中 有 get put post delete fetch()
    // xhr =new XMLHttpRequest()  ajax->axios 支持promise回调
    // fetch 原生就支持promise回调 在鸿蒙中session中get put post delete 默认并没有实现中途取消发送请求
    //fetch 在发送请求前 需要包装 请求 ,在这个包中 就实现中间取消发送请求
    //  this.session?.post(url,data) //不使用异步 可以异步返回数据测试
    this.globalRequest=new rcp.Request(url,'POST',{},data) //包装请求  (类)
    let res=await this.session?.fetch(this.globalRequest) //更换为fetch请求实现中途取消发送请求
    console.log('res:'+ JSON.stringify(res))

    /* {"id":"chat-78a3750ff3bc4a13bf9d41ee4029be04","object":"chat.completion","created":1753953900,"model":"DeepSeek-V3","choices":[{"index":0,"message":{"role":"assistant","content":"你好！有什么我可以帮你的吗？😊","reasoning_content":null,"tool_calls":[]},"logprobs":null,"finish_reason":"stop","stop_reason":null}],"usage":{"prompt_tokens":10,"total_tokens":21,"completion_tokens":11},"prompt_logprobs":null}
     * */
  }

  cancelSend() {
    this.session?.cancel(this.globalRequest)
  }
}

export const rcpClient=new RcpClient()