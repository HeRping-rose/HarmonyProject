interface TabItem {
  text: string
  normal: ResourceStr
  active: ResourceStr
}

@Entry
@ComponentV2
struct Index {
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
  }
}