import { AppStorageV2, UIContext, window } from '@kit.ArkUI';
import { OutArea, savedContext } from '../../models';

class  FullScreen{
  //开启全屏
  async openFullScreen() {
    //取context  从全局仓库中取 加载时候的上下文
    let res=AppStorageV2.connect(savedContext)! //非空断言
    // res ={context:this.context}
    let win = await window.getLastWindow(res.context);
    // 全屏
    await win.setWindowLayoutFullScreen(true)

  //   需要获取到避嫌区域的高度
  //   获取到状态栏区域
    let topArea=win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
    // 获取到底部区域
    let bottomArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
    // 获取到顶部区域高度
    let topHeight=new UIContext().px2vp(topArea.topRect.height)
    // 获取到底部区域高度
    let bottomHeight= new UIContext().px2vp(bottomArea.bottomRect.height)

    let outArea=AppStorageV2.connect(OutArea,()=>new OutArea(0,0))!
    outArea.topHeight=topHeight
    outArea.bottomHeight= bottomHeight




  }

  //关闭全屏
  async closeFullScreen() {
    let res=AppStorageV2.connect(savedContext)!
    let win = await window.getLastWindow(res.context);
    await win.setWindowLayoutFullScreen(false)
    // AppStorageV2.remove<OutArea>(OutArea)
    let outArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!
    outArea.topHeight = 0
    outArea.bottomHeight = 0
  }
}

export const fullScreen = new FullScreen();