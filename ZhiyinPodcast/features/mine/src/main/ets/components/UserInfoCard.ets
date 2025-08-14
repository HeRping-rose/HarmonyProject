@ComponentV2
export struct UserInfoCard {
  // 点击事件接口
  private onAvatarClick: () => void = () => {
  }
  private onStatClick: (type: string) => void = (type: string) => {
  }

  aboutToAppear() {
    // 这里可以接收外部传入的事件回调
  }

  build() {
    Column({ space: 12 }) {
      // 头像+昵称
      Row({ space: 12 }) {
        Image($rawfile('avatar.png'))
          .width(60).height(60).borderRadius(30)
          .onClick(() => this.onAvatarClick())

        Column({ space: 6 }) {
          Row({ space: 4 }) {
            Text('小新')
              .fontSize(18).fontWeight(FontWeight.Bold)
            Text('VIP')
              .fontSize(12)
              .backgroundColor('#FFD700')
              .borderRadius(4)
              .padding({
                left: 4,
                right: 4,
                top: 2,
                bottom: 2
              })
          }

          Text('个性签名在这里~').fontSize(12).fontColor('#999')
        }
        .justifyContent(FlexAlign.Center)
      }

      // 数据统计
      Row({ space: 20 }) {
        this.infoItem('59', '关注', () => this.onStatClick('follow'))
        this.infoItem('526', '粉丝', () => this.onStatClick('fans'))
        this.infoItem('1278', '获赞', () => this.onStatClick('likes'))
        this.infoItem('17', '订阅', () => this.onStatClick('orders'))
      }
    }
    .padding(16)
  }

  @Builder
  private infoItem(count: string, label: string, clickHandler: () => void) {
    Column() {
      Text(count).fontSize(16).fontWeight(FontWeight.Medium)
      Text(label).fontSize(12).fontColor('#666')
    }
    .justifyContent(FlexAlign.Center)
    .onClick(clickHandler)
  }
}
