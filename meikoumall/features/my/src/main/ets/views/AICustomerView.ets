import { HDMNavBar, AppSafeArea, PAGE_PATH, auth, User, deepSeekRcp, LLMData } from 'basic'
import { AppStorageV2, KeyboardAvoidMode } from '@kit.ArkUI'
import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'
import { util } from '@kit.ArkTS'

@ObservedV2
export class MessageItem {
  id: string = ''
  role: 'user' | 'system' | 'assistant' = 'system'
  @Trace content: string = '' //记得内容要追踪
}

@Preview
@HMRouter({ pageUrl: PAGE_PATH.AI_CUSTOMER_PAGE })
@ComponentV2
export struct AICustomerView {
  @Local inputText: string = ''
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  // 获取上下文
  context = this.getUIContext()
  user: User = auth.getUser()
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
  @Local printing: boolean = false //现在大模型是不是在打印中
  startPrompt: string = `hi`

  sendData() {
    // 1.只要发请求用户就进行了提问
    this.list.push({
      id: util.generateRandomUUID(), //生成随机uuid
      role: 'user', //user:用户，assistant:助手  system:系统
      content: this.inputText, // 内容
    },)
    let params = {
      model: "DeepSeek-V3",
      //model参数
      messages: [
      // { role: "system", content: this.startPrompt}, //this.startPrompt
        { role: "system", content: '请回答' },
        { role: "user", content: this.inputText }//this.inputText
      ],
      //是否开启流式推理,  默认为False, 表示不开启流式推理
      stream: true,
      //在流式输出时是否展示使用的token数目。只有当stream为True时改参数才会生效
      // stream_options: { "include_usage": true },
      //控制采样随机性的浮点数,值较低时模型更具确定性，值较高时模型更具创造性"0"表示贪婪取样。默认为0.6。
      temperature: 0.6
    } as LLMData

    this.printing = true //显示正在打印中  只要在回答问题了就改为 true 提升到请求外反应变快
    deepSeekRcp.postDeepSeek(params, (content: string, finish: string | null) => {
      // this.temp+=content


      // this.list.push({
      //   id: util.generateRandomUUID(), //生成随机uuid
      //   role: 'system', //user:用户，assistant:助手  system:系统
      //   content: content, // 内容
      // })
      //初次是需要创建一个sysMsg实例  第一次创建这一行数据  下次 就只需要修改这一行数据的content属性值

      //先看list中是否有sysMsg这一行数据  如果有 就说明创建过了 如果没有就创建一次
      let item = this.list.find((i => i.id == this.sysId)) //返回是找到哪项   |undefined
      if (item) {
        item.content += content
      } else {
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

      if (finish) {
        //打印完  置空
        this.sysId = ''
        this.printing = false //正常结束 改变打印状态
        this.inputText = ''
      }
    }) //声明监听
  }

  aboutToAppear(): void {
    //1. 配置键盘避让时页面的避让模式
    this.context.setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE) // 默认0往上抬 1压缩 2上移 3压缩 4 不避让
  }

