import { auth, DiscoverCard, MyCell, MyNavBar, MyNavCol, PlayStatus, PodcastCard, RecommendCard } from "basic"
import { audio } from "@kit.AudioKit"

interface NavCol{
  icon:ResourceStr,
  text:string,
  color:Color
}

@ComponentV2
export  struct SubscriptionView {
  tabList: NavCol[] = [
  //喜欢 历史  购买 下载
    {icon:$r('[basic].media.ic_like1'), text:"喜欢",color:Color.Grey},
    {icon:$r('[basic].media.ic_history'), text:"历史",color:Color.Grey},
    {icon:$r('[basic].media.ic_buy'), text:"购买",color:Color.Grey},
    {icon:$r('[basic].media.ic_download'), text:"下载",color:Color.Grey},
  ]
  // 提取数据
   discoverData: DiscoverItem[] = [
    {
      coverImage: $r('app.media.cover3'),
      updateStatus: "更新至-第3期",
      title: "停止过度思考·催眠",
      subtitle: "享受幸福，拥有平静",
      playCount: 16.5
    },
    {
      coverImage: $r('app.media.cover3'),
      updateStatus: "更新至-第17期",
      title: "电影上映福利",
      subtitle: "欢迎来到云边小镇，能和你在山间...",
      playCount: 46.0
    },
    {
      coverImage: $r('app.media.cover3'),
      updateStatus: "更新至-第8期",
      title: "心理学入门基础",
      subtitle: "探索人类行为的奥秘",
      playCount: 32.1
    },
    {
      coverImage: $r('app.media.cover3'),
      updateStatus: "更新至-第12期",
      title: "科技前沿解读",
      subtitle: "最新技术趋势分析",
      playCount: 28.7
    }
  ]
  build() {
    Column(){
      Row() {
        MyNavBar({
          title: '订阅',
          showLeftIcon: false,
          showRightIcon: true,
          rightIcon: $r('[basic].media.ic_user'),
          bgColor:'#fafcff'
        })
      }.width('100%')

      //喜欢 历史  购买 下载
      Row() {
        ForEach(this.tabList, (item: NavCol) => {
          MyNavCol({ icon: item.icon, text: item.text, color: item.color })
            .margin(10)
            .onClick(() => {
              console.log('点击了')
            })
        })
      }.justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')

      Scroll() {
        Column() {
          MyCell({
            title: '订阅更新', onRightClick: () => {
            }
          })
          // 在页面中使用
          Column() {
            PodcastCard({
              title: "当人类学家遇到大海",
              subtitle: "海洋自由谈",
              coverImage: $r('app.media.cover1'),
              playCount: 298,
              episode: "第13期"
            })
              .width('100%')

            PodcastCard({
              title: "VO17-职场心眼子练习",
              subtitle: "阿法拉工作室",
              coverImage: $r('app.media.cover2'),
              playCount: 783,
              episode: "第128期"
            })
              .width('100%')
          }.width('100%')

          MyCell({
            title: '猜你喜欢', onRightClick: () => {
            }
          })

          Column() {
            RecommendCard({
              coverImage: $r('app.media.cover2'),
              playCount: 16.5,
              title: "三五环职场晋升",
              subtitle: "关于感同身受",
              tag: "职场晋升",
              author: "阿法拉工作室"
            })

            RecommendCard({
              coverImage: $r('app.media.cover2'),
              playCount: 46.0,
              title: "四月是你的谎言",
              subtitle: "音乐与成长的故事",
              tag: "情感故事",
              author:'星光文化有限'
            })
          }

          MyCell({
            title: '发现更多好内容', showRightIcon: false, onRightClick: () => {
            }
          })
          // Column() {
          //   DiscoverCard({
          //     coverImage: $r('app.media.cover3'),
          //     updateStatus: "更新至-第3期",
          //     title: "【停止过度思考·催眠】",
          //     subtitle: "享受幸福，拥有平静",
          //     playCount: 16.5
          //   })
          //
          //   DiscoverCard({
          //     coverImage: $r('app.media.cover3'),
          //     updateStatus: "更新至-第17期",
          //     title: "电影上映福利",
          //     subtitle: "欢迎来到云边小镇，能和你在山间...",
          //     playCount: 46.0
          //   })
          // }
          Grid() {
            ForEach(this.discoverData, (item: DiscoverItem) => {
              GridItem() {
                DiscoverCard({
                  coverImage: item.coverImage,
                  updateStatus: item.updateStatus,
                  title: item.title,
                  subtitle: item.subtitle,
                  playCount: item.playCount
                })
                  .width('100%')
              }
            })
          }
          .columnsTemplate('1fr 1fr') // ✅ 两列等分
          .rowsGap(16)
          .columnsGap(16)
          .padding({ left: 16, right: 16 })

        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
      }
      .scrollBar(BarState.Off)
      .layoutWeight(1)
      .width('100%')

      PlayStatus()
    }
    .padding({right:16,left:16})
    .width('100%')
    .width('100%')
    .backgroundColor('#fafcff')

  }
}

interface DiscoverItem {
  coverImage: ResourceStr;
  updateStatus: string;
  title: string;
  subtitle: string;
  playCount: number;
}