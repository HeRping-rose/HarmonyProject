import { preferences } from '@kit.ArkData'
import { common } from '@kit.AbilityKit'
import { promptAction } from '@kit.ArkUI'

@Entry
@ComponentV2
struct PreferencesPage {
  // store
  preference: preferences.Preferences | null = null
  context=this.getUIContext().getHostContext() as common.UIAbilityContext

  aboutToAppear(): void {
    this.preference=preferences.getPreferencesSync(this.context,{name:"testPreference"})
  }
  build() {
    Column({space:10}){
      Button('添加一条数据')
      .onClick(async ()=>{
        //存
        await this.preference?.put("myKey","myValue").then(()=>{
          promptAction.openToast({message:"添加key成功"})
          console.log('')
        })
        // 写入磁盘
        await this.preference?.flush().then(() => {
          promptAction.openToast({ message: "put写入磁盘成功" })
        })
        this.preference?.putSync('name',"joke")

        // 写入磁盘
        await this.preference?.flush().then(()=>{
          promptAction.openToast({message:"写入磁盘成功"})
        })
      })

    //   获取并查看一条数据
      Button('获取一条数据')
        .onClick(async ()=>{
          let value=await this.preference?.get("myKey","没有这个key")
          promptAction.openToast({message:value?.toString()})
        })

      //修改数据  有就修改 没有添加
      Button('修改一条数据')
        .onClick(async ()=>{
          // put  putSync
          await this.preference?.put("myKey","myValueChange").then(()=>{
            promptAction.openToast({message:"修改key成功"})
          })
          // 写入磁盘
          await this.preference?.flush().then(() => {
            // promptAction.openToast({ message: "put写入磁盘成功" })
          })
        })

      Button('删除一条数据')
        .onClick(async ()=>{
          // delete
          await this.preference?.delete("myKey").then(()=>{
            promptAction.openToast({message:"删除key成功"})
          })
          await this.preference?.flush().then(() => {
          }) //flush 持久化  "落盘 "
        })
      //获取 所有数据
      Button('获取所有数据')
        .onClick(async ()=>{
          let valueObj=await this.preference?.getAll()
          promptAction.openToast({message:JSON.stringify(valueObj)})
        })
      // 清空所有数据
      Button('清空所有数据')
        .onClick(async ()=>{
          await this.preference?.clear().then(()=>{
            promptAction.openToast({message:"清空所有数据成功"})
          })
          await this.preference?.flush().then(() => {})
        })
      // 删除仓库
      Button('删除仓库')
        .onClick( ()=>{
           preferences.deletePreferences(this.context,{name:"testPreference"})
        })
    }.margin(100)

  }


}