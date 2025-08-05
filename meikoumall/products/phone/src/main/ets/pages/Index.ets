import { AppBreakPoint, AppSafeArea, BreakPointType, Log } from 'basic'
import { CartView } from 'cart'
import { CategoryView } from 'category'
import { HomeView } from 'home'
import { MyView } from 'my'
import { AppStorageV2 } from '@kit.ArkUI'

interface tabItem{
  title:string,
  normal: ResourceStr,
  active: ResourceStr
}

@Entry
@ComponentV2
struct Index {
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

  aboutToAppear(): void {
    // Log.info('phoneIndex aboutToAppear')
    // Log.info('Index:'+this.activeIndex)
  }
  build() {

    Tabs({
      barPosition: new BreakPointType({
        sm: BarPosition.End,
        md: BarPosition.End,
        lg: BarPosition.Start
      }).getValue(this.app.breakPoint),
      index:$$this.activeIndex}){
      ForEach(this.list, (item:tabItem, index:number)=>{
        TabContent(){
          if(index==0){
            HomeView()
          }else if(index==1){
            CategoryView()
          }else if(index==2){
            CartView()
          }else if(index==3){
            MyView()
          }
        }.tabBar(this.tabBuilder(item,index))
      })
    }
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
    .scrollable(false)
    .animationDuration(new BreakPointType({
      sm: 300,
      md: 300,
      lg: 0
    }).getValue(this.app.breakPoint))
    .scrollable(false)
  }

  @Builder
  tabBuilder(item:tabItem,index:number){
    Column(){
      Image(this.activeIndex==index?item.active:item.normal)
        .width(26).aspectRatio(1)
      Text(item.title)
        .fontColor(this.activeIndex==index?$r('[basic].color.black'):'#999')
    }
  }

}