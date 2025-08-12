import { AppBreakPoint,
  AppCategory,
  AppSafeArea, BreakPointEnum, BreakPointType, CategoryItem, HDMGoodsItem,
  HDMLoading,
  ListDataSource,
  Log,
  PAGE_PATH,
  screenManager } from "basic"
import { HDMDiscountGoods } from "../components/HDMDiscountGoods"
import { HDMGoods } from "basic/src/main/ets/components/HDMGoods"
import { Banner, Params, RecommendParams } from "../viewmodels/home"
import { DiscountType } from "../viewmodels/home"
import { AppStorageV2, promptAction } from "@kit.ArkUI"
import { getBannerAPI, getCategoryAPI, getHomeNewAPI, getHotResultAPI, getInVogueAPI, getOneStopAPI,
  getRecommendAPI } from "../api"
import { HMRouter, HMRouterMgr } from "@hadss/hmrouter"


// @HMRouter({pageUrl:PAGE_PATH.HOME})
@ComponentV2
export  struct HomeView {
  // 用于监听屏幕宽度
  app: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!//安全区
  dataSource: ListDataSource<HDMGoodsItem> = new ListDataSource<HDMGoodsItem>() // 数据源
  @Local searchOpacity: number = 0 // 搜索透明度
  @Local totalScrollY: number = 0  // 屏幕滚动距离Y

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

  @Local page: number = 1
  @Local isFinished: boolean = false  //是否已经没有页码了
  // 触底发送请求 ,但当请求还在发送的时候，则不能发送新的请求 为true是代表正在请求  请求结束后置为false
  @Local isReachLoad: boolean = false
  @Local  isLoading: boolean = false  // 用于显示或隐藏Loading
  @Local isRefreshing: boolean = false



  // 用于模拟首页上的数据
  async mockData(){
    // this.banner=new Array(6).fill({
    //   id:'42',
    //   imgUrl:'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/nuandong_sj.png',
    //   hrfUrl:'/category/1181622006',
    //   type:'1'
    // })
    // this.categories=new Array(10).fill({
    //   id:'1181622001',
    //   name:'女装',
    //   picture:'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png'
    // })
    // this.saleGoods=new Array(12).fill({
    //   "id": "1111002",
    //   "name": "剪出精致感，金致圆柄复古剪刀",
    //   "desc": "轻薄设计，简约大方",
    //   "price": "9.90",
    //   "picture": "https://yanxuan-item.nosdn.127.net/4c6a9c8a579b00e5e9c7b002d15a33a2.jpg",
    //   "orderNum": 172
    // })
    // this.hotGoods = new Array(8).fill({
    //   "id": "1135059",
    //   "name": "手工八年老陈醋500毫升",
    //   "desc": "地道醇香，醋酸浓郁",
    //   "price": "30.00",
    //   "picture": "https://yanxuan-item.nosdn.127.net/77da20e77b02830a26f931901ac1a9e0.png",
    //   "orderNum": 147
    // },)
    // this.oneGoods = new Array(8).fill({
    //   "id": "1135079",
    //   "name": "免浸泡，12种谷物一次同享，五谷米400克",
    //   "desc": "无需浸泡，同煮同熟",
    //   "price": "9.90",
    //   "picture": "https://yanxuan-item.nosdn.127.net/bfe70bd66efe94f2f18061c707d2a097.png",
    //   "orderNum": 144
    // })
    // this.newGoods = new Array(8).fill({
    //   "id": "4027998",
    //   "name": "亮碟多效合一洗涤块495g",
    //   "desc": "洗碗机专用，强力去污",
    //   "price": "69.90",
    //   "picture": "https://yanxuan-item.nosdn.127.net/e07c2b63765cf9f4a46d489c6e09c1c1.jpg",
    //   "orderNum": 643
    // })
    // this.recommendGoods = new Array(8).fill({
    //   "id": "4033959",
    //   "name": "3秒快速拆琴轻松保养odin奥丁12半音阶口琴",
    //   "price": 329,
    //   "picture": "https://yanxuan-item.nosdn.127.net/937a8e46a9284e8f7e00e13911ecfbe7.png",
    //   "payCount": 0
    // })
  }
  async  getHomeData(flag:boolean){
    if(flag){
      this.isLoading = true
    }
    // this.banner = await getBannerAPI()
    // this.categories = await getCategoryAPI()
    // const result = await getHotResultAPI()
    // this.saleGoods = result.subTypes?.[0]?.goodsItems?.items || []
    // this.hotGoods = (await getInVogueAPI()).subTypes?.[0]?.goodsItems?.items || []
    // this.oneGoods = (await getOneStopAPI()).subTypes?.[0]?.goodsItems?.items || []
    // this.newGoods = await getHomeNewAPI()
    //一次性请求多有接口(同时发出)
    let results = await Promise.allSettled([getBannerAPI(), getCategoryAPI(), getHomeNewAPI(), getHotResultAPI(), getInVogueAPI(), getOneStopAPI()])
    // Log.info(results)
    if(results[0].status=='fulfilled'){
      this.banner = results[0].value
    }
    if(results[1].status=='fulfilled'){
      this.categories = results[1].value
      // todo 存本地缓存
      let cate=AppStorageV2.connect(AppCategory,()=>new AppCategory())!
      cate.category=results[1].value
    }
    if(results[2].status=='fulfilled'){
      this.newGoods = results[2].value
    }
    if(results[3].status=='fulfilled'){
      this.saleGoods = results[3].value.subTypes?.[0]?.goodsItems?.items || []
    }
    if(results[4].status=='fulfilled'){
      this.hotGoods = results[4].value.subTypes?.[0]?.goodsItems?.items || []
    }
    if(results[5].status=='fulfilled'){
      this.oneGoods = results[5].value.subTypes?.[0]?.goodsItems?.items || []
    }

    await this.getRecommend()

    this.isLoading=false
  }
  async getRecommend(){
    this.recommendGoods=await getRecommendAPI({limit: 8* this.page} )

    if(this.recommendGoods.length===this.page *8){
      this.page++
    }else{
      this.isFinished=true
      promptAction.openToast({message:'已全部加载'})
    }

    // this.dataSource.loadData(this.recommendGoods)
    // this.recommendGoods=list
  }

