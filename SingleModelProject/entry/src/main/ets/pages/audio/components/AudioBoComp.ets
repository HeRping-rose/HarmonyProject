import { common } from "@kit.AbilityKit"

@ComponentV2
export struct AudioBoComp {
  @Local per: number = 0  //默认为0
  @Param maxAmplitude: number = 0 // 默认为0,振幅0-32700

  ctx=this.getUIContext()
  @Monitor('maxAmplitude')
  onChange() {
    this.ctx.animateTo({ duration: 100 }, () => {
      if (this.maxAmplitude < 500) {
        this.per = 0
      } else if (this.maxAmplitude > 30000) {
        this.per = 1
      } else {
        this.per = this.maxAmplitude / 30000
      }
    })
  }

  build() {
    Row({ space: 5 }) {
      ForEach(Array.from({ length: 30 }), () => {
        Column()
          .layoutWeight(1)
          .height(this.per * 100 * Math.random())
          .backgroundColor($r('app.color.common_blue'))
      })
    }
    .width('100%')
    .height(100)
  }
}