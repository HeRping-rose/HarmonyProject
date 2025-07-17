import { common } from '@kit.AbilityKit'
import { AppStorageV2, window } from '@kit.ArkUI'
import { fullScreen } from '../../commons/utils'
import { stateBar } from '../../commons/utils/StateBar'
import { OutArea } from '../../models'

@Entry
@ComponentV2
struct test {
  context=this.getUIContext().getHostContext() as common.UIAbilityContext

  outArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!

  build() {
    Column(){
      Column(){
        Button("开启沉浸式")
          .onClick(async ()=>{
            // 获取最上层的窗口
            // let win = await window.getLastWindow(this.context);
            // // 全屏
            // await win.setWindowLayoutFullScreen(true)
            fullScreen.openFullScreen()

          })
        Button("关闭沉浸式")
          .onClick(async () => {
            // 获取最上层的窗口
            // let win = await window.getLastWindow(this.context);
            // // 全屏
            // await win.setWindowLayoutFullScreen(false)
            fullScreen.closeFullScreen()

          })
        Button("状态栏文字颜色").onClick(async () => {
          // let win = await window.getLastWindow(this.context)
          // await win.setWindowSystemBarProperties({
          //   statusBarContentColor: '#ffbfaaaa'
          // })
          stateBar.light()
        })
        Button("状态栏文字颜色").onClick(async () => {
          let win = await window.getLastWindow(this.context)
          await win.setWindowSystemBarProperties({
            statusBarContentColor: '#ff80bbbf'
          })
        })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.SpaceAround)



    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ccc')
    .padding({
      top: this.outArea.topHeight ,
      bottom: this.outArea.bottomHeight,
    })
  }
}