  async aboutToAppear(): Promise<void> {
    this.mockData()
    this.getHomeData(true)
    // this.getRecommend()
    await screenManager.setStatusBarColor('#ffffff')
  }

  build() {
    RelativeContainer(){
      if(this.isLoading){
        HDMLoading()
      }else {
        Refresh({refreshing:$$this.isRefreshing ,builder:this.refreshBuilder}){
          Scroll() {
            Column() {
              //头部 轮播图+搜索框
              Stack({ alignContent: Alignment.Top }) {
                //轮播图
                Swiper() {
                  ForEach(this.banner, (item: Banner, index: number) => {
                    Image(item.imgUrl)
                  })

                }

                .onChange((index: number) => {
                })
                // .displayCount(this.app.breakPoint==BreakPointEnum.SM?1:2)
                //传入各个屏幕对应的值 然后根据当前断点的值来匹配对应的值
                .displayCount(new BreakPointType({
                  sm: 1,
                  md: 2,
                  lg: 3
                }).getValue(this.app.breakPoint))
                //同理
                .itemSpace(new BreakPointType({
                  sm: 0,
                  md: 10,
                  lg: 20
                }).getValue(this.app.breakPoint))

                // .itemSpace(10)

                // Row() 搜索框
                Row() {
                  Row() {
                    Image($r('[basic].media.ic_public_search'))
                      .width(20)
                      .height(20)
                      .fillColor($r('[basic].color.white'))
                      .margin({ left: 10, right: 5 })
                    Text('搜索...')
                      .fontColor($r('[basic].color.white'))
                      .fontSize(14)
                  }
                  .border({ radius: 50 }).height(30).width('85%')
                  .backgroundColor('#33191919')
                  .onClick(() => {
                    HMRouterMgr.push({
                      pageUrl: PAGE_PATH.SEARCH_PAGE
                    })
                  })
                }
                .position({ top: 10, left: 30 })
              }
              .width('100%').height(260)
              .padding({ top: this.safeArea.topHeight })

              // 分类
              Column() {
                List({
                  space: new BreakPointType({
                    sm: 14,
                    md: 36,
                    lg: 72
                  }).getValue(this.app.breakPoint)
                }) {
                  ForEach(this.categories, (item: CategoryItem, index: number) => {
                    ListItem() {
                      Column() {
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
              .margin({ top: 5, bottom: 5 })
              .height(110)

              //特惠推荐
              Column() {
                Image($r('app.media.home_cmd_title')).width(160)
                Row() {
                  Image($r('app.media.home_cmd_inner')).width(100)
                    .margin({ left: 10, right: 10 })
                  List({ space: 10 }) {
                    ForEach(this.saleGoods, (item: HDMGoodsItem, index) => {
                      HDMDiscountGoods({ goods: item })
                        .padding({ top: 35 })
                    })
                  }
                  .align(Alignment.Center)
                  .listDirection(Axis.Horizontal)
                  .scrollBar(BarState.Off)

                }
              }
              .width('100%')
              .height(180)
              .margin({ bottom: 10 })
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
                List({
                  space: new BreakPointType({
                    sm: 14,
                    md: 36,
                    lg: 72
                  }).getValue(this.app.breakPoint)
                }) {
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
                //1.<HDMGoodsItem> 要传入什么类型数据 要传入循环中的每一项数据格式
                // 2.this.recommendGoods 参数是要循环的数据源列表
                // obj={item:xx,index:number}
                Repeat<HDMGoodsItem>(this.recommendGoods).each((obj: RepeatItem<HDMGoodsItem>) => {
                  FlowItem() {
                    HDMGoods({ goods: obj.item })
                  }
                })
                  .virtualScroll() // 虚拟滚动  类似于lazyForeach 只渲染出现在视图中的数据项(把不在视图中的数据项仅从根节点树中移除 但内存中还在 下次再显示时重新加入节点树即可)
                  .key((item: HDMGoodsItem, index: number) => {
                    return `${index}`
                  })
                /*LazyForEach(this.dataSource, (item: HDMGoodsItem) => {
                  FlowItem() {
                    HDMGoods({ goods: item })
                  }
                })*/
              }
              //嵌套滚动配置，解决瀑布流滑动冲突问题:
              .nestedScroll({
                scrollForward: NestedScrollMode.PARENT_FIRST, //父组件先滚动，父组件滚动到边缘后，子组件再滚动
                scrollBackward: NestedScrollMode.SELF_FIRST  //子组件先滚动，子组件滚动到边缘后，父组件再滚动
              })
              // .layoutWeight(1)
              .height('100%')
              .columnsTemplate(new BreakPointType({
                sm: "1fr 1fr",
                md: "1fr 1fr 1fr",
                lg: "1fr 1fr 1fr 1fr"
              }).getValue(this.app.breakPoint))
              .columnsGap(8)
              .rowsGap(10)
              // .height('100%')
              .onReachEnd(async () => {
                //1.看服务器还有没有数据了  2. 避免反复发请求  如果不是正在发请求才可以
                if (!this.isFinished && !this.isReachLoad) {
                  //发请求
                  this.isReachLoad = true
                  await this.getRecommend()
                  this.isReachLoad = false
                }

              })

            }.align(Alignment.Top).width('100%')
          }
          .scrollBar(BarState.Off)
          .align(Alignment.TopStart)
          .onDidScroll((x: number, y: number) => {
            //监听滚动  X: 这一次水平滚动距离  Y: 这一次垂直滚动距离
            // Log.info('滚动Y: '+y)
            this.totalScrollY += y
            if (this.totalScrollY > 30 + this.safeArea.topHeight) {
              this.searchOpacity = 1
            } else if (this.totalScrollY > this.safeArea.topHeight &&
              this.totalScrollY < 30 + this.safeArea.topHeight) {
              this.searchOpacity = (this.totalScrollY - this.safeArea.topHeight) / 30 //透明度0-1
            } else {
              //回滚的时候
              this.searchOpacity = 0
            }
            // Log.info('滚动Y: ' + this.totalScrollY)
          })
        }
        .onRefreshing(async ()=>{
          // 重新发送请求
          this.page = 1
          await this.getHomeData(false)
          this.isRefreshing=false
        }) //在刷新的时候要做什么
      }
      // .width('100%')

      Row() {
        Row() {
          Image($r('[basic].media.ic_public_search'))
            .width(20).height(20)
            .fillColor($r('[basic].color.white'))
            .margin({ left: 10, right: 5 })
          Text('搜索...')
            .fontColor($r('[basic].color.white'))
            .fontSize(14)
            // .backgroundColor('#fff')
            // .margin({left:0,right:16})
        }
        .border({ radius: 50 })
        .height(30).width('87%')
        .backgroundColor('#33191919')
        // .padding({left:12})
        .onClick(() => {
          HMRouterMgr.push({
            pageUrl: PAGE_PATH.SEARCH_PAGE
          })
        })
      }
      .position({left:16})
      .padding({left:16,top:this.safeArea.topHeight})
      .width('100%')
      .height(80)
      .linearGradient({
        angle:0,
        colors:[['rgba(0,0,0,0)',0.5],['rgba(0,0,0,0.5)',0]]
      })
      .opacity(this.searchOpacity)
    }
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

  @Builder
  refreshBuilder(){
    if(this.isRefreshing){
      HDMLoading()
    }else {
     Row()
    }
  }



}