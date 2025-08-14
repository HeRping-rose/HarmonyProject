@ComponentV2
export struct ServiceGrid {
  build() {
    // 使用 Row 和 Column 的组合替代 GridRow
    Column({ space: 10 }) {
      // 第一行
      Row({ space: 10 }) {
        this.gridItem({ label: '我的喜欢', icon: $rawfile('icon_like.svg') })
        this.gridItem({ label: '我的收藏', icon: $rawfile('icon_collect.svg') })
        this.gridItem({ label: '播放记录', icon: $rawfile('icon_record.svg') })
        this.gridItem({ label: '声音小记', icon: $rawfile('icon_note.svg') })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      // 第二行
      Row({ space: 10 }) {
        this.gridItem({ label: '草稿箱', icon: $rawfile('icon_draft.svg') })
        this.gridItem({ label: '收听时长', icon: $rawfile('icon_time.svg') })
        this.gridItem({ label: '钱包', icon: $rawfile('icon_wallet.svg') })
        this.gridItem({ label: '更多服务', icon: $rawfile('icon_more.svg') })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .padding(16)
  }

  @Builder
  gridItem(params: Param) {
    Column({ space: 4 }) {
      // 添加错误处理和加载状态
      Image(params.icon)
        .width(32)
        .height(32)
        .onError((error) => {
          console.error('Image load failed:', params.label, error)
          // 图片加载失败时显示占位符

        })
      Text(params.label)
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width('25%')
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(HorizontalAlign.Start)
  }
}

interface Param {
  label: string
  icon: ResourceStr
}
