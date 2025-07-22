import { ClockIn } from "../../commons/components/ClockIn"
import { AppStorageV2 } from "@kit.ArkUI"
import { OutArea, UserClass } from "../../models"
import { navBuilder } from "./components/Navbuilder"
import { toolsBuilder } from "./components/ToolsBuilder"
import { navPathStack } from "../../commons/utils/navPathStack"
import { auth } from "../../commons/utils/auth"
import { formatTime } from "../../commons/utils/formatTime"

@ComponentV2
struct Mine {
  outArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!

  @Local user: UserClass =auth.getUser()

  build() {
    Column(){
      // 头部
      Row({space: 10}){
        Image(this.user.avatar|| $r('app.media.ic_mine_avatar'))
          .alt($r('app.media.ic_mine_avatar'))
          .width(45)
          .aspectRatio(1)
          .borderRadius(55)
          // .fillColor('#ccc')

          if(this.user.nickName||this.user.username){
            Column({ space: 5 }) {
              Text(this.user.nickName||this.user.username).fontColor('#000').fontWeight(700).fontSize(24)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Row() {
                Text('编辑信息').fontColor('#000').fontSize(16).fontColor('#666')
                Image($r('app.media.ic_mine_edit')).width(15).fillColor('#666')
              }
            }.layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
          } else {
            Text('立即登录')
              .fontSize(18)
              .fontWeight(500)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .layoutWeight(1)
              .onClick(() => {
                navPathStack.pushPath({
                  name: 'login'
                })
              })
          }

        ClockIn()
      }
      .width('100%')
      .padding({ top: this.outArea.topHeight, bottom: this.outArea.bottomHeight })
      .padding({left:20,right:20})
      .height(150)
      .margin({top:26})
      .justifyContent(FlexAlign.SpaceBetween)

      //功能列表
      GridRow({ columns: 4 }) {
        navBuilder({
          icon: $r('app.media.ic_mine_history'), name: '历史记录', onClick: () => {
            // TODO
          }
        })
        navBuilder({
          icon: $r('app.media.ic_mine_collect'), name: '我的收藏', onClick: () => {
            // TODO
          }
        })
        navBuilder({
          icon: $r('app.media.ic_mine_like'), name: '我的点赞', onClick: () => {
            // TODO
          }
        })
        navBuilder({
          icon: $r('app.media.ic_mine_study'),
          name: '累计学时',
          other: formatTime(this.user.totalTime),
          onClick: () => {
            // TODO
          }
        })
      }
      .backgroundColor($r('app.color.white'))
      .padding(16)
      .margin({right: 20, left: 20})
      .borderRadius(8)

      //工具列表
      Column(){
        toolsBuilder({
          icon:$r('app.media.ic_mine_notes'),
          name:"开发常用词",
          onClick:()=>{}
        })
        toolsBuilder({ icon: $r('app.media.ic_mine_ai'), name: '面通AI' })
        toolsBuilder({ icon: $r('app.media.ic_mine_invite'), name: '推荐分享' })
        toolsBuilder({ icon: $r('app.media.ic_mine_file'), name: '意见反馈' })
        toolsBuilder({ icon: $r('app.media.ic_mine_info'), name: '关于我们' })
        toolsBuilder({
          icon: $r('app.media.ic_mine_setting'), name: '设置', onClick: () => {
            // TODO
          }
        })

        Button("退出登录")
          .backgroundColor('#f90')
          .fontColor('#ccc')
          .onClick(() => {
            auth.setUser({
              token: '',
              id: '',
              username: '',
              avatar: '',
              nickName: '',
              totalTime: 0,
              clockinNumber: 0,
              refreshToken: ''
            } as UserClass)
            navPathStack.clear()
            auth.getUser()
            navPathStack.pushPath({ name: 'login' })

          })

      }
      .margin({ right: 20, left: 20 ,top: 20 })
      .padding(16)
      .backgroundColor('#fff')
      .border({ radius: 8 })


    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffbde3d6')
    .linearGradient({
      angle: 0,
      colors: [['#fff3f4f6', 0],['#fff4ece7',0.8] , ['#ffffb47a', 1.0]]
    })


  }
}

export { Mine }