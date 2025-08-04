interface tabItem{
  title:string,
  normal: ResourceStr,
  active: ResourceStr
}

@Entry
@ComponentV2
struct Index {
  @Local activeIndex:number=0

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
  build() {

    Tabs({barPosition:BarPosition.End,index:$$this.activeIndex}){
      ForEach(this.list, (item:tabItem, index:number)=>{
        TabContent(){
          Text(item.title)
        }.tabBar(this.tabBuilder(item,index))
      })
    }
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