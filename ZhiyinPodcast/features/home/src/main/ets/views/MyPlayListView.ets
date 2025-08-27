//我的播放列表视图
import { HMRouter } from '@hadss/hmrouter'
import { PAGE_PATH } from 'basic'

@HMRouter({ pageUrl: PAGE_PATH.MY_PLAYLIST_PAGE })
@ComponentV2
export struct MyPlayListView {
  @Local currentIndex: number = 0
  @Local playList: PlayListData[] = [
    {
      id: '1',
      name: 'PlayList1',
      cover: $r('app.media.swiper2'),
      author: 'Author1',
      duration: '1:00',
      isLike: false,
    },
    {
      id: '2',
      name: 'PlayList2',
      cover: $r('app.media.swiper3'),
      author: 'Author2',
      duration: '2:00',
      isLike: true,
    },
    {
      id: '3',
      name: 'PlayList3',
      cover: $r('app.media.swiper4'),
      author: 'Author3',
      duration: '3:00',
      isLike: false,
    }

  ]

  build() {
      Column() {
        // 页面标题
        // 使用Tabs组件实现tab切换
        Tabs({ index: this.currentIndex, controller: new TabsController() }) {
          TabContent() {
            // 正在播放列表内容
            PlayList({playList: this.playList})
          }
          .tabBar('正在播放')

          TabContent() {
            // 历史播放列表内容
            HistoryPlayList()
          }
          .tabBar('历史播放')
        }
        .scrollable(false)
        .barHeight(50)
        .onChange((index: number) => {
          this.currentIndex = index
        })
        .layoutWeight(1)
      }
      .padding(16)
      .width('100%')
      .height('100%')
    }
}

export  interface PlayListData {
  id: string
  name: string
  cover: ResourceStr
  author: string
  duration: string
  //是否喜欢
  isLike: boolean
}



// 正在播放列表组件示例
@ComponentV2
struct PlayList {
  // @Local isLike: boolean = false
  @Param playList: PlayListData[] = []

  build() {
    //正在播放列表数组
    Column() {
      // 这里可以添加实际的播放列表项
      List({ space: 10 }) {
        ForEach(this.playList , (item:PlayListData, index: number) => {
          ListItem() {
            Row() {
              Image(item.cover)
                .width(50)
                .height(50)
                .borderRadius(8)
                .margin({ right: 16 })

              Column({space:10}) {
                Text(item.name)
                  .fontSize(16)
                  .fontColor('#333333')
                Text(item.author)
                  .fontSize(12)
                  .fontColor('#666666')
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              Row({space:10}){
                if (!item.isLike) {
                  Image($r('app.media.ic_like_line'))
                    .width(20)
                    .aspectRatio(1)
                    .onClick(() => {
                      item.isLike = !item.isLike
                    })
                } else {
                  Image($r('app.media.ic_like_filled_black'))
                    .width(20)
                    .aspectRatio(1)
                    .onClick(() => {
                      item.isLike = !item.isLike
                    })
                }

                //删除一个播放列表
                Image($r("app.media.ic_cancel"))
                  .width(20)
                  .aspectRatio(1)
                  .onClick(()=>{
                    //删除一个播放列表
                    this.playList.splice(index,1)

                  })
              }

            }
            .width('100%')
            .padding(10)
          }
          .backgroundColor('#F5F5F5')
          .borderRadius(8)
        })
      }
      .layoutWeight(1)
    }
  }

  deletePlayList(index: number) {

    throw new Error('Method not implemented.')
  }
}

// 历史播放列表组件示例
@ComponentV2
struct HistoryPlayList {
  build() {
    Column() {
      // 这里可以添加实际的历史播放列表项
      List({ space: 10 }) {
        ForEach(new Array(10).fill(0), ( index: number) => {
          ListItem() {
            Row() {
              Image($r('app.media.swiper1'))
                .width(50)
                .height(50)
                .borderRadius(8)
                .margin({ right: 16 })

              Column() {
                Text(`历史播放的歌曲 ${index + 1}`)
                  .fontSize(16)
                  .fontColor('#333333')
                Text('播放时间: 2023-08-01 10:30')
                  .fontSize(12)
                  .fontColor('#666666')
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              Image($r('app.media.ic_play'))
                .width(20)
                .aspectRatio(1)
            }
            .width('100%')
            .padding(10)
          }
          .backgroundColor('#F5F5F5')
          .borderRadius(8)
        })
      }
      .layoutWeight(1)
    }
  }
}
