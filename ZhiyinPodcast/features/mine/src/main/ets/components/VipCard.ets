@ComponentV2
export struct VipCard {
  private onVipClick: () => void = () => {
  }

  build() {
    Row({ space: 8 }) {
      Column({ space: 4 }) {
        Text('VIP 新春会员').fontSize(16).fontWeight(FontWeight.Bold)
        Text('领取尊贵会员权益').fontSize(12).fontColor('#999')
      }.layoutWeight(1)

      Button('立即开通')
        .backgroundColor('#FFD700')
        .fontColor('#333')
        .borderRadius(16)
        .padding({ left: 12, right: 12 })
        .onClick(() => this.onVipClick())
    }
    .padding(12)
    .backgroundColor('#FFF8E1')
    .borderRadius(12)
    .margin({ left: 16, right: 16 })
  }
}
