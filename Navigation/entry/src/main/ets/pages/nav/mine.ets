import { navPathStack } from './utils'
@Builder
function mineFn() {
  mine()


}

@ComponentV2
struct mine {
  build() {
    NavDestination() {
      Text('mine')
      Button('去list').onClick(() => {
        navPathStack.pushPath({name: 'list'})
      })
      Button('back').onClick(() => {
        // navPathStack.pop({mine:'我的页面'})
        navPathStack.clear()
      })

      Button('查看个人信息').onClick(() => {
        // navPathStack.pop({mine:'我的页面'})
        navPathStack.pushPath({name:"dialog"})
      })
    }

  }
}

export { mine }