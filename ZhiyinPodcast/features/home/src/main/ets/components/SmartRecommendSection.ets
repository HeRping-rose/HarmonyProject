//智能推荐模块
import { SmartRecommendation } from '../viewmodels'

@ComponentV2
export struct SmartRecommendSection {
  @Param recommendations: SmartRecommendation[]=[]

  build() {
    Column() {
      Text('为您推荐')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      ForEach(this.recommendations, (item: SmartRecommendation) => {
        SmartRecommendItem({
          keyword: item.keyword,
          reason: item.reason
        })
      })
    }
  }
}

// SmartRecommendItem.ets
@ComponentV2
export struct SmartRecommendItem {
  @Param keyword: string = ''
  @Param reason: string = ''

  build() {
    Row() {
      // 主要内容区域
      Column() {
        Row() {
          Text(this.keyword)
            .fontSize(16)
            .fontColor('#333333')
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')

        // 推荐理由
        // If(this.reason && this.reason.length > 0) {
        //   Row() {
        //     Text(this.reason)
        //       .fontSize(12)
        //       .fontColor('#999999')
        //       .maxLines(1)
        //       .textOverflow({ overflow: TextOverflow.Ellipsis })
        //   }
        //   .width('100%')
        //   .margin({ top: 4 })
        // }
      }
      .layoutWeight(1)
      .padding({ right: 12 })

      // 右侧箭头指示器
      Image($r('app.media.ic_right'))
        .width(16)
        .height(16)
        .opacity(0.5)
    }
    .width('100%')
    .height(60)
    .padding({ left: 16, right: 16 })
    .backgroundColor('#ffffff')
    .borderRadius(8)
    .onClick(() => {
      // 处理推荐项点击事件
      this.handleRecommendClick(this.keyword)
    })
  }

  private handleRecommendClick(keyword: string) {
    // 执行搜索或跳转逻辑
    console.log('点击智能推荐项:', keyword)
  }
}