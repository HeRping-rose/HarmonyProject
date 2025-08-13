@ComponentV2
export struct ActivityBadgeCard {
  private onCardClick: (type: string) => void = (type: string) => {
  }

  build() {
    Row({ space: 12 }) {
      this.cardItem('我的动态', '⭐', '去查看', 'activity')
      this.cardItem('我的勋章', '🏅', '3 枚', 'badge')
    }
    .padding(16)
  }

  @Builder
  private cardItem(title: string, icon: string, desc: string, type: string) {
    Column({ space: 6 }) {
      Row({ space: 4 }) {
        Text(icon).fontSize(18)
        Text(title).fontSize(14).fontWeight(FontWeight.Medium)
      }

      Text(desc).fontSize(12).fontColor('#666')
    }
    .padding(12)
    .backgroundColor('#F8F8F8')
    .borderRadius(12)
    .layoutWeight(1)
    .onClick(() => this.onCardClick(type))
  }
}
