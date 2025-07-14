/*
 *
 *
 * */

@Entry
@ComponentV2
struct Index {
  // 实例化一个独立的导航栈 用来单独管理我们当前窗口  导航站管理和页面切换
  @Provider() navPathStack:NavPathStack =new NavPathStack()


  //
  @Builder
  goToPage(name: string) {
     // 处理逻辑 渲染子页面
     if(name==='news'){
       // 用来渲染子页面 的组件
       list()

     }else if(name==='shops') {
       shops()

     }else if(name==='mine') {
       mine()

     }

  }

  build() {
    Navigation(this.navPathStack){
      Text('首页')
      Button('去列表').onClick(()=>{
        this.navPathStack.pushPath({ name: 'news' })
      })
      Button('去商品页').onClick(() => {
        this.navPathStack.pushPath({ name: 'shops' })
      })
      Button('去我的').onClick(() => {
        this.navPathStack.pushPath({ name: 'mine' })
      })
    }
    .navDestination(this.goToPage)
    // Destination 描述了导航目的地 目的地 触发的方法

  }
}

@ComponentV2
struct list {
  @Consumer() navPathStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      // 子页面包含的组件 结构
      Column() {
        Text('新闻列表')
      }

      Button('返回').onClick(() => {
        this.navPathStack.pop()
      })
    }
  }
}

@ComponentV2
struct shops {
  @Consumer() navPathStack: NavPathStack = new NavPathStack()
  build() {
    NavDestination() {
      Column() {
        Text('商品列表')
      }

      Button('返回').onClick(() => {
        this.navPathStack.pop()
      })
    }
  }
}

@ComponentV2
struct mine {
  @Consumer() navPathStack: NavPathStack = new NavPathStack()
  build() {
    NavDestination() {
      Column() {
        Text('我的')
      }

      Button('返回').onClick(() => {
        this.navPathStack.pop()
      })
    }
  }
}