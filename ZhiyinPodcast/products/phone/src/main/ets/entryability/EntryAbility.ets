import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AppStorageV2, window } from '@kit.ArkUI';
import { screenManager } from 'mine';
import { HMRouterMgr } from '@hadss/hmrouter';
import { getContext2 } from 'basic';

const DOMAIN = 0x0000;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    let appCtx=AppStorageV2.connect(getContext2,()=> new getContext2(this.context))
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
    HMRouterMgr.init({
      context:this.context,//在这里初始化 是为了 在封装的类中 获取上下文对象
    })
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    screenManager.ctx = this.context
    screenManager.registerWindowSizeChange()
    screenManager.full()
    // screenManager.setStateBarColor("white")


    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    screenManager.ctx = this.context
    screenManager.unRegisterWindowSizeChange()
    // screenManager.full()
  }
  onWindowStageRestore(windowStage: window.WindowStage): void {
    // screenManager.unRegisterWindowSizeChange()  //卸载监听事件
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