  build() {
    Stack() {
      Column() {
        HDMNavBar({
          title: 'DeepSeekAI客服',
          onLeftClick: () => {
            HMRouterMgr.pop()
          }
        })

        // Column() {
          // Image('https://www.deepseek.com/images/logo.svg')
          //   .width(100)
          //   .aspectRatio(1)
          //   .margin({ top: 32, bottom: 16 })
          //   .shadow({
          //     radius: 8,
          //     color: '#1A73E8',
          //     offsetY: 4
          //   })
          //
          // Text('DeepSeekAI智能客服')
          //   .fontSize(24)
          //   .fontWeight(FontWeight.Bold)
          //   .margin({ bottom: 12 })
          //   .fontColor('#1A73E8')
          //
          // Text('您好，我是DeepseekAI智能客服助手，有什么可以帮助您的？')
          //   .fontSize(16)
          //   .textAlign(TextAlign.Center)
          //   .margin({ bottom: 32 })
          //   .padding({ left: 24, right: 24 })
          //   .fontColor('#666666')
          //对话 列表
          List({ space: 10 }) {
            ForEach(this.list, (item: MessageItem, index: number) => {
              ListItem() {
                // Text(item.role + ':' + item.content).fontSize(16)
                DeepSeekMsgItem({ item: item })
              }
            })
          }.layoutWeight(1)
          .padding({bottom:100})
          .align(Alignment.TopStart)

          // // 客服对话区域
          // Column() {
          //   // 模拟对话气泡
          //   Row() {
          //     Text('您好，我想咨询一下商品的退换货政策。')
          //       .fontSize(15)
          //       .backgroundColor('#1A73E8')
          //       .fontColor('#FFFFFF')
          //       .borderRadius(16)
          //       .padding({
          //         left: 16,
          //         right: 16,
          //         top: 12,
          //         bottom: 12
          //       })
          //       .margin({ right: 50 })
          //   }
          //   .width('100%')
          //   .justifyContent(FlexAlign.End)
          //   .margin({ bottom: 20 })
          //
          //   Row() {
          //     Image($r('app.media.ic_user_service'))
          //       .width(36)
          //       .height(36)
          //       .borderRadius(18)
          //       .margin({ right: 12 })
          //       .shadow({
          //         radius: 4,
          //         color: '#000000',
          //         offsetY: 2,
          //       })
          //
          //     Text('您好，根据我们的政策，商品在收到后7天内，如有质量问题可申请退换货。非质量问题的退换货需在收到商品后24小时内提出申请。具体可查看商品详情页的售后说明。')
          //       .fontSize(15)
          //       .backgroundColor('#F8F9FA')
          //       .borderRadius(16)
          //       .padding({
          //         left: 16,
          //         right: 16,
          //         top: 12,
          //         bottom: 12
          //       })
          //       .margin({ left: 10, right: 50 })
          //       .fontColor('#333333')
          //   }
          //   .width('100%')
          //   .justifyContent(FlexAlign.Start)
          //   .margin({ bottom: 20 })
          // }
          // .width('100%')
          // .padding({ left: 20, right: 20 })
          // .layoutWeight(1)
        // }
        // .width('100%')
        // .height('100%')
        // .backgroundColor('#FFFFFF')
      }
      .width('100%')
      // .height('100%')

      // 底部输入框区域
      Column() {
        Divider()
          .color('#F5F5F5')
          .width('100%')
          .strokeWidth(0.5)
          .opacity(0.8)

        Row() {
          TextInput({ text: $$this.inputText, placeholder: '请输入您的问题...' })
            .layoutWeight(1)
            .height(48)
            .backgroundColor('#F8F9FA')
            .borderRadius(24)
            .padding({ left: 20, right: 20 })
            .fontSize(16)
            .fontColor('#333333')
            .onSubmit(()=>{
              this.sendData()
            })

          Button('发送')
            .height(48)
            .backgroundColor('#1A73E8')
            .borderRadius(24)
            .margin({ left: 8 })
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#FFFFFF')
            .onClick(()=>{
              this.sendData()
              //清空输入框内容
              this.inputText = ''
            })
        }
        .width('100%')
        .padding({
          left: 16,
          right: 16,
          top: 12,
          bottom: 12
        })
        .backgroundColor('#FFFFFF')
      }
      .width('100%')
      .backgroundColor('#FFFFFF')
      .position({ y: '100%' })
      .translate({ y: -80 })
      .margin({ bottom: this.safeArea.bottomHeight })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}

@ComponentV2
export struct DeepSeekMsgItem {
  // V2所有传入的属性必须加param
  @Param
  item: MessageItem = {} as MessageItem
  // appUser: AppUser = PersistenceV2.connect(AppUser, () => new AppUser())!

  user: User = auth.getUser()

  @Builder
  getAvatar() {
    if (this.item.role === "system") {
      Image($r("app.media.customer"))
        .width(30)
        .aspectRatio(1)
        .borderRadius(15)
    } else {
      Image(this.user.avatar || $r('app.media.ic_mine_avatar'))
        .width(30)
        .aspectRatio(1)
        .borderRadius(15)
    }
  }

  build() {
    Row({ space: 20 }) {
      this.getAvatar()
      Row() {
        Text(this.item.content)
          .borderRadius(10)
          .padding(10)
          .lineHeight(24)
          .backgroundColor(this.item.role === "system" ? "#f8fafb" : "#3273e8")
          .fontColor(this.item.role === "system" ? "#373737" : "#fff")
          .constraintSize({
            minWidth: 40
          })
      }.layoutWeight(1)
      .justifyContent(this.item.role === "system" ? FlexAlign.Start : FlexAlign.End)

      Row()
        .width(30)
    }
    .direction(this.item.role === "system" ? Direction.Ltr : Direction.Rtl) // 反转方向
    .width('100%')
    .alignItems(VerticalAlign.Top)

  }
}