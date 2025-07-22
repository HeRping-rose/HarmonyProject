@ComponentV2
struct skeletonBox {
  @Local opacityValue:number=1
  @Builder
  defaultBuilder(){}

  @BuilderParam
  default:()=>void=this.defaultBuilder //不传的时候默认值

  // 尾随闭包 插槽
  build() {
    Row({space:10}){
      this.default()
    }
    .opacity((this.opacityValue))
    .margin({bottom:10})
    .animation({
      duration:500,
      iterations:-1,
      playMode:PlayMode.Alternate,
      curve:Curve.EaseInOut
    })
    .onAppear(() => {
      this.opacityValue=0.5
    })
  }
}

export { skeletonBox }