import { AppBreakPoint, AppSafeArea, auth,
  authCart,
  AuthCart, BreakPointType, GlobalVariable, Log, PAGE_PATH } from 'basic'
import { CartView } from 'cart'
import { CategoryView } from 'category'
import { HomeView } from 'home'
import { MyView } from 'my'
import { AppStorageV2, AttributeUpdater } from '@kit.ArkUI'
import { HMDefaultGlobalAnimator, HMNavigation } from '@hadss/hmrouter'
import { emitter } from '@kit.BasicServicesKit'

interface tabItem{
  title:string,
  normal: ResourceStr,
  active: ResourceStr
}

@Entry
@ComponentV2
struct Index {
  controller: TabsController = new TabsController()
  modifier: MyNavModifier = new MyNavModifier();
  @Local activeIndex:number=0
  app: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  @Local list:tabItem[]=[

    {
      title: '首页',
      normal: $r('app.media.ic_public_home_normal'),
      active: $r('app.media.ic_public_home_active')
    },
    {
      title: '分类',
      normal: $r('app.media.ic_public_pro_normal'),
      active: $r('app.media.ic_public_pro_active')
    },
    {
      title: '购物车',
      normal: $r('app.media.ic_public_cart_normal'),
      active: $r('app.media.ic_public_cart_active')
    },
    {
      title: '我的',
      normal: $r('app.media.ic_public_my_normal'),
      active: $r('app.media.ic_public_my_active')
    }
  ]

  // 监听switch  Tab  发布订阅
  registerEvent() {
    // 发布者
    emitter.on(GlobalVariable.SWITCH_TAB, (event) => {
      if (event.data) {
        // 直接切换
        // this.activeIndex = event.data.index as number
        // 过渡切换
        this.controller.changeIndex(event.data.index as number)
      }
    })
  }

  aboutToAppear(): void {
    // Log.info('phoneIndex aboutToAppear')
    // Log.info('Index:'+this.activeIndex)
    this.registerEvent() // 注册监听事件
    authCart.updateCartCount()


  }


  build() {
    // @Entry中需要再套一层容器组件,Column或者Stack
    Column(){
      // 使用HMNavigation容器
      HMNavigation({
        navigationId: PAGE_PATH.MAIN_PAGE_ID , //配置根组件在导航中的唯一标识id
        homePageUrl: PAGE_PATH.MAIN_PAGE , //配置根组件的路由名 主页路由名
        options:{
          standardAnimator:HMDefaultGlobalAnimator.STANDARD_ANIMATOR, //标准的动画  页面切换要使用哪种动画
          dialogAnimator:HMDefaultGlobalAnimator.DIALOG_ANIMATOR, //对话框动画
          modifier:this.modifier, //用来修改navigation对象实例的属性

          // 想要改一些Navigation的属性

        }

      }){
        Tabs({
          controller: this.controller,
          barPosition: new BreakPointType({
            sm: BarPosition.End,
            md: BarPosition.End,
            lg: BarPosition.Start
          }).getValue(this.app.breakPoint),
          index: $$this.activeIndex
        }) {
          ForEach(this.list, (item: tabItem, index: number) => {
            TabContent() {
              if (index == 0) {
                HomeView()
              } else if (index == 1) {
                CategoryView()
              } else if (index == 2) {
                CartView()
              } else if (index == 3) {
                MyView()
              }
            }.tabBar(this.tabBuilder(item, index))
          })
        }
        .scrollable(false)
        .padding({
          bottom: this.safeArea.bottomHeight
        })
        .barHeight(new BreakPointType({
          sm: 60,
          md: 60,
          lg: 220
        }).getValue(this.app.breakPoint))
        .vertical(new BreakPointType({
          sm: false,
          md: false,
          lg: true
        }).getValue(this.app.breakPoint))
        .animationDuration(new BreakPointType({
          sm: 300,
          md: 300,
          lg: 0
        }).getValue(this.app.breakPoint))
        .scrollable(false)
      }
    }


  }

  @Builder
  tabBuilder(item:tabItem,index:number){
    Column(){
      if(index==2){
        Badge({count:authCart.getCartCount(),style:{}}){
          Column(){
            Image(this.activeIndex == index ? item.active : item.normal)
              .width(26).aspectRatio(1)
            Text(item.title)
              .fontColor(this.activeIndex == index ? $r('[basic].color.black') : '#999')
          }
        }

      }else {
        Image(this.activeIndex == index ? item.active : item.normal)
          .width(26).aspectRatio(1)
        Text(item.title)
          .fontColor(this.activeIndex == index ? $r('[basic].color.black') : '#999')
      }

    }
  }

}

// 自定义导航栏属性修改器  AttributeUpdater属性修改类  提供用于修改属性的方法 继承并重写其方法
//NavigationAttribute 路由导航属性类
class MyNavModifier extends AttributeUpdater<NavigationAttribute> {
  //重写  传入instance导航实例  包含了所有原始属性
  initializeModifier(instance: NavigationAttribute): void {
    // 隐藏导航栏
    // instance.hideNavBar(true);
    instance.mode(NavigationMode.Stack) // 路由导航跳转栈模式  Split分栏模式// 分栏模式去掉
    instance.titleMode(NavigationTitleMode.Mini)  // 标题模式全屏  或者mini
    instance.hideTitleBar( true)
  }
}