import { HcNavBar } from "../../../commons/components/HcNavBar"
import { audioDB } from "../../../commons/utils/AudioDB_back"
import { auth } from "../../../commons/utils/auth"
import { AudioItem, UserClass } from "../../../models"
import { AudioItemComp } from "./AudioItemComp"
import { AudioPlayer } from "./AudioPlayer"
import { AudioRecordComp } from "./AudioRecordComp"
import { InputDialog } from "./InputDialog"

@Extend(Text)
function actionButton(color: ResourceColor) {
  .width(80)
  .aspectRatio(1)
  .backgroundColor(color)
  .textAlign(TextAlign.Center)
  .fontColor($r('app.color.white'))
}

@ComponentV2
export struct AudioView {
  // @Local list: AudioItem[] = [{} as AudioItem, {} as AudioItem]
  @Local list: AudioItem[] = []
  @Local activeItem: AudioItem ={} as AudioItem
  user:UserClass=auth.getUser()
  @Local isShow:boolean=false
  @Builder
  audioBuilder(){
    Column(){
      AudioPlayer({item:this.activeItem})

    }.width('100%')
    .height('100%')
    .backgroundColor('#ccc')
  }

  async getAudioList(){
    this.list=await audioDB.query(this.user.id)
  }

  @Builder
  swiperBuilder(item: AudioItem){

    Row(){
      Text('编辑')
        .actionButton($r('app.color.common_blue'))
        .onClick( () => {
          this.dialog.open()
          this.activeItem=item
        })
      Text('删除')
        .actionButton('#FF0033')
        .onClick(async () => {
          await audioDB.delete(item.id!)
          this.getAudioList()
        })
    }
  }
  @Builder
  swiperBuilder2() {
    Button('12312314')
  }

  async aboutToAppear(): Promise<void> {
    await audioDB.initStore()
     this.getAudioList()
  }

  dialog=new CustomDialogController({
    builder:InputDialog({
      name:this.activeItem.name,
      onSubmit: async (name)=>{
        this.dialog.close()
        // 拿新的的name去修改一行数据
        let item=this.activeItem
        item.name=name
        await audioDB.update(item)
        await this.getAudioList()
      }
    }),
    customStyle:true,
    alignment:DialogAlignment.Center
  })
  build() {
    Column() {
      HcNavBar({ title: '面试录音', showRightIcon: false })
      Column() {
        List() {
          ForEach(this.list, (item: AudioItem) => {
            ListItem() {
              AudioItemComp({
                // item: {
                //   id: 1,
                //   name: '2024年10月01日_10点10分10秒',
                //   path: '/data/el/xxx',
                //   user_id: '100',
                //   duration: 10000,
                //   size: 10000,
                //   create_time: 10000
                // }
                item: item
              }).onClick(() => {
                this.isShow=true  //显示弹窗
              })
            }.swipeAction({
              end:this.swiperBuilder(item),
              start: this.swiperBuilder2()
            })
          })
        }
        .width('100%')
        .height('100%')
        .bindContentCover($$this.isShow,this.audioBuilder())
      }
      .width('100%')
      .layoutWeight(1)

      // 麦克风 小喇叭组件
      AudioRecordComp({
        returnAudioData: async (item: AudioItem) => {
          let  res= await audioDB.insert(item)
          console.log('res' + JSON.stringify(item))
          this.getAudioList()
          //
          // console.log('data' + JSON.stringify(this.list))


        }
      })
    }
    .width('100%')
    .height('100%')
  }
}