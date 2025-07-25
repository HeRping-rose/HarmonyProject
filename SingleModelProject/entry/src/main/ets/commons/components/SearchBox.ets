@ComponentV2
struct SearchBox {
  @Param font:string = 'normal'
  @Param fontColor:ResourceColor='#555'
  @Param placeholder:string = '请输入关键字'
  @Param placeholderColor:string = '#999999'
  @Param boxWidth:number = 180
  @Param boxHeight:number = 30
  @Param full:number=1
  @Param boxBackground:ResourceColor = '#ddd'

  @Param searchResult:string = ''
  @Event $searchResult: (value: string) => void = (value: string) => {}

  @Local opacity1:number=1
  @Event searchFn: () => void = () => {}

  build() {
    Stack(){
      Row() {
        Image($r('app.media.ic_common_search')).width(12)
          .fillColor(this.fontColor)
        Text(this.placeholder)
          .fontColor(this.fontColor)
      }
      .justifyContent(FlexAlign.Center)
      .opacity(this.opacity1)
      .animation({
        duration:300,
        iterations:1,
      })

      TextInput({text: this.searchResult})
        .onChange((value: string) => {
          this.$searchResult(value)
        })
        .onFocus(()=>{this.opacity1=0})
        .onBlur(()=>{this.searchResult? this.opacity1 = 0: this.opacity1=1})
        .onClick(() => {
          this.searchFn()
        })

    }
    .layoutWeight(this.full)
    .borderRadius(this.boxHeight/2)
    .backgroundColor(this.boxBackground)
    .width(this.boxWidth)
    .height(this.boxHeight)
    .margin({left: 16, right: 16 })

  }
}

export { SearchBox }