import { savedContext, TrackingArray, TrackingItem } from '../../models'
import { AppStorageV2, promptAction } from '@kit.ArkUI'
import { httpClient } from './httpClient'
import { preferences } from '@kit.ArkData'

//数据埋点
class Tracking{
  list: TrackingItem[] = []
  store:preferences.Preferences | null = null


  // 获取 存储 仓库
  getStorage(){
    if(!this.store){
      // 如果没有存储则创建一个
      const context = AppStorageV2.connect(savedContext)!.context
      this.store = preferences.getPreferencesSync(context, { name: "time-tracking" })
    }
    return this.store
  }
  // 记录 埋点数据
  record(questionId:string,startTime:number,endTime:number){

  //   this.list.push({
  //   // questionId:questionId,
  //   // startTime:startTime,
  //   // endTime:endTime
  //   //简写
  //   questionId,startTime,endTime
  // })

    const store = this.getStorage() //获取  仓库
    const timeList = store.getSync("timeList","[]") //参2 默认值 []  空数组 (第一次)
    let timeListArray:TrackingItem[] = JSON.parse(timeList as string) //转成数组
    timeListArray.push({questionId,startTime,endTime}) // 把埋点数据添加到数组
    //把这个新增后后的数组写回仓库
    store.putSync("timeList",JSON.stringify(timeListArray))  //把数组转成字符串 再存回仓库
    //提示 记录埋点数据成功
    promptAction.openToast({message:"记录埋点数据成功"})
  }
  // 上报
  async report(){
//找到要上报的埋点数据
//     if(this.list.length>0&& this.list.length<100){
//       let res = await httpClient.request<null, TrackingArray>({
//         url: 'time/tracking',
//         method: 'post',
//         data: { timeList: this.list }
//       })
//       //提示 上报成功
//       promptAction.openToast({ message: "上报成功" })
//       this.list = []
//     }else {
//       console.log("埋点数据超出100条|0条")
//     }
    const store = this.getStorage() //获取  仓库
    const timeList = store.getSync("timeList", "[]") //参2 默认值 []  空数组 (第一次)
    let timeListArray: TrackingItem[] = JSON.parse(timeList as string) //转成数组

    if(timeListArray.length>5 && timeListArray.length<100){
      let res = await httpClient.request<null, TrackingArray>({
        url: 'time/tracking',
        method: 'post',
        data: { timeList: timeListArray }
      })
      // 如果已经上报成功 到服务器了 那么原来在 timeListArray中的数据还有用吗
      // 清空
      // store.clearSync()
      store.deleteSync("timeList") //删除这个key
      //落盘
      store.flushSync()
      //提示 上报成功
      console.log("上报成功 ")
    }else {
      console.log("埋点数据超出100条|0条")
      console.log("还没呢 一会儿上报 ")
    }

  }
}

export const tracking = new Tracking()