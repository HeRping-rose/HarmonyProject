
import { Context } from "@kit.AbilityKit"
import { AppStorageV2, display, UIContext, window } from "@kit.ArkUI"
import { AppBreakPoint, AppSafeArea, BreakPointEnum } from "../viewmodels"
import { deviceInfo } from "@kit.BasicServicesKit"

export class ScreenManager {
  ctx?: Context

  // 注册屏幕宽度变化
  async registerWindowSizeChange() {
    const win = await this.getWin() // 获取window对象
    this.judgeScreen(new UIContext().px2vp(display.getDefaultDisplaySync().width)) // 第一次手动判断一次  //可注释 防御性代码 ,有小bug同步
    win.on("windowSizeChange", (size) => {
      this.judgeScreen(new UIContext().px2vp(size.width)) // vp区间
    })
  }

  // 判断屏幕
  judgeScreen(width: number) {
    let breakPoint: BreakPointEnum = BreakPointEnum.XS
    if (width > 0 && width < 320) {
      breakPoint = BreakPointEnum.XS
    } else if (width >= 320 && width < 600) {
      breakPoint = BreakPointEnum.SM
    } else if (width >= 600 && width < 840) {
      breakPoint = BreakPointEnum.MD
    } else {
      breakPoint = BreakPointEnum.LG
    }
    //   V1 AppStorage.setOrCreate("key", "value")
    const app: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
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
    win.setWindowLayoutFullScreen(true)  // 全屏
    this.setAreaHeight(deviceInfo.deviceType === "2in1" ? 0 :
      new UIContext().px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height),
      new UIContext().px2vp(deviceInfo.deviceType === "2in1" ? 0 :
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

  //设置状态栏颜色
  async setStatusBarColor(color: string) {
    const win = await this.getWin()
    await win.setWindowSystemBarProperties({
      statusBarColor: color,
    })
  }


  getWin() {
    return window.getLastWindow(this.ctx || getContext())
  }



}

export const screenManager = new ScreenManager()