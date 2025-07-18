@ComponentV2
struct ClockIn {
  @Param clockInNumber:number = 0
  @Event $clockInNumber:(val:number)=>void = (val: number)=>{}
  build() {
    Column(){
      if(this.clockInNumber==0){
        Text('打卡').translate({x:5,y:8})

      }else {
        Column(){
          Text('已打卡')
            .fontSize(12)
          Text(){
            Span(this.clockInNumber.toString())
            Span('天')
              .fontSize(12)
          }
        }.translate({ x: 5, y: 8 })
      }

    }
    .width(72)

    .height(28)
    .backgroundImage(this.clockInNumber > 0 ? $r('app.media.ic_common_clocked') :$r('app.media.ic_common_unclock'))
    .backgroundImageSize(ImageSize.Contain)
    .onClick(() => {
      this.$clockInNumber(this.clockInNumber + 1)
    })
  }
}

export  { ClockIn }