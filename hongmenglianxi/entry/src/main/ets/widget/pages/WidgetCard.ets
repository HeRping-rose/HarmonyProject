//用本地数据来收数据

// 创建localStorage实例
const localStorage=new LocalStorage()


//传入 WidgetCard 到 WidgetCard
@Entry(localStorage)
@Component
struct WidgetCard {
  // 接收本地数据库中的内容(值)叫 'content'
  // 把这个本地数据库中的'content'内容 你好 card  赋给 content 如果没有 就赋值为''默认值为空

  @LocalStorageProp('content') content: string=''


  build() {
    Column() {
      Text('小卡片')
      Text('本地数据'+this.content)

    }
  }
  // /*
  //  * The title.
  //  */
  // readonly title: string = 'Hello World';
  // /*
  //  * The action type.
  //  */
  // readonly actionType: string = 'router';
  // /*
  //  * The ability name.
  //  */
  // readonly abilityName: string = 'EntryAbility';
  // /*
  //  * The message.
  //  */
  // readonly message: string = 'add detail';
  // /*
  //  * The width percentage setting.
  //  */
  // readonly fullWidthPercent: string = '100%';
  // /*
  //  * The height percentage setting.
  //  */
  // readonly fullHeightPercent: string = '100%';
  //
  // build() {
  //   Row() {
  //     Column() {
  //       Text(this.title)
  //         .fontSize($r('app.float.font_size'))
  //         .fontWeight(FontWeight.Medium)
  //         .fontColor($r('sys.color.font'))
  //     }
  //     .width(this.fullWidthPercent)
  //   }
  //   .height(this.fullHeightPercent)
  //   .backgroundColor($r('sys.color.comp_background_primary'))
  //   .onClick(() => {
  //     postCardAction(this, {
  //       action: this.actionType,
  //       abilityName: this.abilityName,
  //       params: {
  //         message: this.message
  //       }
  //     });
  //   })
  // }
}