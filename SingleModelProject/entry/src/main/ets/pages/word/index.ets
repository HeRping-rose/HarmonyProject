import { HcNavBar } from "../../commons/components/HcNavBar"
import { resourceManager } from "@kit.LocalizationKit"
import { common } from "@kit.AbilityKit"
import { util } from "@kit.ArkTS"
import { wordItem, WordType } from "../../models"
import { WordDialog } from "./components/WordDialog"

@ComponentV2
struct Word {
  context = this.getUIContext().getHostContext() as common.UIAbilityContext
  words: WordType={}
  @Local activeKey:string='' //'HTML5'
  scroller=new Scroller()
  @Local activeZh:string='' // 'HTML5'
  @Local activeEn:string=''

  // 自定义弹窗
  dialog=new CustomDialogController({
    builder:WordDialog({zh:this.activeZh,en:this.activeEn}),
    customStyle:true,
    alignment:DialogAlignment.Center
  })

  // 初始化
  initWords(){
    const uinit8Array=this.context.resourceManager.getRawFileContentSync('word.json')

    //创建一个工具实例(文本转化 解码 )
    const textDecode=new util.TextDecoder()
    // 转字符串
    const jsonStr= textDecode.decodeToString(uinit8Array)
    console.log(jsonStr)
    this.words=JSON.parse(jsonStr)
    // this.words['HTML5']
    this.activeKey=Object.keys(this.words)[0] //获得key名


  }
  aboutToAppear(): void {
    this.initWords()
  }
@Builder
  MyMenu(){
   Menu() {

     ForEach(Object.keys(this.words), (key:string) => {
       MenuItem({ content: key })
         .onClick(() => {
           this.activeKey=key
           // this.scroller.scrollTo({ xOffset: 0,yOffset:0 })
           this.scroller.scrollEdge( Edge.Top)
         })
     }
       )
    }
  }


  build() {
    //必须用NavDestination包裹
    NavDestination() {
      Column() {
        HcNavBar({ title: '常用单词', showRightIcon: false })
        Row() {
          Column({ space: 4 }) {
            Text('开发常用词汇')
            Text(`共 ${this.words[this.activeKey].length} 个单词`)
              .fontSize(12)
              .fontColor($r('app.color.common_gray_03'))
          }
          .alignItems(HorizontalAlign.Start)

          Row() {
            Text(this.activeKey)
              .fontSize(12)
              .fontColor($r('app.color.common_gray_01'))
            Image($r('sys.media.ohos_ic_public_arrow_down'))
              .width(16)
              .aspectRatio(1)
              .fillColor($r('app.color.common_gray_01'))
          }
          .bindMenu(this.MyMenu)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding(16)
        .border({ width: { top: 0.5 }, color: $r('app.color.common_gray_bg') })

        Divider().strokeWidth(8).color($r('app.color.common_gray_bg'))

        List({scroller:this.scroller}) {
          ForEach(this.words[this.activeKey], (item:wordItem) => {

            ListItem() {
              Row({ space: 6 }) {
                //n喇叭小图标
                Image($r('sys.media.ohos_ic_public_sound'))
                  .width(20)
                  .aspectRatio(1)
                  .alignSelf(ItemAlign.Start)
                  .fillColor($r('app.color.common_gray_03'))
                  .onClick(()=>{
                    this.activeZh=item.zh
                    this.activeEn=item.en
                    this.dialog.open()
                  })
                Column({ space: 10 }) {
                  Text(item.en)
                    .fontWeight(FontWeight.Bold)
                  Text(item.zh)
                    .fontSize(14)
                    .fontColor($r('app.color.common_gray_03'))
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)

                Row() {
                  Text('详细代码')
                    .fontSize(12)
                    .fontColor($r('app.color.common_gray_01'))
                  Image($r('sys.media.ohos_ic_public_arrow_right'))
                    .width(16)
                    .aspectRatio(1)
                    .fillColor($r('app.color.common_gray_01'))
                }
                .alignSelf(ItemAlign.End)
              }
              .padding(16)
            }
          })
        }
        .divider({
          strokeWidth: 0.5,
          color: $r('app.color.common_gray_bg')
        })
        .layoutWeight(1)
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}

@Builder
function WordFn() {
  Word()
}

export { WordFn }