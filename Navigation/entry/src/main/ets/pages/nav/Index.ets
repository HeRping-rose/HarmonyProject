/*
 *
 *
 * */
import { navPathStack } from './utils'

@Entry
@ComponentV2
struct Index {
  @Builder
  navItem() {
    Row({ space: 10 }) {
      Text('add')
      Text('more')
    }
    .padding({ right: 10 })
  }

  @Builder
  toolBar() {
    Row() {
      Column() {
        SymbolGlyph($r('sys.symbol.house_fill'))
          .width(20)
        Text('首页')
      }

      Column() {
        SymbolGlyph($r('sys.symbol.ellipsis_message'))
          .width(20)
        Text('消息')
      }

      Column() {
        SymbolGlyph($r('sys.symbol.heart'))
          .width(20)
        Text('like')
      }

      Column() {
        SymbolGlyph($r('sys.symbol.person_crop_circle_fill_1'))
          .width(20)
        Text('我')
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .padding(10)
    .backgroundColor(Color.Pink)
  }

  addInterCeption() {
    navPathStack.setInterception({
      willShow: (from, to) => {
        if (typeof to === "string") {
          console.log("to:", to)
          return;
        }
        if (to.pathInfo.name === 'mine') {
          //   判断是否有登录 如果有无后续逻辑可以通过

          //   假设没有登录 需要拦截 不让通过
          to.pathStack.pop()
          //   重定向
          navPathStack.pushPath({ name: 'login' })
        }
      }
    })
  }


  build() {

    Navigation(navPathStack){
      Text('首页')
      Button('去列表').onClick(()=>{
        // navPathStack.pushPath({ name: 'list' })
        navPathStack.pushPathByName('list', "", (popInfo) => {
          console.log('Pop page name is: ' + popInfo.info.name + ', result: ' + JSON.stringify(popInfo.result));
        });
      })

      Button('去我的').onClick(() => {
        // navPathStack.pushPath({ name: 'mine' })
        navPathStack.pushPath({
          name: 'mine',
          param: "",
          onPop: (popInfo) => {
            console.log('Pop page name is: ' + popInfo.info.name + ', result: ' + JSON.stringify(popInfo.result));
          }
        });
      })
    }
    .mode(NavigationMode.Auto)// 设置导航模式 Split  Stack  Auto

    .title('首页')
    .titleMode(NavigationTitleMode.Mini) // Mini Full Free
    .menus(this.navItem())
    .toolbarConfiguration(this.toolBar)
    .onAppear(() => {
      this.addInterCeption()
    })



  }
}
