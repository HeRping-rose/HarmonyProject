/*
 *
 *
 * */
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Mine {
  build() {
    Column() {
      Text("个人中心")
      Button('返回到上一页').onClick(() => {
        router.back({
          url: 'pages/router/ListIndex'
        })
      })

    }
  }
}