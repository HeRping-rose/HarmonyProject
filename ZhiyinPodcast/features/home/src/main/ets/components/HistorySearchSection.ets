import { HistorySearchItem } from '../viewmodels'

@ComponentV2
export struct HistorySearchSection {
  @Param historyList: HistorySearchItem[]=[]

  build() {
    Column() {
      Row() {
        Text('搜索历史')
          .fontSize(16)

        //空格
        Button('清除历史')
          .onClick(() => {
            // 清除历史记录逻辑
          })
      }

      ForEach(this.historyList, (item: HistorySearchItem) => {
        HistorySearchItemComponent({
          keyword: item.keyword,
          time: item.timestamp
        })
      })
    }
  }
}

// HistorySearchItemComponent.ets

@ComponentV2
export struct HistorySearchItemComponent {
  @Param keyword: string = ''
  @Param time: number = 0

  build() {
    Row() {
      // 历史搜索关键词
      Row() {
        Text(this.keyword)
          .fontSize(16)
          .fontColor('#333333')
          .layoutWeight(1)
          .textAlign(TextAlign.Start)
      }
      .layoutWeight(1)

      // 时间信息
      Row() {
        Text(this.formatTime(this.time))
          .fontSize(12)
          .fontColor('#999999')
      }
      .margin({ left: 12 })

      // 删除按钮
      Image($r('[basic].media.ic_delete'))
        .width(16)
        .height(16)
        .opacity(0.5)
        .onClick(() => {
          // 删除单个历史记录
          this.handleDeleteHistory(this.keyword)
        })
    }
    .width('100%')
    .height(50)
    .padding({ left: 16, right: 16 })
    .backgroundColor('#ffffff')
    .borderRadius(8)
    .onClick(() => {
      // 点击历史记录重新搜索
      this.handleHistoryItemClick(this.keyword)
    })
  }

  // 格式化时间显示
  private formatTime(timestamp: number): string {
    const date = new Date(timestamp);
    const now = new Date();

    // 如果是今天
    if (date.toDateString() === now.toDateString()) {
      return `${date.getHours().toString().padStart(2, '0')}:${date.getMinutes().toString().padStart(2, '0')}`;
    }

    // 如果是今年
    if (date.getFullYear() === now.getFullYear()) {
      return `${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')}`;
    }

    // 其他情况显示完整日期
    return `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate()
      .toString()
      .padStart(2, '0')}`;
  }

  // 处理历史记录项点击事件
  private handleHistoryItemClick(keyword: string) {
    // 执行搜索逻辑
    console.log('重新搜索历史记录:', keyword);
    // 这里可以调用搜索方法或发送事件
  }

  // 处理删除历史记录
  private handleDeleteHistory(keyword: string) {
    // 删除单个历史记录的逻辑
    console.log('删除历史记录:', keyword);
    // 这里可以发送事件通知父组件删除该记录
  }
}

