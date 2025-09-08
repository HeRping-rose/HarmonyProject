import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { router, window } from '@kit.ArkUI';
import { formInfo } from '@kit.FormKit';
// import { rpc } from '@kit.IPCKit';

const DOMAIN = 0x0000;

export default class EntryAbility extends UIAbility {


  // 全局 要跳转的变量
  targetPage: string = 'pages/Index' //默认值是Index 如果没有传递参数 则跳转Index
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // 应用EntryAbility在onCreate中，通过 callee来监听不同的method事件。然后根据需求来处理业务
    

      // 防止语法报错，暂无实际应用
      // return new MyParcelable()
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  //   应用不在运行时 默认
    //接收参数params: {
    //               "targetPage": 'pages/Second'
    //             }
    //跨ability接收参数  借助want参数  核心接收参数targetPage
    // 1.要判断有没有传递参数 params 有传才后续操作
    // 判断formId是不是真的没有,如果有才可以继续,担心后期去给员服务配置启动图标时,就不可能携带formId
    // want.parameters[formInfo.FormParam.IDENTITY_KEY] !== undefined
    if( want.parameters && want.parameters[formInfo.FormParam.IDENTITY_KEY] !== undefined ){
      // 可以获取formId 接下来没用上  如果updateForm()才会用到
      const formId = want.parameters[formInfo.FormParam.IDENTITY_KEY]
      // 目标是获取传入的targetPage
      interface IParams {
        targetPage: string
      }
      const params: IParams = (JSON.parse(want.parameters?.params as string))
      this.targetPage = params.targetPage
    }

  }
  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
  //   应用运行时
    if( want.parameters && want.parameters[formInfo.FormParam.IDENTITY_KEY] !== undefined){
      // 获取卡片
      const formId = want.parameters[formInfo.FormParam.IDENTITY_KEY]

      interface IParams {
        targetPage: string
      }
      const params: IParams = (JSON.parse(want.parameters?.params as string))
      this.targetPage = params.targetPage

      // 跳转页面  需要手动跳转  因为应用程序已经再运行了 onWindowStageCreate不会重新触发
      // 即便回传了targetPage onWindowStageCreate不会执行 只能手动触发
      router.pushUrl({
        url: this.targetPage
      })

      //   //   我们也可以在这里通过 updateForm(卡片id，数据) 来返回内容给卡片

    }
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent(this.targetPage, (err) => {
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
