import { HcNavBar } from "../../commons/components/HcNavBar"
import { abilityAccessCtrl, common } from "@kit.AbilityKit"
import { promptAction } from "@kit.ArkUI"
import { navPathStack } from "../../commons/utils/navPathStack"

@ComponentV2
struct audio {
  context =this.getUIContext().getHostContext() as common.UIAbilityContext
  // 进入页面需要录音权限
  async getPerMission(){
    //创建权限管理实例
    const myManage =abilityAccessCtrl.createAtManager()
    //设置权限 向用户发起权限申请 的请求
    const res =await myManage.requestPermissionsFromUser(this.context,["ohos.permission.MICROPHONE"])


    console.log(JSON.stringify(res))  //"authResults":[-1]  不全是0的情况 则二次请求
    if(res.authResults.every(i=>i===0)){
      promptAction.openToast({message:"权限获取成功 ",alignment:Alignment.Bottom})
    }else {
      const  res2= await myManage.requestPermissionOnSetting(this.context, ["ohos.permission.MICROPHONE"])
      console.log(JSON.stringify(res2)) //[-1] 是否所有权限都通过的数组  其中-1不通过 0 通过
      if (res2.every(i=>i===0)){
        promptAction.openToast({message:"权限获取成功 ",alignment:Alignment.Bottom})
      }else {
        navPathStack.pop()
      }
    }
  }
  aboutToAppear(): void {
    this.getPerMission()

  }

  build() {
    NavDestination(){
      HcNavBar({ title: '面试录音' ,showRightIcon:false})
    }.hideTitleBar(true)
  }
}

@Builder
function audioFn() {
  audio()
}

export { audio }