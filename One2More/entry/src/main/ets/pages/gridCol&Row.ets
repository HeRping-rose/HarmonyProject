
@Entry
@ComponentV2
struct Demo12 {
  @Local list:string[]=[]


  build() {
    Column() {
      // GridRow 默认支持 4 个断点
      //  xs:(0vp<=width<320vp) 智能穿戴，比如手表
      //  sm:(320vp<=width<600vp) 手机
      //  md:(600vp<=width<840vp) 折叠屏
      //  lg:(840vp<=width) 平板
      GridRow({
        breakpoints: {
          value: ['320vp', '600vp', '840vp']
        },
        gutter: 30, // 子项之间的间距  {x:?  ,y:?}
        // columns: 12, // 设置一行的总列数, 默认: 一行12列
        // 可以根据断点值, 设置每一行的列数
        // columns: {
        //   xs: 1, // 超小屏, 比如: 手表
        //   sm: 2, // 小屏幕, 比如: 手机竖屏
        //   md: 4, // 中等屏幕, 比如: 折叠屏, 手机横屏
        //   lg: 6, // 大屏幕, 比如: pad
        // }
      }) {
        ForEach(Array.from({ length: 12 }), (item: string, index: number) => {
          GridCol({
            // 设置一列占得份数
            // span: 2,
            // 支持不同断点分别设置不同的占用列数  总个数除以span
            span: { xs: 12, sm: 6, md: 4, lg: 2 },
            // offset 偏移列数 默认为 0
            // offset: 1, // 偏移一列
            // 支持不同断点分别设置偏移不同的列数
            // offset: {
            //   sm: 1
            // }
          }) {
            Column(){
              Image($r('app.media.ic_video_grid_1'))
              Text(index.toString())
            }

          }
          .height(100)
          .border({ width: 1, color: Color.Black })
        })
      }
      .width('90%')
      .height('90%')
    }
    .width('100%')
    .height('100%')
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}