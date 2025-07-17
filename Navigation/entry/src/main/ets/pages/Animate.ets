import { Animation } from '@kit.ArkGraphics3D';
import { AnimatorOptions, AnimatorResult } from '@kit.ArkUI';

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
  @Local angle: number = 0
  @Local songAngle: number = 0
  @Local isPlay:boolean=false
  @Local state:AnimationStatus=AnimationStatus.Running

  // 2.配置动画
  options:AnimatorOptions={
    duration:1500,
    easing:"linear",
    fill:"forwards",
    delay:0,
    direction:"normal",
    iterations:-1,
    begin:0,
    end:360

}

  //1. 创建一个动画对象
  myAnimator:AnimatorResult=this.getUIContext().createAnimator(this.options)

  // 3.监听动画帧
  aboutToAppear(): void {
    // 监听动画从0-360 的这个数值变化而已
    this.myAnimator.onFrame=(value:number)=>{
    //   不断的监听是为了实时的把这个值赋值给我要操作的那个属性
      this.songAngle=value

    }
  }


  build() {
    Column({space:10}){
      Text(this.message)
        .fontSize(this.fontSize)
        .fontColor(this.fontColor)
        .width('100%')
        .textAlign(TextAlign.Center)
        //添加动画属性
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
            //添加动画 函数 animateTo()  先获取上下文  context=this.getUIContext()
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
      Button('按钮').width(this.btnW)
        .rotate({angle:this.angle})
        .onAppear(()=>{
          this.context.animateTo({
            duration:500,
            iterations:1,
            curve:Curve.Linear,
            delay:200,
            // onFinish:()=>{
            //   this.angle=360
            // }
          },()=>{
            this.angle=360
          })
        })
        .onClick(()=>{
          this.context.animateTo({duration:1000},()=>{
            this.angle=0
          })

        })

      Column({space:10}){
        Image($r('app.media.jjy'))
          .border({
            width: 1,
            color: '#ff7ad4c3',
          })
          .rotate({ angle: this.songAngle })
          .aspectRatio(1) // 宽高比例1:1
          .borderRadius(120)
          .width(100)
          .height(100)
          .onClick(() => {
            this.isPlay = !this.isPlay
            if(this.isPlay){
              this.myAnimator.play()
            }else {
              this.myAnimator.pause()
            }
          })

        Row(){
          Button('旋转').onClick(()=>{
            this.isPlay=!this.isPlay
            // 执行动画 播放
            if(this.isPlay){
              this.myAnimator.play()
            }
          })
          Button('暂停')
          .onClick(()=>{
            this.isPlay=false
            // 执行动画 暂停
            if (!this.isPlay) {
              this.myAnimator.pause() //pause() finish() cancel() reverse()
            }
          })
          }
        }

        Column(){
        ImageAnimator()
          .images([
            { src: '/assets/JDRunMan/app_refresh_people_0.png' },
          { src: '/assets/JDRunMan/app_refresh_people_1.png' },
          { src: '/assets/JDRunMan/app_refresh_people_2.png' },
          { src: '/assets/JDRunMan/app_refresh_people_3.png' },
          ])
          .state(this.state)
          .width(100)
          .height(150)
          .iterations(-1)
          .duration(400)
          .fillMode(FillMode.Forwards)

          Button('播放|暂停').onClick(() => {
            if (this.state === AnimationStatus.Running) {
              this.state = AnimationStatus.Paused
            } else {
              this.state = AnimationStatus.Running
            }
          })
        }
        Column(){
        ImageAnimator()
          .images(Array.from(Array(37),(item:string,index:number)=>{
            return{src:`/assets/JDLoading/loading_${index}.png`} as ImageFrameInfo
          }))
          .state(this.state)
          .width(100)
          .height(100)
          .iterations(-1)
          .duration(200)
          .aspectRatio(1)
          .fillMode(FillMode.Forwards)
          .onClick(() => {
            this.state = this.state === AnimationStatus.Running ? AnimationStatus.Paused : AnimationStatus.Running
          })
        }
      }




    }

}