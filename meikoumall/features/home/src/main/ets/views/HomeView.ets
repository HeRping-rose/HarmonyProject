import { CategoryItem, HDMGoodsItem } from "basic"
import { HDMDiscountGoods } from "../components/HDMDiscountGoods"
import { HDMGoods } from "../components/HDMGoods"
import { Banner, Params } from "../viewmodels/home"
import { DiscountType } from "../viewmodels/home"

@ComponentV2
export  struct HomeView {
  @Local banner:Banner[]=[]
  @Local categories:CategoryItem[]=[]
  @Local saleGoods:HDMGoodsItem[]=[]
  // 爆款推荐
  @Local
  hotGoods: HDMGoodsItem[] = []
  // 一站买全
  @Local
  oneGoods: HDMGoodsItem[] = []
  // 新鲜好物
  @Local
  newGoods: HDMGoodsItem[] = []
  @Local
  recommendGoods: HDMGoodsItem[] = []

  // 用于模拟首页上的数据
  mockData(){
    this.banner=new Array(6).fill({
      id:'42',
      imgUrl:'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/nuandong_sj.png',
      hrfUrl:'/category/1181622006',
      type:'1'
    })

    this.categories=new Array(10).fill({
      id:'1181622001',
      name:'女装',
      picture:'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png'
    })
    this.saleGoods=new Array(12).fill({
      "id": "1111002",
      "name": "剪出精致感，金致圆柄复古剪刀",
      "desc": "轻薄设计，简约大方",
      "price": "9.90",
      "picture": "https://yanxuan-item.nosdn.127.net/4c6a9c8a579b00e5e9c7b002d15a33a2.jpg",
      "orderNum": 172
    })
    this.hotGoods = new Array(8).fill({
      "id": "1135059",
      "name": "手工八年老陈醋500毫升",
      "desc": "地道醇香，醋酸浓郁",
      "price": "30.00",
      "picture": "https://yanxuan-item.nosdn.127.net/77da20e77b02830a26f931901ac1a9e0.png",
      "orderNum": 147
    },)
    this.oneGoods = new Array(8).fill({
      "id": "1135079",
      "name": "免浸泡，12种谷物一次同享，五谷米400克",
      "desc": "无需浸泡，同煮同熟",
      "price": "9.90",
      "picture": "https://yanxuan-item.nosdn.127.net/bfe70bd66efe94f2f18061c707d2a097.png",
      "orderNum": 144
    })
    this.newGoods = new Array(8).fill({
      "id": "4027998",
      "name": "亮碟多效合一洗涤块495g",
      "desc": "洗碗机专用，强力去污",
      "price": "69.90",
      "picture": "https://yanxuan-item.nosdn.127.net/e07c2b63765cf9f4a46d489c6e09c1c1.jpg",
      "orderNum": 643
    })

    this.recommendGoods = new Array(8).fill({
      "id": "4033959",
      "name": "3秒快速拆琴轻松保养odin奥丁12半音阶口琴",
      "price": 329,
      "picture": "https://yanxuan-item.nosdn.127.net/937a8e46a9284e8f7e00e13911ecfbe7.png",
      "payCount": 0
    })

  }
  aboutToAppear(): void {
    this.mockData()
  }

  build() {
    Scroll(){
      Column(){
        //头部 轮播图+搜索框
        Stack({alignContent:Alignment.Top}){
          //轮播图
          Swiper() {
            ForEach(this.banner,(item:Banner,index:number)=>{
              Image(item.imgUrl)
            })

          }.onChange((index: number) => {})

          // Row() 搜索框
          Row(){
            Row(){
              Image($r('[basic].media.ic_public_search')).width(20).height(20).fillColor($r('[basic].color.white'))
                .margin({left:10,right:5})
              Text('搜索...')
                .fontColor($r('[basic].color.white'))
                .fontSize(14)
            }
            .border({radius:50}) .height(30) .width('85%')
            .backgroundColor('#33191919')

          }.position({ top: 10, left: 30 })
        }.width('100%').height(260)

        // 分类
        Column(){
          List({space:10}){
            ForEach(this.categories,(item:CategoryItem,index:number)=>{
              ListItem(){
                Column(){
                  Image(item.picture)
                    .width(60)
                    .aspectRatio(1)
                  Text(item.name)
                }
                .backgroundColor('#ffece6db')
                .borderRadius(45).padding(10)
              }
            })
          }
          .listDirection(Axis.Horizontal)
        }
        .margin({top:5,bottom:5})
        .height(110)

        //特惠推荐
        Column(){
          Image($r('app.media.home_cmd_title')).width(160)
          Row(){
            Image($r('app.media.home_cmd_inner')).width(100)
              .margin({left:10,right:10})
            List({space:10}){
              ForEach(this.saleGoods,(item:HDMGoodsItem,index)=>{
                HDMDiscountGoods({goods:item})
                  .padding({top:35})
              })
            }
            .align(Alignment.Center)
            .listDirection(Axis.Horizontal)
            .scrollBar(BarState.Off)

          }
        }.width('100%')
        .height(180)
        .margin({bottom:10})
        .backgroundImage($r('app.media.home_cmd_sm'))
        .backgroundImageSize(ImageSize.Cover)
        .alignItems(HorizontalAlign.Start)

        // 爆款推荐+一站买全
        Row({ space: 10 }) {
          this.DiscountBuilder({
            title: '爆款推荐',
            subTitle: '最受欢迎',
            bg: '#EDF1FB',
            list: this.hotGoods
          })
          this.DiscountBuilder({
            title: '一站买全',
            subTitle: '精心优选',
            bg: '#FCF6EA',
            list: this.oneGoods
          })
        }

        // 新鲜好物
        Column({ space: 10 }) {
          Image($r('app.media.home_new'))
            .width(146)
            .height(19)
          List({ space: 10 }) {
            ForEach(this.newGoods, (item: HDMGoodsItem) => {
              ListItem() {
                HDMDiscountGoods({ type: DiscountType.NEW, goods: item })
              }
            })
          }
          .width('100%')
          .height(116)
          .scrollBar(BarState.Off)
          .listDirection(Axis.Horizontal)
        }
        .width('100%')
        .height(156)
        .padding(10)
        .backgroundColor('#F7EFF5')
        .borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        // 推荐商品
        WaterFlow() {
          ForEach(this.recommendGoods, (item: HDMGoodsItem) => {
            FlowItem() {
              HDMGoods({ goods: item })
            }
          })
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(8)
        .rowsGap(10)




      }.align(Alignment.Top).width('100%')
    }
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
    .width('100%')
  }

  @Builder
  DiscountBuilder(params: Params) {

    Column() {
      Row({ space: 10 }) {
        Text(params.title)
          .fontColor($r('[basic].color.black'))
          .fontSize(14)
        Text(params.subTitle)
          .fontColor($r('[basic].color.text'))
          .fontSize(11)
      }
      .width('100%')
      .margin({ bottom: 10 })

      List({ space: 10 }) {
        ForEach(params.list, (item: HDMGoodsItem) => {
          ListItem() {
            HDMDiscountGoods({ type: DiscountType.DISCOUNT, goods: item })
          }
        })
      }
      .width('100%')
      .height(116)
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)
    }
    .height(160)
    .layoutWeight(1)
    .padding(10)
    .backgroundColor(params.bg)
    .borderRadius(8)
  }



}