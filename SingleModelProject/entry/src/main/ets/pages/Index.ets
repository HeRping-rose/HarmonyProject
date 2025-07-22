import { AppStorageV2 } from '@kit.ArkUI'
import { OutArea, TabInterface } from '../models'
import { Home } from './home'
import { Project } from './project'
import { Interview } from './interview'
import { Mine } from './mine'
import { navPathStack } from '../commons/utils/navPathStack'


// builder 构造器
@Entry
@ComponentV2
struct Index {
  // outArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!
  @Local currentIndex:number=0

  @Local tabList: TabInterface[] = [{
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
  tabItem(item:TabInterface,index:number){
    Column({space: 4}){
      Image(this.tabList[this.currentIndex].name==item.name?item.selectIcon: item.icon)
        .height(30)
        .width(30)
        .fillColor($r('app.color.common_gray_01'))
      Text(item.title)
        .fontSize(14)
        .fontColor(this.tabList[this.currentIndex].name==item.name? $r('app.color.black'): $r('app.color.common_gray_01'))
    }
    // .backgroundColor('#ccc')
  }


  build() {
    Navigation(navPathStack){

      //布局之选项卡Tabs
      Tabs({index:$$this.currentIndex}){
        ForEach(this.tabList, (item:TabInterface,index: number) => {
          TabContent(){
            //todo 添加内容 实现不同结构
            Column(){
              if(item.name=="home"){
                Home()
              }else if(item.name=="project"){
                Project()
              }else if(item.name=="interview"){
                Interview()
              }else {
                Mine()
              }
            }
          }
          .tabBar( this.tabItem(item, index))
        })
      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)
      .vertical(false)//垂直
      .scrollable(true)//滑动
      .barPosition(BarPosition.End)//结束位置

    }
    // .margin({left: 10, right: 10})
    // .padding({top: this.outArea.topHeight, bottom: this.outArea.bottomHeight})
    .hideTitleBar( true)  // tabBar与navigation混合使用的bug  因为navigation有预制标题栏 应去掉
  }
}



