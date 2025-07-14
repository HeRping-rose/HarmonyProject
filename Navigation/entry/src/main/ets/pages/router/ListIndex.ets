/*
 *
 *
 * */
import { router } from '@kit.ArkUI'

@Entry
@Component
struct ListIndex {
  build() {
    Column() {
      Text("首页")
      Button('去个人中心').onClick(() => {
        router.pushUrl({
          url: 'pages/router/Mine'
        })
      })
      Button('返回上一页').onClick(() => {
        router.pushUrl({
          url: 'pages/router/Index'

        })
      })

    }
  }
}