@ComponentV2
export struct FunctionList {
  private onItemClick: (itemName: string) => void = (name: string) => {
  }

  build() {
    Column() {
      this.listItem('定制兴趣', 'icon_interest.png')
      this.listItem('驾驶模式', 'icon_drive.png')
      this.listItem('活动中心', 'icon_event.png')
      this.listItem('帮助与反馈', 'icon_help.png')
    }
    .padding({ left: 16, right: 16 })
  }


  @Builder
  private listItem(title: string, icon: string) {
    Row({ space: 12 }) {
      Image($rawfile(icon)).width(20).height(20)
      Text(title).fontSize(14)
      Text().height(20)
      Image($rawfile('arrow.svg')).width(16).height(16)
    }
    .height(44)
    .onClick(() => this.onItemClick(title))
  }


}


