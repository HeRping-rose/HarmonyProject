import { HMRouter, HMRouterMgr } from '@hadss/hmrouter';
import { MyCell, MyCellGroup, MyNavBar, MyNavCol, PAGE_PATH } from 'basic';
import { text } from '@kit.ArkGraphics2D';
import { promptAction } from '@kit.ArkUI';
import { userLoginAPI } from '../api/login';

@HMRouter({ pageUrl: PAGE_PATH.SETTING_PAGE })
@ComponentV2
export  struct SettingView {
  private onItemClick: (itemName: string) => void = (name: string) => {
    console.log('Clicked item:', name)
  }
  @Builder
  private listItem(title: string, icon: string) {
    Row({ space: 12 }) {
      Image($rawfile(icon))
        .width(20)
        .height(20)
        .onError((error) => {
          console.error('Failed to load icon:', icon, error)
        })

      Text(title)
        .fontSize(14)
        .fontWeight(FontWeight.Normal)
        .layoutWeight(1)

      Image($rawfile('arrow.svg'))
        .width(16)
        .height(16)
        .onError((error) => {
          console.error('Failed to load arrow icon:', error)
        })
    }
    .height(44)
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .onClick(() => {
      this.onItemClick(title)
    })
  }


  build() {
    //设置页面结构
    //账号输入框
    Column(){
      MyNavBar({title:'设置',showLeftIcon:true,showRightIcon:false,onLeftClick:()=>HMRouterMgr.pop()})
      Search({placeholder: '搜索设置项'}).borderRadius(12).height(30).margin({ left: 16, right: 16 })

      //个人账号信息区域
      Column() {
        Row() {
          Image($rawfile('ic_avatar.svg'))
            .width(40)
            .height(40)
            .borderRadius(80)
            .margin({ left: 16 })
          Column() {
            Text('用户名')
            Text('个人信息、账号绑定、隐私设置').fontSize(14).fontColor(Color.Gray)
          }
          .margin({ left: 16 })
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)
          Image($rawfile('arrow.svg'))
            .width(16)
        }
        .padding({top: 16,bottom:16,right: 8})

      }.margin({ left: 16, right: 16, top: 16,})
      .backgroundColor('#f3f3f3')
      .borderRadius(20)
      //设置功能区域

      Column() {
        MyNavCol()
        // MyCellGroup({
        //
        //   title: '设置功能',
        //   children: [
        //     this.listItem('账号与安全', 'ic_account.svg'),
        //     this.listItem('通用', 'ic_general.svg'),
        //     this.listItem('通知与提醒', 'ic_notification.svg'),
        //     this.listItem('语言与输入法', 'ic_language.svg'),
        //     this.listItem('辅助功能', 'ic_accessibility.svg'),
        //     this.listItem('设备与显示', 'ic_device.svg'),
        //     this.listItem('存储与缓存', 'ic_storage.svg'),
        //   ]
        // })
        MyCell({title:'账号与安全',icon:'ic_account.svg',value:'修改密码',showRightIcon:true})
      }
      .margin({ left: 16, right: 16, top: 16, })
      .backgroundColor('#f3f3f3')
      .borderRadius(20)




    }

  }
}

interface MenuItem {
  leftIcon: ResourceStr
  title: string
  subtitle:string
  rightIcon:ResourceStr
}