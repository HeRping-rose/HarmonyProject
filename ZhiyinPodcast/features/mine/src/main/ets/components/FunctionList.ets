@ComponentV2
export struct FunctionList {
  private menuItems: MenuItem[] = [
    { title: '定时关闭', icon: 'icon_interest.png' },
    { title: '驾驶模式', icon: 'icon_drive.png' },
    { title: '活动中心', icon: 'icon_event.png' },
    { title: '帮助与反馈', icon: 'icon_help.png' }
  ]

  private onItemClick: (itemName: string) => void = (name: string) => {
    console.log('Clicked item:', name)
  }

  build() {
    Column() {
      ForEach(this.menuItems, (item:MenuItem, index) => {
        Column() {
          this.listItem(item.title, item.icon)

          // 添加分割线（除了最后一个元素）
          if (index < this.menuItems.length - 1) {
            Divider()
              .color('#F0F0F0')
              .strokeWidth(0.5)
              .margin({ left: 32 })
          }
        }
      }, (item:MenuItem) => item.title)
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(12)
    .padding({ left: 16, right: 16 })
  }

  @Builder
  private listItem(title: string, icon: string) {
    Row({ space: 12 }) {
      Image($rawfile(icon))
        .width(20)
        .height(20)
        .onError((error) => {
          console.error('Failed to load icon:', icon, error)
        })

      Text(title)
        .fontSize(14)
        .fontWeight(FontWeight.Normal)
        .layoutWeight(1)

      Image($rawfile('arrow.svg'))
        .width(16)
        .height(16)
        .onError((error) => {
          console.error('Failed to load arrow icon:', error)
        })
    }
    .height(44)
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .onClick(() => {
      this.onItemClick(title)
    })
  }
}


interface MenuItem {
  title: string
  icon: string
}