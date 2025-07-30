import { HcNavBar } from "../../commons/components/HcNavBar"
import { abilityAccessCtrl, common } from "@kit.AbilityKit"
import { promptAction } from "@kit.ArkUI"
import { navPathStack } from "../../commons/utils/navPathStack"
import { permission } from "../../commons/utils/Permission"
import { media } from "@kit.MediaKit"
import { AudioView } from "./components/AudioView"

@ComponentV2
struct audio {
  context =this.getUIContext().getHostContext() as common.UIAbilityContext
  avRecorder:media.AVRecorder|null =null //全局录音管理器实例
  avPlayer:media.AVPlayer|null =null
  @Local maxAmplitude:number=0 //最大振幅
  @Local timer:number=0
  // 进入页面需要录音权限
  async getPerMission(){
    let flag=await permission.requestPermissions(["ohos.permission.MICROPHONE"])
    if(!flag){
      let flag2=await permission.openPermissionSetting(["ohos.permission.MICROPHONE"])
      if(!flag2){
        promptAction.openToast({message:"该页面必须要有麦克风权限,才能正常访问 ",alignment:Alignment.Bottom})
        navPathStack.pop()
      }
    }
  }

  aboutToAppear(): void {
    this.getPerMission()
  }

  build() {
    NavDestination(){
      Column(){
        AudioView()
      }
    }.hideTitleBar(true)
  }
}

@Builder
function audioFn() {
  audio()
}

export { audio }