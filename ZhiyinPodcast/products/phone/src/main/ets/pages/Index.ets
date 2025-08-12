import { HMDefaultGlobalAnimator, HMNavigation } from '@hadss/hmrouter'
import { AppBreakPoint, AppSafeArea, BreakPointType, PAGE_PATH } from 'basic'
import { AppStorageV2, AttributeUpdater } from '@kit.ArkUI'
import { HomeView } from 'home'
import { IntelligenceView } from 'intelligence'
import { SubscriptionView } from 'subscription'
import { MineView } from 'mine'

interface TabItem {
  text: string
  normal: ResourceStr
  active: ResourceStr
}

@Entry
@ComponentV2
struct Index {
  modifier: MyNavModifier = new MyNavModifier();
  app: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  @Local activeIndex: number = 0
  list: TabItem[] = [
    { text: '首页', normal: $r('app.media.ic_home_normal'), active: $r('app.media.ic_home_active') },
    { text: '智能AI', normal: $r('app.media.ic_intelligence_normal'), active: $r('app.media.ic_intelligence_active') },
    { text: '订阅', normal: $r('app.media.ic_subscription_normal'), active: $r('app.media.ic_subscription_active') },
    { text: '我的', normal: $r('app.media.ic_mine_normal'), active: $r('app.media.ic_mine_active') },
  ]

  @Builder
  getTabItemBuilder(item: TabItem, index: number) {
    Column() {
      Image(this.activeIndex === index ? item.active : item.normal)
        .width(24)
        .aspectRatio(1)
      Text(item.text)// 跨 HSP 访问资源，需要在 oh-package.json5中导入
        .fontColor('#ccc')
        .fontSize(12)
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .height(50)
  }

  build() {
    Column(){
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
        Tabs({ barPosition: BarPosition.End, index: $$this.activeIndex }) {
          ForEach(this.list, (item: TabItem, index: number) => {
            TabContent() {
              if(index==0){
                HomeView()
              }else if(index==1){
                IntelligenceView()
              }else if(index==2){
                SubscriptionView()
              }else{
                MineView()
              }
            }
            .tabBar(this.getTabItemBuilder(item, index))
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
  tabBuilder(item: TabItem,index:number){
    Column(){
      Image(this.activeIndex==index?item.active:item.normal)
        .width(26).aspectRatio(1)
      Text(item.text)
        .fontColor(this.activeIndex==index?$r('[basic].color.black'):'#999')
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