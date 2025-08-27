import { HMRouterMgr } from "@hadss/hmrouter"
import { PAGE_PATH, PlayStatus } from "basic"
import { HotSearchTag } from "../components/HotSearchSection"
import { Banner, EditorChoice, podcastExpress, popularPodcast, quickCategory, RecentlyNew } from "../viewmodels/home"

@ComponentV2
export struct HomeView {

  @Local currentBannerIndex: number = 0
  @Local searchText: string = ''
  // safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!//安全区

  // 轮播横幅数据
   banner:Banner[] = []
   editorChoice: EditorChoice[]=[]
   recentlyNew: RecentlyNew[] = []

  // 快速分类数据
   quickCategories: quickCategory[] = [
    { name: '我的播单', icon: $r('app.media.ic_pod') },
    { name: '排行榜', icon: $r('app.media.ic_chart') },
    { name: '播客广场', icon: $r('app.media.ic_square') },
    { name: '全部分类', icon: $r('app.media.ic_category') }
  ]

  // 播客速递数据
   podcastExpress: podcastExpress[] = [
    {
      tag: '热门推荐',
      title: '深度放松,听音乐寻找内心的安宁',
      author: '温柔一刀'
    },
    {
      tag: '热门推荐',
      title: '梵高背后的调色盘,探寻艺术大师的创...',
      author: '暖暖阳光min'
    },
    {
      tag: '热门推荐',
      title: '中国正能量,的中国吹响',
      author: '听风吟'
    }
  ]

  // 热门播客数据
   popularPodcasts: popularPodcast[] = [
    {
      rank: 1,
      title: '189.想了解职场转型、创业起步...',
      category: '备忘录|商业财经'
    },
    {
      rank: 2,
      title: 'Vol.198 | 历史长河中,情感才更...',
      category: '历史情感'
    },
     {
       rank: 3,
       title: '1997 | 历史长河中,情感才更...',
       category: '历史情感'
     }
  ]

  async mockData() {
    // 模拟数据加载
    this.banner=new Array(6).fill({
        id:'42',
        imgUrl:$r('app.media.swiper1'),
        hrfUrl:'/category/1181622006',
        type:'1'
      })
    this.editorChoice=new Array(6).fill({
        imgUrl:$r('app.media.swiper1'),
        title:'如何改变人生',
        authorAvatar:$r('app.media.swiper1'),
        author:'秦时明月',
        subtitle:'"处世让一步为高,退步即为进步的根本",与自己较劲,结果往往是身心俱疲,得不偿失'
      })
    this.recentlyNew=new Array(6).fill({
      imgUrl:$r('app.media.swiper1'),
        title:'国风古韵',
        authorAvatar:$r('app.media.swiper1'),
        author:'小满意',
        listenCount: 1000,
        signature:'断舍离: 最精辟的人生哲学'
      })

  }

  aboutToAppear(): void {
    this.mockData()
  }

