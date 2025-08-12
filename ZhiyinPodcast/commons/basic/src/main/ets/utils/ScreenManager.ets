import { Context } from "@kit.AbilityKit"
import { AppStorageV2, display, window, UIContext } from "@kit.ArkUI"
import { AppBreakPoint, AppSafeArea, BreakPointEnum } from "../viewmodels"
import { deviceInfo } from "@kit.BasicServicesKit"

export class ScreenManager {
  ctx?: Context

  // 注册屏幕宽度变化
  async registerWindowSizeChange() {
    const win = await this.getWin() // 获取window对象
    this.judgeScreen(new UIContext().px2vp(display.getDefaultDisplaySync().width)) // 第一次手动获取一次屏幕的宽度，有问题
    win.on("windowSizeChange", (size) => {
      this.judgeScreen(new UIContext().px2vp(size.width)) // vp区间
    })
  }

  // 判断屏幕
  judgeScreen(width: number) {
    let breakPoint: BreakPointEnum = BreakPointEnum.XS
    if (width > 0 && width < 320) {
      breakPoint = BreakPointEnum.XS
    } else if (width >= 320 && width < 520) {
      breakPoint = BreakPointEnum.SM
    } else if (width >= 520 && width < 840) {
      breakPoint = BreakPointEnum.MD
    } else {
      breakPoint = BreakPointEnum.LG
    }
    //   V1 AppStorage.setOrCreate("key", "value")
    const app = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
    app.breakPoint = breakPoint // 将断点值存入到全局状态
  }

  // 取消注册
  async unRegisterWindowSizeChange() {
    const win = await this.getWin() // 获取window对象
    win.off("windowSizeChange") // 卸载监听
  }

  // 全屏
  async full() {
    const win = await this.getWin()
    win.setWindowLayoutFullScreen(true)
    this.setAreaHeight(deviceInfo.deviceType === "2in1" ? 0 :
    px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height),
      px2vp(deviceInfo.deviceType === "2in1" ? 0 :
      win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).bottomRect.height))
    // 顶部安全区高度
    // 底部安全区高度
  }

  // 退出全屏
  async exitFull() {
    const win = await this.getWin()
    win.setWindowLayoutFullScreen(false)
    this.setAreaHeight(0, 0)
  }

  // 设置安全区高度
  setAreaHeight(top: number, bottom: number) {
    const app = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
    app.topHeight = top
    app.bottomHeight = bottom
  }

  //设置状态栏文字颜色
  async setStateBarColor(color:string){
    const win = await this.getWin()
    //置状态栏属性
    await win.setWindowSystemBarProperties({
      //设置状态栏文字颜色
      statusBarContentColor:color
    })
  }


  getWin() {
    return window.getLastWindow(this.ctx || getContext())
  }
}

export const screenManager = new ScreenManager()