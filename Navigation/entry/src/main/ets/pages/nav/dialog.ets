import { navPathStack } from './utils'
@Builder
function dialogFn() {
  dialog()


}

@ComponentV2
struct dialog {
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

      Button('个人信息弹窗').onClick(() => {
        // navPathStack.pop({mine:'我的页面'})
        navPathStack.pushPath({name:"Dialog"})
      })
    }
    .mode(NavDestinationMode.DIALOG)

  }
}

export { dialog }