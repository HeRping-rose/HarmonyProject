

interface TabInterface {
  icon: ResourceStr
  selectIcon: ResourceStr
  name: string
  title: string
}
// builder 构造器
@Entry
@ComponentV2
struct Index {

  @Local currentIndex:number=0

  @Local list: TabInterface[] = [{
    icon: $r("app.media.tabbar_home" ),
    selectIcon: $r('app.media.tabbar_home_fill'),
    name: 'home',
    title: '首页',
  }, {
    icon: $r('app.media.tabbar_project'),
    selectIcon: $r('app.media.tabbar_project_fill'),
    name: 'project',
    title: '项目',
  }, {
    icon: $r('app.media.tabbar_interview'),
    selectIcon: $r('app.media.tabbar_interview_fill'),
    name: 'interview' ,
    title: '面经',
  }, {
    icon: $r('app.media.tabbar_mine'),
    selectIcon: $r('app.media.tabbar_mine_fill'),
    name: 'mine',
    title: '我的',
  }]

  // 对比自定义组件 构建函数是没有状态的,只包含结构和样式
  // @Builder //构建函数  封装一块(结构组件和一定样式)  在任意的位置调用



  // tab单个组件框架封装
  @Builder
  tabItem(item:TabInterface){
    Column(){
      Image(this.list[this.currentIndex].name==item.name?item.selectIcon: item.icon)
        .height(30)
        .width(30)
        .fillColor($r('app.color.common_gray_01'))
      Text(item.title)
        .fontColor(this.list[this.currentIndex].name==item.name? $r('app.color.black'): $r('app.color.common_gray_01'))
    }
    // .backgroundColor('#ccc')
  }

  build() {
    Column({space: 10}){

      //布局之选项卡Tabs
      Tabs({index:$$this.currentIndex}){
        ForEach(this.list, (item:TabInterface) => {
          TabContent(){
            //todo 添加内容 实现不同结构
            Column(){
              if(item.name=="home"){
                Text("首页")
              }else if(item.name=="project"){
                Text("项目")
              }else if(item.name=="interview"){
                Text("面经")
              }else {
                Text("我的")
                .width('100%')
              }
            }
          }
          .tabBar( this.tabItem(item))
        })
      }
      .vertical(false)//垂直
      .scrollable(true)//滑动
      .barPosition(BarPosition.End)//结束位置

    }
    .margin({left: 10, right: 10})
  }
}



