import { Animation } from '@kit.ArkGraphics3D';

//  .animation属性
// animateTo()函数

@Entry
@ComponentV2
struct Animate {
  @Local message: string = 'dance';
  @Local fontSize: number = 30;
  @Local fontColor:ResourceStr='#ccc'
  @Local btnW:number=100;
  @Local btnH:number=50;
  context =this.getUIContext()
  @Local flag:boolean=true


  build() {
    Column(){
      Text(this.message)
        .fontSize(this.fontSize)
        .fontColor(this.fontColor)
        .width('100%')
        .textAlign(TextAlign.Center)
        .animation({
          duration: 1000,
          iterations:-1, //重复次数 -1 表示重复
          curve:Curve.Friction,  //动画曲线
          delay: 500,  //延迟
          playMode: PlayMode.Alternate, // 播放模式
        })

      Row(){
        Button('变大').onClick(() => {
          this.fontSize = 50
          this.fontColor='#000'
        })
        Button('变小').onClick(() => {
          this.fontSize = 20
          this.fontColor = '#0f0'
        })
      }.width('100%')
      .justifyContent(FlexAlign.SpaceAround)


      Button('改变大小')
        .width(this.btnW)
        .height(this.btnH)
        .backgroundColor('#ccc')
        .onClick(()=>{
          if(this.flag) {
            this.context.animateTo({
              duration:1000,
              iterations:-1,
              playMode:PlayMode.AlternateReverse,
              delay:200,
              onFinish:()=>{
                console.log('动画结束')
            }
            }, () => {
              this.btnW = 200
              this.btnH = 240
            })
          }else {
            this.context.animateTo({}, () => {
              this.btnW = 100
              this.btnH = 80
            })
          }
          this.flag=!this.flag

      })



    }
  }
}