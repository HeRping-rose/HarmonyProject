import { HcNavBar } from "../../commons/components/HcNavBar"
import { Tag } from "../../commons/components/Tag"
import { AppStorageV2 } from "@kit.ArkUI"
import { OutArea, QuestionDetail } from "../../models"
import { httpClient } from "../../commons/utils/httpClient"
import { webview } from "@kit.ArkWeb"

@ComponentV2
struct question {
  @Local outArea: OutArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!
  @Local item: QuestionDetail ={} as QuestionDetail
  @Local controller:webview.WebviewController=new webview.WebviewController()

  aboutToAppear(): void {

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
      MenuItem({ content: '点赞' })
      MenuItem({ content: '收藏' })
      MenuItem({ content: '点我反馈' })
      MenuItem({ content: '试题分享' })
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
            }

          })


        Row({ space: 80 }) {
          Row() {
            Image($r('sys.media.ohos_ic_public_arrow_left'))
              .width(20)
              .aspectRatio(1)
              .fillColor($r('app.color.common_gray_01'))
            Text(' 上一题')
              .fontColor($r('app.color.common_gray_01'))
          }

          Row() {
            Text('下一题 ')
              .fontColor($r('app.color.common_gray_03'))
            Image($r('sys.media.ohos_ic_public_arrow_right'))
              .width(20)
              .aspectRatio(1)
              .fillColor($r('app.color.common_gray_03'))
          }
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
      console.log(ctx.pathInfo.param as string)
      let questionId = ctx.pathInfo.param as string
        let res= await httpClient.request<QuestionDetail>({
        url: `question/${questionId}`
      })
      console.log(JSON.stringify(res))
      this.item=res

      //页面出来之后在加载一次URL
      this.controller.loadUrl($rawfile('question.html'))

    })
  }
}

@Builder
export function questionFn(){
  question()
}

export { question }
