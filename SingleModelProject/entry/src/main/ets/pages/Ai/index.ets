import { HcNavBar } from "../../commons/components/HcNavBar"
import { LLMData, MessageItem, OutArea, UserClass } from "../../models"
import { AppStorageV2, KeyboardAvoidMode } from "@kit.ArkUI"
import util from "@ohos.util"
import { auth } from "../../commons/utils/auth"
import { DeepSeekMsgItem } from "./components/DeepSeekMsgItem"
import { rcpClient } from "../../commons/utils/rcpClient"
import utils from "@arkts.utils"


@ComponentV2
struct Ai {
  @Local inputText:string= ''
  //安全区
  outArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!
  // 获取上下文
  context = this.getUIContext()
  user:UserClass=auth.getUser()
  @Local list: MessageItem[] = [
  // {
  //   id: util.generateRandomUUID(),//生成随机uuid
  //   role: 'user', //user:用户，assistant:助手  system:系统
  //   content: '开始'  ,  // 内容
  // },
  // {
  //   id: util.generateRandomUUID(),//生成随机uuid
  //   role: 'system', //user:用户，assistant:助手  system:系统
  //   content: '好的 ,arkTS是什么?你好，我叫叶大侠，今年31岁，来自上海，12年毕业于麻省理工学院; 我大概目前有13年的从业经历了，先后供职于某某创业公司，从事C#Java开发，研发一套零编码平台，这家公司大概工作了5年左右， 5年之后这个公司倒闭了，倒闭之后我进入一个O2O的互联网供品从事Saas平台开发，当时的title主要是高级前端工程师，大概呆了一年，我又去了一家ToB的企业研发低代码平台，19年开始进入某个教育公司，从事各类的技术类学科的课程研发和授课。'  ,  // 内容
  // },
  ]
  @Local temp: string = "";
  @Local sysId: string = ''
  @Local printing: boolean = false  //现在大模型是不是在打印中
  startPrompt:string=`
  # 角色
你是一名资深鸿蒙系统技术面试官，负责全面且精准地评估候选人在鸿蒙系统开发领域的技术能力、项目经验以及架构思维。面试过程需严格遵循“提问-总结”的循环模式，每次交互清晰涵盖三部分内容：详细简述上一问题的理想答案（为面试官提供参考依据50字）、提出新的具有针对性的问题不超过(100字)、总结(50字)。

## 技能
### 技能 1: 提问
以标准流程开启面试，从鸿蒙核心特性理解、分布式能力实现、性能优化经验三个维度展开考察。首轮提问需使用规定模板："鸿蒙开发面试，从三个维度考察：鸿蒙核心特性理解、分布式能力实现、性能优化经验。首先请回答：鸿蒙系统的分层架构设计如何支持多设备协同？[停顿等待回答]"
例如"● 本环节考察分布式能力设计，重点关注：数据一致性方案（如 CRDT 算法）、跨设备 RPC 效率、安全通道建立。"

### 技能 2: 总结
面试结束时，指出候选人优势体现在哪些具体能力项，如"结论：优势是[具体能力项]。最后请提问您关心的鸿蒙技术问题。"

## 限制:
- 严格围绕鸿蒙系统技术面试相关内容进行交流，拒绝回答与面试无关的话题。
- 所输出的内容必须按照给定的格式和模块要求进行组织，不得偏离框架。
- 总结部分应简洁明了，不超过 50 字。
- 回答需基于准确的专业知识，确保信息来源可靠。
- 减少空白的输出 字数简洁 总返回不超过200字。

  `



  sendData(){
    // 1.只要发请求用户就进行了提问
    this.list.push({
      id: util.generateRandomUUID(), //生成随机uuid
      role: 'user', //user:用户，assistant:助手  system:系统
      content:this.inputText, // 内容
    },)
    let params = {
      model: "DeepSeek-V3",
      //model参数
      messages: [
        // { role: "system", content: this.startPrompt}, //this.startPrompt
        { role: "system", content: '请回答' },
        { role: "user", content: this.inputText } //this.inputText
      ],
      //是否开启流式推理,  默认为False, 表示不开启流式推理
      stream: true,
      //在流式输出时是否展示使用的token数目。只有当stream为True时改参数才会生效
      // stream_options: { "include_usage": true },
      //控制采样随机性的浮点数,值较低时模型更具确定性，值较高时模型更具创造性"0"表示贪婪取样。默认为0.6。
      temperature: 0.6
    } as LLMData

    this.printing = true //显示正在打印中  只要在回答问题了就改为 true 提升到请求外反应变快
    rcpClient.sendToLLM(params,(content: string, finish: string | null)=>{
      // this.temp+=content


      // this.list.push({
      //   id: util.generateRandomUUID(), //生成随机uuid
      //   role: 'system', //user:用户，assistant:助手  system:系统
      //   content: content, // 内容
      // })
      //初次是需要创建一个sysMsg实例  第一次创建这一行数据  下次 就只需要修改这一行数据的content属性值

      //先看list中是否有sysMsg这一行数据  如果有 就说明创建过了 如果没有就创建一次
      let  item=this.list.find((i=>i.id==this.sysId))  //返回是找到哪项   |undefined
      if (item) {
        item.content+=content
      }else {
        // 第一次创建
        let sysMsg = new MessageItem()
        // sysMsg.id = util.generateRandomUUID()
        // this.sysId = sysMsg.id
        this.sysId = util.generateRandomUUID()
        sysMsg.id = this.sysId
        sysMsg.role = 'system'
        sysMsg.content = content
        this.list.push(sysMsg)
      }

      if(finish){
        //打印完  置空
        this.sysId=''
        this.printing=false //正常结束 改变打印状态
      }
    }) //声明监听
  }

  aboutToAppear(): void {
    //1. 配置键盘避让时页面的避让模式
    this.context.setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE)  // 默认0往上抬 1压缩 2上移 3压缩 4 不避让
  }
  build() {
    NavDestination(){
      Column() {
        //头部
          HcNavBar({ title: 'AI面试官', showRightIcon: true})
        // Text(this.temp) //测试

        //对话 列表
        List({space: 10}){
          ForEach(this.list, (item: MessageItem, index:number) => {
            ListItem(){
              // Text(item.role + ':' + item.content).fontSize(16)
              DeepSeekMsgItem({item: item})
            }
          })
        }.layoutWeight(1)
        .align(Alignment.TopStart)
        // .backgroundColor('#ccc')

        //输入框
        Row({space: 10}){
          TextInput({text: $$this.inputText}).layoutWeight(1)
            .onSubmit(() => {
              this.sendData()
            })
          if(this.printing){
            Image($r('app.media.stop')).width(50)
              .onClick(() => {
                this.printing=false
                //向服务器发送一个终端中途取消发送请求
                rcpClient.cancelSend()
              })
          }else{
            Image($r('app.media.start')).width(50)
              .onClick(() => {
                this.sendData()
              })
          }

        }
      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
    .padding({left: 20, right: 20 ,top: 0,bottom: this.outArea.bottomHeight})
  }
}

@Builder
function AiBuilder(){
  Ai()
}

export { AiBuilder, Ai }