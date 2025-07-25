import { HcNavBar } from "../../commons/components/HcNavBar"
import { Tag } from "../../commons/components/Tag"
import { AppStorageV2, promptAction } from "@kit.ArkUI"
import { JumpInfoClass, OutArea, QuestionDetail, QuestionLocalItem, questionOptParam } from "../../models"
import { httpClient } from "../../commons/utils/httpClient"
import { webview } from "@kit.ArkWeb"
import { myCustomDialog } from "./components/customDialog"
import { navPathStack } from "../../commons/utils/navPathStack"
import { questionLocal } from "../../commons/components/QuestionLocal"
import { myQuestionSharedDialog } from "./components/QuestionSharedDialog"
import { tracking } from "../../commons/utils/Tracking"

@ComponentV2
struct question {
  jumpInfo: JumpInfoClass = AppStorageV2.connect(JumpInfoClass, () => new JumpInfoClass())!
  @Local outArea: OutArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!
  @Local item: QuestionDetail ={} as QuestionDetail
  @Local isLike: number = 0
  @Local isCollect: number = 0
  @Local controller:webview.WebviewController=new webview.WebviewController()
  @Local startTime:number=0
  @Local endTime:number=0


  // 详情页自定义弹窗
  detailDialog =new CustomDialogController({
    builder: myCustomDialog(),
    customStyle:true,
    alignment:DialogAlignment.Center

  })

  //分享的自定义弹窗
  shareDialog =new CustomDialogController({
    builder: myQuestionSharedDialog({item:this.item}),
    customStyle:true,
    alignment:DialogAlignment.Center
  })

  aboutToAppear(): void {
  }

  async questionOpt() {
    await httpClient.request<null,questionOptParam>({
      method:'post',
      url: this.isLike == 0 ?'question/opt' :'question/unOpt' ,
      data:{
        id:this.item.id,
        type:0,
        optType:1
      }
    })
    if (this.isLike == 0) {
      this.isLike = 1
    } else {
      this.isLike = 0
    }
    // 弹窗提示
    promptAction.openToast({message:this.isLike==0? '取消成功':'点赞成功'})
  }

  async questionOpt2() {
    await httpClient.request<null, questionOptParam>({
      method: 'post',
      url: this.isCollect == 0 ? 'question/opt' : 'question/unOpt',
      data: {
        id: this.item.id,
        type: 0,
        optType: 1
      }
    })
    if (this.isCollect == 0) {
      this.isCollect = 1
    } else {
      this.isCollect = 0
    }
    promptAction.openToast({ message: this.isCollect == 0 ? '取消成功' : '收藏成功' }) // 弹窗提示
  }
  // 封装这两个函数 questionOpt questionOpt2 用一个函数就能实现这两个逻辑
  async questionOpt3(flag:number,optType: 1|2 ,text:string) {
    await httpClient.request<null, questionOptParam>({
      method: 'post',
      url: flag === 0 ? 'question/opt' : 'question/unOpt',
      data: {
        id: this.item.id,
        type: 0,
        optType: optType
      }
    })
    if (flag== 0) {
      flag = 1
      if(optType==1){
        this.isLike = 1
      }else{
        this.isCollect = 1
      }
    }else {
      flag = 0
      if (optType==1) {
        this.isLike = 0
      } else {
        this.isCollect = 0
      }
    }
    promptAction.openToast({ message: flag == 0 ? `取消${text}` : `${text}成功` })
  }


