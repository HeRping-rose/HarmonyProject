import { MyNavBar } from "../../components/MyNavBar";
import { promptAction } from "@kit.ArkUI";
import { CateMenuType, serverUrl } from "../../models";
import { getCateMenuApi } from "../../api";
import { ShopList } from "../../components/ShopList";

@ComponentV2
export  struct Home {

  @Local title: string = 'HomePage';
  @Local banner:ResourceStr[]=[
    $r('app.media.activity'),
    $r('app.media.activity'),
  ]
  // @Local CateMenu:CateMenuType[][]=[
  //   [
  //     { id: 1, name: '超市',
  //       icon:$r('app.media.f42235e6929a5cb0e7013115ce78djpeg'),
  //       description:'description',
  //       created_at: "2025-09-03T02:51:28.190410Z",
  //       updated_at: "2025-09-03T02:51:28.190445Z"},
  //   ],
  // ]
  @Local CateMenu: CateMenuType[][] = []

  aboutToAppear(): void {
    this.getData()
  }

  async getData() {
    let res = await getCateMenuApi()
    console.log('res:', JSON.stringify(res))
    for (let i = 0; i < res.length; i+=8){
      this.CateMenu.push(res.slice(i, i + 8))
    }
  }

  build() {
    Column(){
      //头部nav
      MyNavBar({
        title:this.title,
        // 左右两端结构
        left: this.LeftNav,
        right:this.RightNav
      })
      Swiper(){
        ForEach(this.banner, (item:ResourceStr) => {
          Image(item).height(180).objectFit(ImageFit.Cover)
        })
      }.height(180).width('100%')

      //分类菜单
      Swiper(){
        ForEach(this.CateMenu, (item:CateMenuType[]) => {
          Grid() {
            ForEach(item, (item:CateMenuType) => {
              GridItem() {
                Column(){
                  Image(serverUrl+item.icon).width(50).aspectRatio(1).borderRadius(100)
                  Text(item.name).fontColor('#333333')
                }
              }
            })
          }.columnsTemplate('1fr 1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
        })
      }
      .height(180)

      //分隔线
      Divider().backgroundColor('#ccc').height(10)

    //   附近店家
      Row(){
        Image($r('app.media.166918527a619823')).width(20)
        Text('附近店家').fontColor('#666')
      }.padding(10).justifyContent(FlexAlign.Start).width('100%')

    //   店铺列表组件
      ShopList()

    }.height('100%')
  }

//   构建home页 专用的导航左右组件
  @Builder
  LeftNav() {
    Image($r('app.media.sous')).width(20).aspectRatio(1)
      .onClick(()=>{
        promptAction.openToast({message:'去搜索'})
      }).fillColor('#fff')
  }
  @Builder
  RightNav() {
    Row() {
      Text('登录').onClick(()=>{
        promptAction.openToast({message:'去登录'})
      }).fontColor('#fff')
      Text('|').fontColor('#fff')
      Text('注册').onClick(() => {
        promptAction.openToast({message:'去注册'})
      }).fontColor('#fff')
    }
  }
}