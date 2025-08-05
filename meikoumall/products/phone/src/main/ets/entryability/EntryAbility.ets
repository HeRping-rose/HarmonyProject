import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window ,UIContext, AppStorageV2} from '@kit.ArkUI';
import { AppBreakPoint, BreakPointEnum, Log, screenManager } from 'basic';

const DOMAIN = 0x0000;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }


  //当窗口创建时调用 就触发钩子函数
  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    // Main window is created, set main page for this ability

    screenManager.ctx=this.context  //先绑定ctx
    screenManager.registerWindowSizeChange()
    screenManager.full()


    // 1. 先获取最上层窗口
    // const win=await window.getLastWindow(this.context)
    // 2. 给这个窗口绑定监听事件(windowSizeChange) 当窗口尺寸发生改变的时候会触发
    // win.on('windowSizeChange',(size)=>{
    //   Log.info('windowSizeChange',JSON.stringify(size))
    //   const width: number=new UIContext().px2vp(size.width)  // 单位xp   -->转化为vp  px2vp()提升到全局了  需要新建一个UIContext对象实例链式调用
    //   // 判断现在的尺寸是在哪个断点区间 我们就记录一个断点名
    //   let breakpoint:BreakPointEnum=BreakPointEnum.SM
    //   if (width>0 && width<320) {
    //     breakpoint=BreakPointEnum.XS  //超小屏幕  手表
    //   }else if(width>=320 && width<600){
    //     breakpoint= BreakPointEnum.SM //中等屏  手机
    //   }else if(width>=600 && width<840){
    //     breakpoint= BreakPointEnum.MD //中等屏  折叠屏
    //   }else if(width>=840){
    //     breakpoint= BreakPointEnum.LG //中等屏  平板
    //   }
    //   Log.info('breakpoint',breakpoint)
    //   let app =AppStorageV2.connect(AppBreakPoint,()=>new AppBreakPoint())!
    //   app.breakPoint=breakpoint   //设置断点存到存储Storage
    //   // Log.info('app',JSON.stringify(app))
    //
    // })

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  //当窗口销毁(关闭)时调用 就触发钩子函数
  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources

    // const win=await window.getLastWindow(this.context)
    // win.off('windowSizeChange')
    screenManager.unRegisterWindowSizeChange()  //卸载监听事件
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}