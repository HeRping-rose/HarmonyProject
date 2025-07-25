import { AppStorageV2 } from "@kit.ArkUI"
import { HcNavBar } from "../../commons/components/HcNavBar"
import { OutArea } from "../../models"
import { FeedBackDialog } from "./components/FeedBackDialog"

interface ErrorItem {
  label: string,
  value: string,
  checked: boolean
}

@ComponentV2
struct FeedBack {
  outArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!
  @Local errorTypes: ErrorItem[] = [
    { label: '知识点不准确', value: 'inaccurate', checked: false },
    { label: '内容不准或错误', value: 'wrong', checked: false },
    { label: '题目重复', value: 'repeat', checked: false },
    { label: '其他', value: 'other', checked: false }
  ]
  @Local description: string = ''
  @Local showDialog: boolean = false

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
                Checkbox({
                  // checked: item.checked,
                  // onChange: (value: boolean) => {
                  //   this.errorTypes[index].checked = value
                  // }
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
            placeholder: '请输入问题描述（可选填）',
            // maxLength: 200,
            // onChange: (value: string) => {
            //   this.description = value
            // }
          })
            .maxLength(200)
            .height(80)
            .border({ color: '#e0e0e0', width: 1 })
            .margin({ bottom: 4 })
          // 字数统计
          Row() {
            Text(`${this.description.length}/200`)
              .fontSize(12)
              .fontColor('#888')
            Blank()
          }
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
              this.showDialog = false
            })
            .margin({ top: 20 })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ top: 10 })
        .width('100%')
        .height('100%')
        FeedBackDialog({ isShow: this.showDialog })
      }

    }
    .width('100%')
    .height('100%')
    .hideTitleBar( true)
    .padding({left:10,right:10,
      })
    // .margin({ top: this.outArea.topHeight, bottom: this.outArea.bottomHeight})
    // .backgroundColor('#ccc')

  }
}

@Builder
function FeedBackFn() {
  FeedBack()
}

export { FeedBackFn }