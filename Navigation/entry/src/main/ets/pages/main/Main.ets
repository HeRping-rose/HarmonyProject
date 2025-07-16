import { abilityAccessCtrl, common, Want } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { geoLocationManager } from '@kit.LocationKit'

@Entry
@ComponentV2
struct Main {
  context=this.getUIContext().getHostContext() as common.UIAbilityContext

  build() {
    Column({space: 10}){
      Text('Main')
      Button('打开Food窗口')
        .onClick(()=>{
        let want: Want={
          deviceId:"",
          bundleName:"com.ron.nav",
          moduleName:"entry", // 打开的窗口管理处在模块
          abilityName:"FoodEntryAbility", // 要打开的窗口管理器
          parameters:{info:'xxxxx'}
        }
        this.context.startAbility(want)
          .then(()=>{
            console.log('打开成功')
          })
          .catch((err: BusinessError)=>{
            console.log('打开失败')
          })
      })
      Image('https://images.shobserver.com/news/690_390/2025/07/11/l_cb20250711180738384072.jpg')
        .width(300)
        .backgroundColor('#ccc')
        .border({
          width: 2,
          color: Color.Red,
          style: BorderStyle.Solid
        })
      Button("向用户申请定位的权限").onClick(async ()=>{
        // 创建程序控制管理器
        const manager=abilityAccessCtrl.createAtManager()
        await manager.requestPermissionsFromUser(this.context, ["ohos.permission.LOCATION","ohos.permission.APPROXIMATELY_LOCATION"])
      })
      Button("获取地址信息").onClick(async ()=>{
        let res =await geoLocationManager.getCurrentLocation()
        console.log(`${res.latitude}`)
        console.log(`${res.longitude}`)
        console.log(`${res.accuracy}`)
      })
      Button("二次授权").onClick(async ()=>{
        const manager= abilityAccessCtrl.createAtManager()
        await manager.requestPermissionOnSetting(
          this.context,
          ["ohos.permission.LOCATION", "ohos.permission.APPROXIMATELY_LOCATION"]
        )
      })
      Button("开启系统的设置页").onClick(()=>{
        let want: Want={
          deviceId:"",
          bundleName:"com.ron.nav",
          moduleName:"entry",
          abilityName:"MainEntryAbility",
          uri:"application_info_entry",
          parameters:{
            pushParams:"com.ron.nav"
          },
        }
        this.context.startAbility(want)
          .then(() => {
          console.log('打开成功')
        })

      })
    }
    .height('100%')
    .width('100%')
  }
}