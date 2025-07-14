/*
 *
 *
 * */
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  build() {
    Column({space: 20}){
      Text("列表中心")
      Button('去列表首页').onClick(()=>{
        router.pushUrl({
          url: 'pages/router/ListIndex'
        })
      })

    }.width('100%')
  }
}