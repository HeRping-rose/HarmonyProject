
import { AppStorageV2, KeyboardAvoidMode } from "@kit.ArkUI"
import util from "@ohos.util"
import { auth, getContext2, MyNavBar, PAGE_PATH, User } from "basic"
import { DeepSeekMsgItem } from "../components/DeepSeekMsgItem"
import { LLMData, MessageItem } from "../viewmodels"
import { rcpClient } from "../utils/rcpClient"
import { HMRouterMgr } from "@hadss/hmrouter"

@ComponentV2
export  struct IntelligenceView {
  @Local inputText:string= ''
  //安全区
  // 获取上下文
  context = this.getUIContext()

  // getContext():Context{
  //   return AppStorageV2.connect(getContext2)!.context
  // }
  // context=this.getContext()
  user:User=auth.getUser()
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
  // 提示词
  startPrompt:string=`hi `



  // sendData(){
  //   // 1.只要发请求用户就进行了提问
  //   this.list.push({
  //     id: util.generateRandomUUID(), //生成随机uuid
  //     role: 'user', //user:用户，assistant:助手  system:系统
  //     content:this.inputText, // 内容
  //   },)
  //   let params = {
  //     model: "DeepSeek-V3",
  //     //model参数
  //     messages: [
  //     // { role: "system", content: this.startPrompt}, //this.startPrompt
  //       { role: "system", content: '请回答' },
  //       { role: "user", content: this.inputText } //this.inputText
  //     ],
  //     //是否开启流式推理,  默认为False, 表示不开启流式推理
  //     stream: true,
  //     //在流式输出时是否展示使用的token数目。只有当stream为True时改参数才会生效
  //     // stream_options: { "include_usage": true },
  //     //控制采样随机性的浮点数,值较低时模型更具确定性，值较高时模型更具创造性"0"表示贪婪取样。默认为0.6。
  //     temperature: 0.6
  //   } as LLMData
  //
  //   this.printing = true //显示正在打印中  只要在回答问题了就改为 true 提升到请求外反应变快
  //   rcpClient.sendToLLM(params as LLMData,(content: string, finish: string | null)=>{
  //     // this.temp+=content
  //
  //
  //     // this.list.push({
  //     //   id: util.generateRandomUUID(), //生成随机uuid
  //     //   role: 'system', //user:用户，assistant:助手  system:系统
  //     //   content: content, // 内容
  //     // })
  //     //初次是需要创建一个sysMsg实例  第一次创建这一行数据  下次 就只需要修改这一行数据的content属性值
  //
  //     //先看list中是否有sysMsg这一行数据  如果有 就说明创建过了 如果没有就创建一次
  //     let  item=this.list.find((i=>i.id==this.sysId))  //返回是找到哪项   |undefined
  //     if (item) {
  //       item.content+=content
  //     }else {
  //       // 第一次创建
  //       let sysMsg = new MessageItem()
  //       // sysMsg.id = util.generateRandomUUID()
  //       // this.sysId = sysMsg.id
  //       this.sysId = util.generateRandomUUID()
  //       sysMsg.id = this.sysId
  //       sysMsg.role = 'system'
  //       sysMsg.content = content
  //       this.list.push(sysMsg)
  //     }
  //
  //     if(finish){
  //       //打印完  置空
  //       this.sysId=''
  //       this.printing=false //正常结束 改变打印状态
  //     }
  //   }) //声明监听
  // }

  aboutToAppear(): void {
    //1. 配置键盘避让时页面的避让模式
    this.context.setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE)  // 默认0往上抬 1压缩 2上移 3压缩 4 不避让
  }
  build() {
    NavDestination(){
      Column() {
        //头部
        MyNavBar({ title: 'AI面试官', showRightIcon: true})
        Button('aiView')
          .onClick(()=>{
            HMRouterMgr.push({
              pageUrl:PAGE_PATH.AI_CREATION_PAGE
            })
          })
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
              // this.sendData()
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
                // this.sendData()
              })
          }

        }
      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}
