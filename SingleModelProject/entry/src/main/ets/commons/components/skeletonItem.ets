@ComponentV2
struct skeletonItem {
  @Param widthValue:number|string=''
  build() {
    Text().width(this.widthValue).height(14)
      .backgroundColor('#ccc')
      .borderRadius(2)
  }
}

export { skeletonItem }