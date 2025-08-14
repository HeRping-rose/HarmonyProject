@ComponentV2
export struct VipCard {
  private onVipClick: () => void = () => {
  }

  build() {
    Column({space:10}){
      Row({ space: 8 }) {
        Column({ space: 4 }) {
          Text('VIP 畅听会员').fontSize(16).fontWeight(FontWeight.Bold)
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

      Row({space:50}){
        Column(){
          Text('领取尊贵会员权益').fontSize(16).fontColor('#d3b89c')
          Text('新人免费领取周卡!').fontSize(12).fontColor('#e9d9cd')
        }

        Column(){
          Text('积分商城').fontSize(16).fontColor('#d3b89c')
          Text('限时兑好礼').fontSize(12).fontColor('#e9d9cd')
        }

      }.justifyContent(FlexAlign.SpaceBetween)


    }

  }
}
