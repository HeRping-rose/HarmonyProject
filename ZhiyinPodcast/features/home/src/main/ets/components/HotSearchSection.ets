import { HotSearchItem } from '../viewmodels'

@ComponentV2
export  struct HotSearchSection {
  @Param hotSearchList: HotSearchItem[]=[]

  build() {
    Column() {
      Text('热门搜索')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      // 网格布局展示热门关键词
      Grid() {
        ForEach(this.hotSearchList, (item: HotSearchItem) => {
          GridItem() {
            HotSearchTag({ keyword: item.keyword })
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr') // 3列网格
      .rowsGap(10)
      .columnsGap(10)
    }
    .padding({ left: 16, right: 16 })
  }
}

@ComponentV2
export struct HotSearchTag {
  @Param keyword: string = ''

  build() {
    Row() {
      Text(this.keyword)
        .fontSize(14)
        .backgroundColor('#f0f0f0')
        .borderRadius(16)
        .padding({
          left: 12,
          right: 12,
          top: 6,
          bottom: 6
        })
        .onClick(() => {
          // 处理点击搜索标签的逻辑
          this.handleSearch(this.keyword)
        })
    }
  }

  private handleSearch(keyword: string) {
    // 执行搜索逻辑
  }
}
