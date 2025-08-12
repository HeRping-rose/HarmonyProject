@ComponentV2
export struct HomeView {
  @Local currentBannerIndex: number = 0
  @Local searchText: string = ''


  // 轮播横幅数据
   bannerData:banner[] = [
    {
      title: '10000热度 限定来袭',
      subtitle: '电台/播客 有礼征集计划',
      buttonText: '立即查看'
    }
  ]

  // 快速分类数据
   quickCategories: quickCategory[] = [
    { name: '我的播单', icon: '🔍' },
    { name: '排行榜', icon: '📊' },
    { name: '播客广场', icon: '🎤' },
    { name: '全部分类', icon: '📁' }
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
  }

  aboutToAppear(): void {
    this.mockData()
  }

  build() {
    Column() {
      // 头部区域
      Row() {
        Text('智音播客')
          .fontSize(24)
          .fontColor('#4A90E2')
        Row({space:8}) {
          // 搜索框
          Row() {
            Text('🔍')
              .fontSize(16)
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
          Text('🎤')
            .fontSize(24)
            .margin({ left: 12 })
          Text('☰')
            .fontSize(24)
            .margin({ left: 8 })
        }
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 16 })

      // 主要内容区域
      Column() {
        // 轮播横幅
        Column() {
          Text(this.bannerData[0].title)
            .fontSize(24)
            .fontColor(Color.White)
            .margin({ bottom: 8 })
          
          Text(this.bannerData[0].subtitle)
            .fontSize(16)
            .fontColor(Color.White)
            .margin({ bottom: 16 })
          
          Button(this.bannerData[0].buttonText)
            .backgroundColor('#9B59B6')
            .borderRadius(20)
            .fontColor(Color.White)
            .width(120)
            .height(40)
        }
        .width('100%')
        .height(160)
        .backgroundColor('#4A90E2')
        .borderRadius(16)
        .padding(20)
        .margin({ bottom: 16 })

        // 轮播指示器
        Row() {
          ForEach([0, 1, 2], (index:number) => {
            Circle()
              .width(8)
              .height(8)
              .fill(index === this.currentBannerIndex ? Color.White : Color.Gray)
              .margin({ right: 4 })
          })
        }
        .margin({ bottom: 24 })

        // 快速分类
        Row() {
          ForEach(this.quickCategories, (category: quickCategory) => {
            Column() {
              Image(category.icon)
                .width(60)
                .height(60)
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
            
            Text('→')
              .fontSize(16)
              .fontColor('#666666')
          }
          .width('100%')
          .margin({ bottom: 16 })

          Row() {
            ForEach(this.podcastExpress, (podcast: podcastExpress) => {
              Column() {
                // 使用占位符图片
                // Rectangle()
                //   .width(120)
                //   .height(120)
                //   .fill('#E5E5E5')
                //   .borderRadius(8)
                
                Text(podcast.tag)
                  .fontSize(10)
                  .fontColor(Color.White)
                  .backgroundColor('#FF4757')
                  .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                  .borderRadius(4)
                  .margin({ top: -120, left: 8 })
                
                Text(podcast.title)
                  .fontSize(14)
                  .fontColor('#333333')
                  .maxLines(2)
                  .width(120)
                  .margin({ top: 8, bottom: 4 })
                
                Text(podcast.subtitle)
                  .fontSize(12)
                  .fontColor('#666666')
                  .width(120)
              }
              .margin({ right: 16 })
            })
          }
        }
        .margin({ bottom: 24 })

        // 热门播客
        Column() {
          Row() {
            Text('热门播客')
              .fontSize(18)
              .fontColor('#333333')
            
            Text('→')
              .fontSize(16)
              .fontColor('#666666')
          }
          .width('100%')
          .margin({ bottom: 16 })

          ForEach(this.popularPodcasts, (podcast: popularPodcast) => {
            Row() {
              // 排名徽章
              Image(podcast.rank.toString())
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
              .layoutWeight(1)

              // // 缩略图
              // Rectangle()
              //   .width(60)
              //   .height(60)
              //   .fill('#E5E5E5')
              //   .borderRadius(8)
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
    .backgroundColor('#FFFFFF')
  }
}

interface banner{
  title: string;
  subtitle: string;
  buttonText: string;
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