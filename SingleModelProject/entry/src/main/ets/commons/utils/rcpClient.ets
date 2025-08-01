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
              // console.log(str)   //SSE 流式返回数据
              let forMat=str.split("data: ")[1].split("\n")[0]   //得到只包含sse对象的字符串
              if(forMat.includes('choices')){
                //检查返回的数据中是否包含choice 我们要的部分
                // console.log('id:'+JSON.parse(forMat).id) //得到了id
                let  choices:Choices=JSON.parse(forMat).choices[0]
                if(choices){
                  // console.log(choices.delta.content + '' + choices.finish_reason)
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
    //let  res =await 不使用异步
     this.session?.post(url,data)
    // console.log('res:'+ JSON.stringify(res))
    //res:{"id":"chat-797d129e202c415ba7191aeff4c1f8bd","object":"chat.completion","created":1753945019,"model":"DeepSeek-V3","choices":[{"index":0,"message":{"role":"assistant","content":"你好！准备面试鸿蒙（HarmonyOS）程序员岗位需要从技术基础、鸿蒙系统特性、项目经验等多个方面进行准备。以下是一些关键建议，供你参考：\n\n---\n\n### 1. **掌握鸿蒙系统核心知识**\n   - **系统架构**：了解鸿蒙的分布式架构（内核层、系统服务层、框架层、应用层）、多设备协同能力。\n   - **开发语言**：熟练使用鸿蒙主推的开发语言：\n     - **ArkTS**（基于TypeScript的鸿蒙首选语言）\n     - **ArkUI**（声明式UI框架）\n     - 可选：Java、C/C++（用于底层开发或性能敏感场景）。\n   - **核心概念**：\n     - 能力（Ability）：UIAbility（界面）、ServiceAbility（后台服务）、DataAbility（数据共享）。\n
    // - 分布式技术：跨设备调用、数据同步。\n     - 原子化服务：FA（Feature Ability）和PA（Particle Ability）。\n\n---\n\n### 2. **熟悉开发工具与生态**\n   - **DevEco Studio**：鸿蒙官方IDE，熟悉其调试、预览、性能分析功能。\n   - **OpenHarmony**：如果是面向开源鸿蒙的岗位，需了解其与HarmonyOS的区别。\n   - **文档与社区**：熟读[鸿蒙官方文档](https://developer.harmonyos.com/)，关注开发者社区案例。\n\n---\n\n### 3. **项目经验与实战**\n   - **基础Demo**：能演示鸿蒙基础功能（如页面跳转、服务调用、分布式数据同步）。\n   - **分布式场景**：尝试开发一个简单的多设备协同应用（如手机与手表联动）。\n   - **开源贡献**：如果有OpenHarmony的代码贡献或开源项目，会是加分项。\n\n---\n\n### 4. **面试常见问题准备**\n   - **技术问题**：\n     - 鸿蒙的分布式调度如何实现？\n     - 如何优化鸿蒙应用的启动速度？\n     - ArkTS与TypeScript的区别是什么？\n   - **场景题**：\n     - 设计一个跨设备的文件共享功能。\n     - 如何解决多设备连接时的兼容性问题？\n   - **底层原理**：\n     - 鸿蒙的微内核与Android的宏内核区别？\n     - 鸿蒙如何实现低时延？\n\n---\n\n### 5. **加分项**\n   - **证书**：华为认证的鸿蒙应用开发者（HCIA-HarmonyOS）证书。\n   - **行业认知**：了解鸿蒙在物联网、智能家居、车载等场景的应用。\n   - **性能优化**：熟悉鸿蒙的内存管理、功耗优化策略。\n\n---\n\n### 6. **面试注意事项**\n   - 强调学习能力（鸿蒙生态较新，技术迭代快）。\n   - 展示对华为/鸿蒙生态的长期兴趣。\n\n如果需要更具体的资料（如代码示例、学习路线），可以告诉我你的技术背景（是否有移动端开发经验？），我会进一步细化建议！ 😊","reasoning_content":null,"tool_calls":[]},"logprobs":null,"finish_reason":"stop","stop_reason":null}],"usage":{"prompt_tokens":19,"total_tokens":659,"completion_tokens":640},"prompt_logprobs":null}

    /* {"id":"chat-78a3750ff3bc4a13bf9d41ee4029be04","object":"chat.completion","created":1753953900,"model":"DeepSeek-V3","choices":[{"index":0,"message":{"role":"assistant","content":"你好！有什么我可以帮你的吗？😊","reasoning_content":null,"tool_calls":[]},"logprobs":null,"finish_reason":"stop","stop_reason":null}],"usage":{"prompt_tokens":10,"total_tokens":21,"completion_tokens":11},"prompt_logprobs":null}
     * */

  }
}

export const rcpClient=new RcpClient()