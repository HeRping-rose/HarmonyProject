import { navPathStack } from './utils'

@Builder
function loginFn() {
  login()
}




@ComponentV2
struct login {
  param: string = ""



  build() {
    NavDestination() {
      Text('login')
      Button('去个人中心').onClick(() => {
        navPathStack.pushPath({ name: 'mine' })
      })

    }
    .onReady((context: NavDestinationContext) => {
      this.param = context.pathInfo.param as string
      console.log('param: ', JSON.stringify(this.param))
      console.log(JSON.stringify(context.pathStack))
      let data = context.getConfigInRouteMap()?.data
      if(data){
        console.log('data: ', JSON.stringify(data))
      }
    })

  }
}

export { login }