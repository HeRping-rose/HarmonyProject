import { pageStack, user } from './utils'

@Builder
function  listFn(){
  list()
}

@ComponentV2
struct list {
  build() {
    NavDestination(){
      Column(){
        Text("列表").width('100%')
        Button("请先登录").onClick(()=>{
          pageStack.pushPath({ name: 'login' })
        })
        Text("当前登录用户为"+user.username).width('100%')

      }
    }
    .title("列表")
  }
}

export { listFn }