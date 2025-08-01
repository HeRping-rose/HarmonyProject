// 媒体查询
import { media } from '@kit.MediaKit'
import { mediaquery } from '@kit.ArkUI'

@Entry
@ComponentV2
struct Index {
  // 监听设备尺寸  媒体查询  声明
  listenerXS:mediaquery.MediaQueryListener=this.getUIContext().getMediaQuery().matchMediaSync('(0<=width<320)')
 // 设备尺寸到了这个区间才会生效
  listenerSM: mediaquery.MediaQueryListener = this.getUIContext().getMediaQuery().matchMediaSync('(320<=width<600)')
  listenerMD: mediaquery.MediaQueryListener = this.getUIContext().getMediaQuery().matchMediaSync('(600<=width<840)')
  listenerLG: mediaquery.MediaQueryListener = this.getUIContext().getMediaQuery().matchMediaSync('(840<width)')

  aboutToAppear(): void {
    //页面发生改变时会触发以下的事件
    this.listenerXS.on('change',(res: mediaquery.MediaQueryResult)=>{
      console.log('xs'+JSON.stringify(res))
    })
    this.listenerSM.on('change', (res: mediaquery.MediaQueryResult) => {
      console.log('sm' + JSON.stringify(res))
    })
    this.listenerMD.on('change', (res: mediaquery.MediaQueryResult) => {
      console.log('md' + JSON.stringify(res))
    })
    this.listenerLG.on('change', (res: mediaquery.MediaQueryResult) => {
      console.log('lg' + JSON.stringify(res))
    })
  }

  build() {

  }
}