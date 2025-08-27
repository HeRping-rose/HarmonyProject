import { CategoryRecommendation } from '../viewmodels'


// 分类推荐模块
@ComponentV2
export struct CategoryRecommendSection {
  @Param categories: CategoryRecommendation[]=[]

  build() {
    Column() {
      Text('分类推荐')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      ForEach(this.categories, (category: CategoryRecommendation) => {
        CategorySection({
          categoryName: category.categoryName,
          keywords: category.keywords
        })
      })
    }
  }
}

// CategorySection.ets
@ComponentV2
export struct CategorySection {
  @Param categoryName: string = ''
  @Param keywords: string[] = []

  build() {
    Column() {
      // 分类标题
      Text(this.categoryName)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('100%')
        .margin({ top: 16, bottom: 8 })

      // 关键词标签列表
      Flex({ wrap: FlexWrap.Wrap, direction: FlexDirection.Row }) {
        ForEach(this.keywords, (keyword: string) => {
            CategoryKeywordTag({ keyword: keyword })
              .margin({ right: 8, bottom: 8 })
        }, (keyword : string) => keyword)
      }
    }
    .width('100%')
  }
}

// 分类关键词标签组件
@ComponentV2
struct CategoryKeywordTag {
  @Param keyword: string = ''

  build() {
    Row() {
      Text(this.keyword)
        .fontSize(14)
        .fontColor('#333333')
        .padding({
          left: 12,
          right: 12,
          top: 6,
          bottom: 6
        })
        .backgroundColor('#f5f5f5')
        .borderRadius(16)
        .onClick(() => {
          // 处理关键词点击事件
          this.handleKeywordClick(this.keyword)
        })
    }
  }

  private handleKeywordClick(keyword: string) {
    // 执行搜索或跳转逻辑
    console.log('点击分类关键词:', keyword)
  }
}