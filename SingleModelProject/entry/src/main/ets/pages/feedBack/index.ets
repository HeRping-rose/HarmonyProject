import { AppStorageV2, promptAction } from "@kit.ArkUI"
import { HcNavBar } from "../../commons/components/HcNavBar"
import { httpClient } from "../../commons/utils/httpClient"
import { CurrentQuestionId, OutArea } from "../../models"
import { FeedBackDialog } from "./components/FeedBackDialog"

interface ErrorItem {
  label: string,
  value: string,
  checked: boolean
}
interface FeedbackItem {
  questionId: string
  type: string[]
  feedbackInfo: string
}

interface ResItem {
  id: string;
}

interface FeedbackRes {
  success: boolean,
  code: number,
  message: string,
  data: ResItem
}

@ComponentV2
struct FeedBack {
  outArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!
  currentQuestionId = AppStorageV2.connect(CurrentQuestionId, () => new CurrentQuestionId())!
  @Local errorTypes: ErrorItem[] = [
    { label: '知识点不准确', value: 'inaccurate', checked: false },
    { label: '内容不准或错误', value: 'wrong', checked: false },
    { label: '题目重复', value: 'repeat', checked: false },
    { label: '其他', value: 'other', checked: false }
  ]
  @Local description: string = ''
  @Local showDialog: boolean = false
  @Local ResId:string=''
  // @Local questionId:string=''

  // feedBackDialog =new CustomDialogController({
  //   builder: FeedBackDialog(),
  //   customStyle:true,
  //   alignment:DialogAlignment.Bottom
  // })
  aboutToAppear(): void {
    console.log('当前试题id:'+JSON.stringify(this.currentQuestionId))
  }

  async subFeedBack() {
    // 构建反馈类型数组
    const feedbackTypes: string[] = this.errorTypes
      .filter(item => item.checked)
      .map(item => {
        const typeMap: Record<string, string> = {
          'inaccurate': '2',  // 知识点不准确
          'wrong': '1',       // 内容不准或错误
          'repeat': '3',      // 题目重复
          'other': '4'        // 其他
        };
        return typeMap[item.value] || '4';
      });

    try {
      // 发送请求
      let res = await httpClient.request<ResItem, FeedbackItem>({
        method: 'post',
        url: 'question/feedback',
        headers: {
          "Content-Type": "application/json"
        },
        data: {
          feedbackInfo: this.description,
          questionId:this.currentQuestionId.id, // 如果需要传题目ID，可以从上下文获取
          type: feedbackTypes.length > 0 ? feedbackTypes : ['4'] // 至少选择一个类型
        }
      });

      this.ResId = res.id;
      // 提示
      console.log(JSON.stringify(res))
      promptAction.openToast({ message: "反馈成功" + res.id });
    }catch (error) {
      promptAction.openToast({ message: "反馈失败" + error });
    }
  }


  build() {
    NavDestination(){
      Stack(){
        Column({ space: 10 }) {
          //头部
          HcNavBar({ title: '意见反馈', showRightIcon: false })
            .padding(0)
            .margin(0)
          // 错误类型
          Text('错误类型（可多选）')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 8 })

          Column() {
            ForEach(this.errorTypes, (item: ErrorItem, index: number) => {
              Row({ space: 8 }) {
                Checkbox()
                  .select(item.checked)
                  .onChange((value: boolean) => {
                    this.errorTypes[index].checked = value
                  })
                Text(item.label)
                  .fontSize(16)
              }
              .margin({ bottom: 8 })
            })
          }
          .alignItems(HorizontalAlign.Start)
          .width('100%')

          Divider().margin({ top: 8, bottom: 8 })

          // 问题描述
          Text('问题描述（可选填）')
            .fontSize(16)
            .margin({ bottom: 8 })

          TextArea({
            text: this.description,
            placeholder: '请输入问题描述（可选填）'
          })
            .maxLength(200)
            .height(80)
            .border({ color: '#e0e0e0', width: 1 })
            .margin({ bottom: 4 })
            .onChange((value: string) => {
              this.description = value
            })
          // 字数统计
          Row() {
            Text(`${this.description.length}/200`)
              .fontSize(12)
              .fontColor('#888')
              .width('100%')
              .alignSelf(ItemAlign.End)
            Blank()
          }
          .width('100%')

          .justifyContent(FlexAlign.End)

          // 提交按钮
          Button('提交反馈')
            .width('100%')
            .height(40)
            .backgroundColor('#4ecb73')
            .fontColor('#fff')
            .fontSize(18)
            .onClick(() => {
              // 这里可以添加提交逻辑
              let selectedTypes = this.errorTypes.filter(item => item.checked).map(item => item.label)
              console.log('选中的类型:', selectedTypes)
              console.log('描述:', this.description)
              //发送post请求
              this.subFeedBack()

            })
            .margin({ top: 20 })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ top: 10 })
        .width('100%')
        .height('100%')

      }

    }
    .width('100%')
    .height('100%')
    .hideTitleBar( true)
    .padding({left:10,right:10,
      })
    // .margin({ top: this.outArea.topHeight, bottom: this.outArea.bottomHeight})
    .onReady(async (ctx:NavDestinationContext) => {

      console.log(ctx.pathInfo.param as string)
      // 可以将题目ID存储到组件状态中供反馈使用
      // this.questionId = ctx.pathInfo.param as string
    })

  }


}

@Builder
function FeedBackFn() {
  FeedBack()
}

export { FeedBackFn }