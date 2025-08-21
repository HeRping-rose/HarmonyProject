import { HMRouter } from '@hadss/hmrouter';
import { MyNavBar, PAGE_PATH } from 'basic';


@Preview
// AICreation.ets
@HMRouter({ pageUrl: PAGE_PATH.AI_CREATION_PAGE })
@ComponentV2
export struct AICreationView {
  selectedTab: string = "热门话题";
  @Local TabIndex: number = 0
  private subTabIndex: number = 0
  private mainTabs: string[] = ['热门话题', '创作活动', '热门作品']
  private subTabs: string[] = ['精选', '热点', '生活', '娱乐', '个人成长', '人文国学']
  private topics: hotTopic[] = [
    { title: '#历史上有名的天才 🔥', hot: '7011.99万 热度' },
    { title: '#琥珀对你的影响有多大 🔥', hot: '7011.99万 热度' },
    { title: '#养老金全国推行新变化 🔥', hot: '7011.99万 热度' }
  ]

  build() {
    Column() {
      MyNavBar({ title: 'AI创作' ,showRightIcon: true ,rightIcon: $r('app.media.AI_more'),color:'#000'})

      // 主要内容区域
      Column() {
        // AI助手卡片
        Column() {
          // Image("resources/base/media/ic_robot.png")
          //   .width(56)
          //   .height(56)
          //   .margin({ left: 16 })
          Row() {
            Text("点击感兴趣的功能，开始创作吧～")
              .fontSize(14)
              .fontColor(Color.Gray)
              .margin({ top: 8 })
          }
        }

        Column(){
          // 功能列表
          Grid() {
            ForEach(functions, (item: functionItem, index: number) => {
              GridItem() {
                Row() {
                  Image(item.icon)
                    .width(32).height(32)
                    .margin({ left: 4 })

                  Text(item.title).fontSize(12).fontColor(Color.Black)
                }
                .width(120).height(50)
                // .backgroundColor(Color.Pink)
                .borderRadius(12)
                .onClick(() => {
                  // 点击功能处理
                })
              }
            }, (item: functionItem) => item.title)
          }
          .rowsTemplate("1fr 1fr 1fr")
          .rowsGap(12)
          .columnsTemplate("1fr 1fr").columnsGap(24)
          .padding({ left: 16, right: 16, top: 16 })
        }
        .backgroundColor('#dae9ff')
        .borderRadius(16)
        .padding({ top: 16, bottom: 16 })
        .margin({ top: 16, left: 16, right: 16 })
      }
      .padding({ top: 16 })
      .height(300)

      // 标签页切换
      Column({ space: 12 }) {
        // 顶部 Tabs
        Tabs({ barPosition: BarPosition.Start, index: this.TabIndex }) {
          ForEach(this.mainTabs, (tabName: string, index: number) => {
            TabContent() {
              Column() {
                // 子分类 Row
                // 子分类横向 Tab
                Scroll() {
                  Row({ space: 8 }) {
                    ForEach(this.subTabs, (sub: string, subIndex: number) => {
                      Text(sub)
                        .fontSize(14)
                        .padding({
                          left: 8,
                          right: 8,
                          top: 4,
                          bottom: 4
                        })
                        .borderRadius(12)
                        .backgroundColor(this.subTabIndex === subIndex ? '#E6F0FF' : '#FFFFFF')
                        .fontColor(this.subTabIndex === subIndex ? '#3366FF' : '#333333')
                        .onClick(() => {
                          this.subTabIndex = subIndex
                        })
                    })
                  }
                }.margin({ top: 2, bottom: 6 })
                .scrollable(ScrollDirection.Horizontal)
                .height(40)
                .scrollBar(BarState.Off)

                // 热门话题列表
                ForEach(this.topics, (item:hotTopic) => {
                  Row({ space: 8 }) {
                    Column() {
                      Text(item.title).fontSize(16).fontWeight(FontWeight.Medium)
                      Text(item.hot).fontSize(12).fontColor('#999999').margin({ top: 4 })
                    }.layoutWeight(1)
                    .alignItems(HorizontalAlign.Start)

                    Button('去创作')
                      .backgroundColor('#3366FF')
                      .fontColor('#FFFFFF')
                      .fontSize(14)
                      .borderRadius(20)
                      .padding({
                        left: 12,
                        right: 12,
                        top: 6,
                        bottom: 6
                      })
                  }
                  .padding({ top: 12, bottom: 12 })
                  .border({ width: 0, color: '#EDEDED' })
                })

                // 更多话题
                Text('更多热门话题 >')
                  .fontSize(14)
                  .fontColor('#3366FF')
                  .margin({ top: 12, bottom: 12 })
                  .alignSelf(ItemAlign.Center)
              }
              .height('100%')

            }.tabBar(tabName)
            .layoutWeight(1)
          })
        }
      }.padding(12)
    }
    .backgroundColor(Color.White)
  }
}

// 功能数据
const functions: functionItem[] = [
  { title: "内容生成", icon: $r('app.media.ic_content') },
  { title: "多语言支持", icon: $r('app.media.ic_language') },
  { title: "专题报道", icon: $r('app.media.ic_topic')},
  { title: "脚本生成", icon: $r('app.media.ic_script') },
  { title: "剪辑优化", icon: $r('app.media.ic_edit') },
  { title: "更多支持", icon: $r('app.media.ic_more') }
];

interface functionItem {
  title: string;
  icon: ResourceStr;
}

// 热门话题数据

interface hotTopic {
  title: string;
  hot: string;
}
