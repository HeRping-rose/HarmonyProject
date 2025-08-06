
@ComponentV2
export  struct HDMLoading {
  build() {
    Stack({alignContent:Alignment.Center}){
      // 图片动画
      ImageAnimator()
        .images([
          { src: $r('app.media.loading_01') },
          { src: $r('app.media.loading_02') },
          { src: $r('app.media.loading_03') },
          { src: $r('app.media.loading_04') },
        ])
        .width(80)
        .aspectRatio(3)
        .state(AnimationStatus.Running)
        .iterations(-1)
    }
    .width('100%')
    .height('100%')


  }
}