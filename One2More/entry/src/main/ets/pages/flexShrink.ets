// 自适应布局
@Entry
@Component
struct Demo01 {
  // 绑定的宽度-默认 600
  @State containerWidth: number = 600

  // 底部滑块，可以通过拖拽滑块改变容器尺寸。
  @Builder
  sliderBuilder() {
    Slider({
      value: this.containerWidth, // 绑定的值
      min: 400, // 最小值
      max: 1000, // 最大值
      style: SliderStyle.OutSet // 滑块在滑轨上
    })
      .blockColor(Color.White)
      .width('60%')
      .position({ x: '20%', y: '80%' })
      .onChange((value) => {
        this.containerWidth = value
      })
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      // 标记现在的宽度
      Text('宽度:' + this.containerWidth)
        .zIndex(2)
        .translate({ x: 20, y: 20 })
        .fontColor(Color.Orange)

      // 核心区域
      Column() {
        Column() {
          Row() {
            // 布局能l力 1：拉伸能力：
            // 容器组件尺寸发生改变时，将变化的部分分配给容器内的【指定区域】
            //

            // 涉及属性：
            // flexShrink:压缩比例，默认值：Column，Row 时（0），Flex 时（1）
            // flexGrow:拉伸比例，默认值 0

            // 需求：
            // 1. 空间不足时：分配给左右，1：1
            // 2. 空间富余时：分配给中间

            // 左
            Row() {
              Text('左')
                .fontSize(20)
                .fontColor(Color.White)
            }
            .justifyContent(FlexAlign.Center)
            .width(150)
            .height(290)
            .backgroundColor('#c2baa6')
            .flexShrink(1)

            // 中
            Row() {
              Text('中')
                .fontSize(30)
                .fontColor(Color.White)
            }
            .width(300)
            .height(290)
            .backgroundColor('#68a67d')
            .justifyContent(FlexAlign.Center)
            // .layoutWeight(1)
            .flexGrow(1)


            // 右
            Row() {
              Text('右')
                .fontSize(20)
                .fontColor(Color.White)
            }
            .justifyContent(FlexAlign.Center)
            .width(150)
            .height(290)
            .backgroundColor('#c2baa6')
            .flexShrink(1)

          }
          .width(this.containerWidth)
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
          .border({ width: 2, color: Color.Orange })
          .backgroundColor(Color.Black)
        }

        // 底部滑块
        this.sliderBuilder()
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Pink)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    }
  }
}