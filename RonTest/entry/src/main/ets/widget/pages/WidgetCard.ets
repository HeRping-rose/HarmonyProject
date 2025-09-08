const  localStorage=new LocalStorage()


@Entry(localStorage)
@Component
struct WidgetCard {
  @State x: number = 1
  @State y: number = 1
  @LocalStorageProp("num") num: number = 100
  //在页面上,使用本地数据库中的一个abc键与当前组件中的res的状态做关联
  // 如果本地数据库中没有abc键,则res为空字符串   所对应的值赋给res状态
  @LocalStorageProp("abc") res:string='xxx'
  @LocalStorageProp("formId") formId:string='aaa'

  build() {
    Column() {
      Button("message" + this.num)
        .onClick(() => {
          postCardAction(this, {
            action: 'message',
            abilityName: 'EntryFormAbility',
            // 提交过去的参数
            params: {
              num: this.num,
              aa: 200,
              formId: this.formId
            }
          });
        })
      Button('res'+this.res+this.formId)
        .onClick(() => {
          this.x = 1.1
          this.y = 1.1
        })
        .scale({ x: this.x, y: this.y })
        .animation({
          curve: Curve.EaseOut,
          playMode: PlayMode.AlternateReverse,
          duration: 200,
          onFinish: () => {
            this.x = 1
            this.y = 1
          }
        })
      // Text(this.res)
      Button('点击卡片跳转应用')
        .onClick(() => {
          postCardAction(this, {
            action: 'router',
            abilityName: 'EntryAbility',
            params: {
              "targetPage": 'pages/Index'
            }
          })
        })
      Button('点击卡片跳转应用')
        .onClick(() => {
          postCardAction(this, {
            action: 'router',
            abilityName: 'EntryAbility',
            params: {
              "targetPage": 'pages/Second'
            }
          })
        })
      Button("call事件" + this.num)
        .onClick(() => {
          postCardAction(this, {
            action: 'call',
            abilityName: 'EntryAbility', // 只能跳转到当前应用下的UIAbility
            params: {
              // 如果事件类型是call，必须传递method属性，用来区分不同的事件
              method: "inc", // 函数名做什么事件
              formId: this.formId, // 卡片id
              num: this.num, // 参数 测试效果
            }
          });
        })
    }
    .padding('10vp')
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    // 点击按钮跳转
    // .onClick(() => {
    //   postCardAction(this, {
    //     "action": 'router',
    //     "abilityName": 'EntryAbility',
    //     "params": {
    //       "message": 'router test'
    //     }
    //   });
    // })
  }
}