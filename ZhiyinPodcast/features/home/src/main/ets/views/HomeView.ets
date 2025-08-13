@ComponentV2
export struct HomeView {
  @Local currentBannerIndex: number = 0
  @Local searchText: string = ''
  // safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!//安全区


  // 轮播横幅数据
   banner:Banner[] = []

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
      subtitle: '温柔一刀'
    },
    {
      tag: '热门推荐',
      title: '梵高背后的调色盘,探寻艺术大师的创...',
      subtitle: '暖暖阳光min'
    },
    {
      tag: '热门推荐',
      title: '中国正能量,的中国吹响',
      subtitle: '听风吟'
    }
  ]

  // 热门播客数据
   popularPodcasts: popularPodcast[] = [
    {
      rank: 1,
      title: '189.想了解职场转型、创业起步...',
      category: '贝望录|商业财经'
    },
    {
      rank: 2,
      title: 'Vol.198 | 历史长河中,情感才更...',
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
        Row({space:8}) {
          // 搜索框
          Row() {
            Image($r('app.media.ic_search'))
              .width(20)
              .height(20)
            TextInput({ placeholder: '请输入...' })
              .width(150)
              .height(36)
              .backgroundColor('#F5F5F5')
              .borderRadius(18)
              .padding({ left: 12, right: 12 })
          }
          .backgroundColor('#F5F5F5')
          .borderRadius(18)
          .padding({ left: 12, right: 12 })

          // 麦克风和菜单图标
          Image($r('app.media.ic_voice'))
            .width(20).aspectRatio(1)
            .margin({ left: 12 })
          Image($r('app.media.ic_menu'))
            .width(20).aspectRatio(1)
            .margin({ left: 8 })
        }
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 16 })

      // 主要内容区域
      Column() {
        // 轮播图
        Swiper() {
          ForEach(this.banner, (item: Banner, index: number) => {
            Image(item.imgUrl)
          })

        }
        .width('100%').height(200)
        .margin({bottom: 16})
        // .padding({ top: this.safeArea.topHeight })



        // 快速分类
        Row() {
          ForEach(this.quickCategories, (category: quickCategory) => {
            Column() {
              Image(category.icon)
                .width(30).aspectRatio(1)
                .fillColor('#87CEEB')
              // {
              //   Text(category.icon)
              //     .fontSize(24)
              //     .fontColor(Color.White)
              // }
              
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
          .margin({bottom:16})
          .justifyContent(FlexAlign.SpaceBetween)
        }

        Column(){
          List({space:10}){
            ForEach(this.podcastExpress, (podcast: podcastExpress) => {
              ListItem() {
                Column() {
                  Text(podcast.tag)
                }
              }
              .width(120)
              .height('100%')
              .backgroundColor('#ccc')
            })
          }.align(Alignment.Center)
          .listDirection(Axis.Horizontal)
          .scrollBar(BarState.Off)
        }.height(120)
        .margin({bottom:16})



        // 热门播客
        Column() {
          Row() {
            Text('热门播客')
              .fontSize(18)
              .fontColor('#333333')
            
            Image($r('app.media.ic_right')).width(16).aspectRatio(1)
          }
          .width('100%')
          .margin({bottom:16})
          .justifyContent(FlexAlign.SpaceBetween)

          ForEach(this.popularPodcasts, (podcast: popularPodcast) => {
            Row() {
              // 排名徽章
              Image($r('app.media.ic_no1'))
                .width(32)
                .height(32)
                .fillColor(podcast.rank === 1 ? '#FFD700' : '#C0C0C0')
              // {
              //   Text(podcast.rank.toString())
              //     .fontSize(14)
              //     .fontColor(Color.White)
              // }
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
      }
      .padding({ left: 16, right: 16, bottom: 100 })
    }
    .width('100%')
    .height('100%')
    // .backgroundColor('#ff52acd0')
  }
}

interface Banner{
  id:string,
  imgUrl:ResourceStr,
  hrfUrl:ResourceStr,
  type:string

}
interface  quickCategory{
  icon: ResourceStr;
  name: string;
}

interface podcastExpress{
  tag: string;
  title: string;
  subtitle: string;
}
class podcast{
  title: string='';
  category: string='';
}

interface popularPodcast{
  rank: number;
  title: string;
  category: string;
}