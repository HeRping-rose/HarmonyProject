@ComponentV2
export struct FeedBackDialog {
  // 控制弹窗显示
  @Param isShow: boolean= false
  //分享的自定义弹窗


  build() {

    Stack() {

      // 弹窗主体
      Column() {
        // 标题
        Text('提交反馈')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 24, bottom: 12 })

        // 绿色对勾图标
        Image($r('app.media.ic_feedback_success'))
          .width(48)
          .height(48)
          .margin({ bottom: 12 })

        // 成功提示
        Text('提交成功，感谢您的反馈')
          .fontSize(16)
          .margin({ bottom: 8 })

        // 说明文字
        Text('工作人员会在5-7个工作日内跟进您的问题和意见')
          .fontSize(12)
          .fontColor('#888')
          .margin({ bottom: 20 })

        // 按钮
        Button('返回题目详情')
          .width('80%')
          .backgroundColor('#4ecb73')
          .fontColor('#fff')
          // .onClick(() => {
          //   if (this.onClose) {
          //     this.onClose()
          //   }
          // })
          .margin({ bottom: 24 })
      }
      .backgroundColor('#fff')
      .borderRadius(20)
      .width('90%')
      .alignSelf(ItemAlign.Center)
      .zIndex(100)
      .margin({ top: '30%' })
      .shadow({
        radius: 12,
        color: 'rgba(0,0,0,0.08)',
        offsetX: 0,
        offsetY: 4
      })
      .position({ x: '5%', y: '30%' })
    }
    .width('100%')
    .height('100%')
  }
}