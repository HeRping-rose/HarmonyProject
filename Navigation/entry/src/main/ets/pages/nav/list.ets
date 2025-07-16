/*
 *  组件生命周期
 *
 * */


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
  // 自定义组件创建后、`build()`执行前（`NavDestination`创建前）
  aboutToAppear(): void {
    console.log('list aboutToAppear')
  }
  // 自定义组件析构销毁前（`NavDestination`销毁的最后阶段）
  aboutToDisappear(): void {
    console.log('list aboutToDisappear:自定义组件销毁前')
  }
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
    .onWillAppear(() => {
      console.log('list onWillAppear :NavDestination创建后挂载到组件树之前')
    })//`NavDestination`创建后、挂载到组件树前。
    .onAppear(() => {
      console.log('list onAppear :NavDestination创建后挂载到组件树之时')
    }) // `NavDestination`挂载到组件树时（通用生命周期事件）。
    .onShown(() => {
      console.log('list onShown :布局显示后')
    }) // `NavDestination`布局显示后（页面已完成布局，可见）
    .onActive(() => {
      console.log('list onActive :组件处于活跃状态')
    }) // `NavDestination`处于**激活态**（栈顶、可操作、无遮挡）
    .onHidden(() => {
      console.log('list onHidden :布局隐藏后')
    }) //`NavDestination`完全隐藏后（如被 push 到栈底、应用切后台）。
    .onDisAppear(() => {
      console.log('list onDisAppear :NavDestination从组件树卸载  后销毁')
    })// `NavDestination`从组件树卸载销毁时（通用生命周期事件）
    
  }
}
export { list }