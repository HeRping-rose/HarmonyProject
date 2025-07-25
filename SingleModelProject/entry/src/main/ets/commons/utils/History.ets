import { savedContext, TrackingArray, TrackingItem } from '../../models'
import { AppStorageV2, promptAction } from '@kit.ArkUI'
import { httpClient } from './httpClient'
import { preferences } from '@kit.ArkData'

//数据埋点
class History{
  list: TrackingItem[] = []
  store:preferences.Preferences | null = null


  // 获取 存储 仓库
  getStorage(){
    if(!this.store){
      // 如果没有存储则创建一个
      const context = AppStorageV2.connect(savedContext)!.context
      this.store = preferences.getPreferencesSync(context, { name: "history" })
    }
    return this.store
  }
  getAll(){
    const store = this.getStorage()
    let  obj =store.getAllSync( ) // 返回object{arkTS:"arkTS","vue":"vue"}
    return Object.keys(obj)  // 返回 ["arkTS","vue"] 返回key值以数组形式返回  .value()返回value值
  }



  getOne(val:string){
    const store = this.getStorage()
    let res=store.getSync(val,'')
    return res
  }

  //设置一个值
  setOne(val:string){{
    const store = this.getStorage()
    store.putSync(val,val) //["arkTS":"arkTS","vue":"vue"]
    store.flushSync()

  }}
  //删除一个值
  deleteOne(val:string){
    const store = this.getStorage()
    store.deleteSync(val)
    store.flushSync()
  }

  // 删除所有值
  clearAll(){
    const store = this.getStorage()
    store.clearSync()
    store.flushSync()
  }

}

export const history = new History()