  @Builder
  TitleBuilder(text: string) {
    Row() {
      Text()
        .width(2)
        .height(12)
        .backgroundColor($r('app.color.black'))
        .margin({ right: 13 })
      Text(text)
        .fontWeight(700)
    }
    .width('100%')
    .padding({ top: 10 })
    .height(32)
  }

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: this.isLike==1? '取消点赞' : '点赞' })
        .onClick(()=>{
          // this.questionOpt()
          this.questionOpt3(this.isLike,1,'点赞')  //使用封装之后的方法
        })
      MenuItem({ content: this.isCollect == 1 ? '取消收藏' : '收藏'})
        .onClick(()=>{
          // this.questionOpt2()
          this.questionOpt3(this.isCollect,2,'收藏')

        })
      MenuItem({ content: '点我反馈' })
        .onClick(() => {
          navPathStack.pushPath({name:'feedBack'})
        })

      MenuItem({ content: '试题分享' })
        .onClick(() => {
          this.shareDialog.open()
        })
    }
    .width(108)
  }
  build() {
    //必须用NavDestination包裹
    NavDestination() {
      Column() {
        HcNavBar({ title: '试题详情', showRightIcon: false })
        // 题目
        this.TitleBuilder('题目：')
        Text(this.item.stem || 'ArkUI的容器组件有哪些？')
          .width('100%')
          .padding(16)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Row({ space: 12 }) {
          ForEach(this.item.stage,(i:string)=>{
            Tag({ font: i })
          })
          // Tag({ font: 'HarmonyOS' })
          // Tag({ font: 'ArkTS', color: '#ff6600' })
          Blank()
          Image($r("app.media.ic_home_more"))
            .width(20)
            .aspectRatio(1)
            .bindMenu(this.MenuBuilder())
        }
        .width('100%')
        .padding({ bottom: 16, left: 16, right: 16 })

        Divider()
          .strokeWidth(8)
          .color($r('app.color.common_gray_bg'))
        // 内容
        this.TitleBuilder('答案：')
        // Text(this.item.answer || '我是答案')
        //   .layoutWeight(1)
        //   .padding(16)
        Web({
          src:$rawfile('question.html'),
          controller:this.controller
        })
          .layoutWeight(1)
          .padding(16)
          .onPageEnd(()=>{
            if(this.item.answer){
              console.log("页面加载完成时")
              this.controller.runJavaScript(`writeHtml(\`${this.item.answer}\`)`)

              // 数据加载渲染完成 关闭加载 自定义弹窗
              this.detailDialog.close()
            }

          })


        Row({ space: 80 }) {
          Row() {
            Image($r('sys.media.ohos_ic_public_arrow_left'))
              .width(20)
              .aspectRatio(1)
              .fillColor(this.jumpInfo.activeIndex == 0 ? $r('app.color.common_gray_01'):$r('app.color.common_gray_03'))
            Text(' 上一题')
              .fontColor(this.jumpInfo.activeIndex == 0? $r('app.color.common_gray_01'):$r('app.color.common_gray_03'))
          }
          .onClick(() => {
            if(this.jumpInfo.activeIndex==0){
              promptAction.openToast({ message: "已经是第一题了" })
            }else {
            //   不是第一页
              // 视图更改一个对象的子集 就要追踪
              this.jumpInfo.activeIndex--
              navPathStack.replacePath({
                name: 'question',
                param: this.jumpInfo.idList[this.jumpInfo.activeIndex],
              })
            }
            // this.jumpInfo
          })

          Row() {
            Text('下一题 ')
              .fontColor(this.jumpInfo.activeIndex >= this.jumpInfo.ListLength - 1? $r('app.color.common_gray_01'):$r('app.color.common_gray_03'))
            Image($r('sys.media.ohos_ic_public_arrow_right'))
              .width(20)
              .aspectRatio(1)
              .fillColor(this.jumpInfo.activeIndex >= this.jumpInfo.ListLength - 1 ? $r('app.color.common_gray_01'):$r('app.color.common_gray_03'))
          }
          .onClick(() => {
            if(this.jumpInfo.activeIndex>=this.jumpInfo.ListLength-1){
              promptAction.openToast({ message: "已经是最后一题了" })
            }else{
              this.jumpInfo.activeIndex++
              navPathStack.replacePath({
                name: 'question',
                param: this.jumpInfo.idList[this.jumpInfo.activeIndex],
              })
            }
          })
        }
        .height(44)
        .width('100%')
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('100%')
      .padding({ bottom: this.outArea.bottomHeight })
    }
    .hideTitleBar(true)
    .onReady(async (ctx:NavDestinationContext) => {
      //获取 QuestionList传过来的id ctx.pathInfo.param as string
      this.detailDialog.open()
      console.log(ctx.pathInfo.param as string)
      let questionId = ctx.pathInfo.param as string

      let res :QuestionDetail ={} as QuestionDetail

      // if 本地有这道题 取本地 如果没有就发送请求 并且保存一次本地
      if(questionLocal.checkQuestion(questionId)){
        res= questionLocal.getQuestion(questionId) as QuestionDetail
        // 提示 取的是本地的题目
        promptAction.openToast({ message: "已取本地数据" })
      }else {
        res= await httpClient.request<QuestionDetail>({
          url: `question/${questionId}`
        })
        // 提示 提取服务器数据
        promptAction.openToast({ message: "已取服务器数据" })
        questionLocal.setQuestion(questionId,res as QuestionLocalItem)
        // 保存 提示
        promptAction.openToast({ message: "已保存" })
      }
      // let res= await httpClient.request<QuestionDetail>({
      //   url: `question/${questionId}`
      // })
      // console.log(JSON.stringify(res))
      console.log(JSON.stringify(res.likeFlag))
      // 第一步 接收当前用户是否已点赞 0未点赞 1已点赞
      this.isLike=res.likeFlag //初始为0
      this.isCollect=res.collectFlag  //收藏标志

      this.item=res

      //页面出来之后在加载一次URL
      this.controller.loadUrl($rawfile('question.html'))
    })
    .onShown(()=>{
      this.startTime=Date.now()
    })
    .onHidden(()=>{
      this.endTime=Date.now()
      //
      // 记录到数组
      tracking.record(this.item.id,this.startTime,this.endTime)
      //上报
      tracking.report()
    })
  }

}

@Builder
export function questionFn(){
  question()
}

export { question }
