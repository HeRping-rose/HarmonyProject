import { getCateMenuApi } from '../api'
import { TabListType } from '../models'
import { requestRcp } from '../utils/requestRcp'
import { Home } from './tabPages/Home'
import { Mine } from './tabPages/Mine'
import { Order } from './tabPages/Order'
import { SearchPage } from './tabPages/SearchPage'

@Entry
@ComponentV2
struct Index {
  @Local TabList: TabListType[] =[
    {
      text: '首页',
      icon:$r('app.media.wm'),
      selectedIcon:$r('app.media.wm2'),
    },
    {
      text: '搜索',
      icon: $r('app.media.ss'),
      selectedIcon: $r('app.media.ss2'),
    },
    {
      text: '订单',
      icon: $r('app.media.dd'),
      selectedIcon: $r('app.media.dd2'),
    },
    {
      text: '我的',
      icon: $r('app.media.wd'),
      selectedIcon: $r('app.media.wd2'),
    },

  ]
  @Local activeIndex:number = 0
  @Builder
  TabBuilder(item:TabListType,index:number) {
    Column(){
      Column(){
        Image(index== this.activeIndex?item.selectedIcon:item.icon).width(30).aspectRatio(1)
        Text(item.text).fontColor(index == this.activeIndex ?'#1296db':'#333333')
      }
    }
  }

  build() {
    //1.底部tab
    Column(){
      Tabs(
        { barPosition: BarPosition.End, index: $$this.activeIndex, }
      ) {
        ForEach(this.TabList, (item: TabListType, index: number) => {
          TabContent() {
            if (index == 0) {
              Home()
            } else if (index == 1) {
              SearchPage()
            } else if (index == 2) {
              Order()
            } else if (index == 3) {
              Mine()
            }
          }.tabBar(this.TabBuilder(item, index))
        })


      }.height('100%').align(Alignment.TopStart)
    }.height('100%')
  }
}