  build() {
    Column({space:10}) {
      // 头部区域
      Row() {
        Text('智音播客')
          .fontSize(24)
          .fontColor('#4A90E2')
        Row({space:5}) {
          // 搜索框
          Row() {
            Image($r('app.media.ic_search'))
              .width(20)
              .height(20)
            Text('请输入...')
              .width(120)
              .height(36)
              .fontColor('#999999')
              .fontSize(14)
              .backgroundColor('#F5F5F5')
              .borderRadius(18)
              .padding({ left: 12, right: 12 })
          }
          // .backgroundColor('#ffdbb6b6')
          .borderRadius(18)
          // .layoutWeight(1)
          .padding({ left: 12, right: 12 })
          .onClick(()=>{
            HMRouterMgr.push({
              pageUrl: PAGE_PATH.SEARCH_PAGE
            })
          })

          Row({space:5}){
            // 麦克风和菜单图标
            Image($r('app.media.ic_voice'))
              .width(20).aspectRatio(1)
              .margin({ left: 12 })
            Image($r('app.media.ic_menu'))
              .width(20).aspectRatio(1)
              .margin({ left: 8 })
          }
        }.justifyContent(FlexAlign.SpaceBetween)
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 16 })

      // 主要内容区域
      Scroll(){
        Column() {
          // 轮播图
          Swiper() {
            ForEach(this.banner, (item: Banner, index: number) => {
              Image(item.imgUrl)
            })
          }
          .width('100%').height(200)
          .margin({ bottom: 16 })

          // 快速分类
          Row() {
            ForEach(this.quickCategories, (category: quickCategory) => {
              Column() {
                Image(category.icon)
                  .width(30).aspectRatio(1)
                  .fillColor('#87CEEB')
                Text(category.name)
                  .fontSize(12)
                  .fontColor('#333333')
                  .margin({ top: 8 })
              }
              .layoutWeight(1)
            })
          }
          .width('100%')
          .margin({ bottom: 24 })

          // 播客速递
          Column() {
            Row() {
              Text('播客速递')
                .fontSize(18)
                .fontColor('#333333')

              Image($r('app.media.ic_right')).width(16).aspectRatio(1)
            }
            .width('100%')
            .margin({ bottom: 16 })
            .justifyContent(FlexAlign.SpaceBetween)
          }

          Column() {
            List({ space: 10 }) {
              ForEach(this.podcastExpress, (podcast: podcastExpress) => {
                ListItem() {
                  Column() {
                    HotSearchTag({ keyword: podcast.tag,bgColor: '#ff5989e7' }).margin({ left: 6, top: 6 }).width('100%')
                    Column({space:4}){
                      Image($r('app.media.ic_play')).width(20).aspectRatio(1).fillColor('#ffa0a0f6').alignSelf(ItemAlign.Start)
                      Text(podcast.title).fontColor(Color.White)
                        .maxLines(2)
                        .textOverflow({overflow:TextOverflow.Ellipsis})
                        .alignSelf(ItemAlign.Start)
                      Text(podcast.author).fontColor('#999999').fontSize(12).alignSelf(ItemAlign.Start)
                    }.margin({ left: 6, right: 6, bottom: 6 }).width('100%')
                  }
                  .justifyContent(FlexAlign.SpaceBetween)
                  .width('100%')
                  .height('100%')
                }
                .backgroundImage($r('app.media.swiper1'))
                .width(120)
                .height('100%')
                .backgroundColor('#ccc')
                .borderRadius(8)
              })
            }.align(Alignment.Center)
            .listDirection(Axis.Horizontal)
            .scrollBar(BarState.Off)
          }.height(180)
          .margin({ bottom: 16 })
          .alignItems(HorizontalAlign.Start)


          // 热门播客
          Column() {
            Row() {
              Text('热门播客')
                .fontSize(18)
                .fontColor('#333333')
              Image($r('app.media.ic_right')).width(16).aspectRatio(1)
            }
            .width('100%')
            .margin({ bottom: 16 })
            .justifyContent(FlexAlign.SpaceBetween)

            ForEach(this.popularPodcasts, (podcast: popularPodcast) => {
              Row() {
                // 排名徽章
                Image($r('app.media.ic_no1'))
                  .width(32)
                  .height(32)
                  .fillColor(podcast.rank === 1 ? '#FFD700' : '#C0C0C0')
                  .margin({ right: 16 })
                // 播客信息
                Column() {
                  Text(podcast.title)
                    .fontSize(16)
                    .fontColor('#333333')
                    .maxLines(2)
                    .width(240)
                    .margin({ bottom: 4 })

                  Text(podcast.category)
                    .fontSize(14)
                    .fontColor('#666666')
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)

                Image($r('app.media.swiper1')).width(30).aspectRatio(1)
              }
              .width('100%')
              .padding({ top: 12, bottom: 12 })
            })
          }

          //编辑精选

          Column(){
            Row() {
              Text('编辑精选')
                .fontSize(18)
                .fontColor('#333333')
              Image($r('app.media.ic_right')).width(16).aspectRatio(1)
            }
            .width('100%')
            .margin({ bottom: 16 })
            .justifyContent(FlexAlign.SpaceBetween)

            Column(){
              List({}){
                ForEach(this.editorChoice, (item: EditorChoice) => {
                  ListItem(){
                    Column({space:5}){
                      Row() {
                        Image($r('app.media.swiper1'))
                          .width(80)
                          .height(80)
                          .margin({ right: 16 })
                        Column({space:5}) {
                          Text(item.title)
                            .fontSize(18)
                            .fontColor('#333333')
                            .maxLines(2)
                            .width(240)
                            .margin({ bottom: 4 })
                          Image($r('app.media.ic_vip')).width(16).aspectRatio(1)
                          Row() {
                            Image(item.authorAvatar).width(16).aspectRatio(1).borderRadius(32)
                            Text(item.author)
                          }
                        }
                        .width('100%')
                        .alignItems(HorizontalAlign.Start)
                      }

                      Row() {
                        Text(item.subtitle)
                          .fontSize(16)
                          .fontColor('#666666')
                          .margin({ right: 8 })
                          .maxLines(2)
                          .textOverflow({ overflow: TextOverflow.Ellipsis })
                          .textAlign(TextAlign.Start)
                      }
                      .width('100%')
                      .backgroundColor('#ccc')
                    }.alignItems(HorizontalAlign.Start)
                  }
                })
              }
              .width('100%')
              .listDirection(Axis.Horizontal)
              .scrollBar(BarState.Off)
            }
            .margin({ bottom: 16 })
            .width('100%')
          }.width('100%')

          //最近新上
          Column() {
            Row() {
              Text('最近新上')
                .fontSize(18)
                .fontColor('#333333')
            }
            .width('100%')
            .margin({ bottom: 16 })
            .justifyContent(FlexAlign.SpaceBetween)

            List({space:10}) {
              ForEach(this.recentlyNew, (item: RecentlyNew) => {
                ListItem() {
                  Column({space:5}) {
                    Row() {
                      Row({space:10}){
                        Image($r('app.media.swiper1'))
                          .width(80)
                          .height(80)
                          .borderRadius(8)
                          .margin(2)
                        Column({space:5}) {
                          Text(item.title)
                            .fontSize(18)
                            .fontColor('#333333')
                          Row(){
                            Image($r('app.media.ic_vip')).width(16).aspectRatio(1)
                            Row(){
                              Image(item.authorAvatar).width(12).aspectRatio(1)
                              Text(item.listenCount.toString()).fontSize(12)
                            }
                          }.justifyContent(FlexAlign.SpaceBetween)

                        }
                      }

                      Image($r('app.media.ic_play')).width(24).aspectRatio(1).margin({ right: 16 })
                    }.justifyContent(FlexAlign.SpaceBetween)
                    .width('100%')
                    Column(){
                      Row(){
                        Text(item.author+':'+item.signature)
                          .fontSize(16)
                          .fontColor('#666666')
                          .maxLines(1)
                          .textOverflow({ overflow: TextOverflow.Ellipsis })
                          .textAlign(TextAlign.Start)
                      }
                    }.width('100%')
                  }
                }
                .backgroundColor('#ff7fbcaf')
                .borderRadius(8)
              })
            }
          }
        }
        .padding({ left: 16, right: 16, bottom: 50 })
      }
      .scrollBar(BarState.Off)
      .layoutWeight(1)

      //播放栏
      PlayStatus()


    }
    .padding({ left: 16, right: 16 })
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
