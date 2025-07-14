import { navPathStack } from './utils'

class Goods{
  id: number=0
  name: string='我是list'
}

@Builder
function listFn() {
  list()
}


@ComponentV2
struct list {
  build() {
    NavDestination(){
      Text('list')
      Button('去mine').onClick(() => {
        navPathStack.pushPath({ name: 'mine' })
      })
      Button('back').onClick(() => {
        navPathStack.pop({nihao: 'nihao'})
      })
      Button('去登录').onClick(() => {
        navPathStack.pushPath({ name: 'login'  ,param:new Goods ()})
      })
    }

    
  }
}
export { list }