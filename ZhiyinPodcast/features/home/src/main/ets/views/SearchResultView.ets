import { AppBreakPoint, AppSafeArea, BreakPointType, ListDataSource, Log, PAGE_PATH } from 'basic'
import { SearchParams, SearchRouterParam, SortCompAttr, SortField, SortMethod } from '../viewmodels'

import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'
import { AppStorageV2, promptAction } from '@kit.ArkUI'
// import { HDMGoods } from 'basic/src/main/ets/components/HDMGoods'
import { getSearchResultAPI } from '../api'
import { SearchSortItem } from '../components/SearchSortItem'

export interface HDMGoodsItem {
  id: string
  name: string
  desc: string
  price: string
  picture: ResourceStr
  orderNum: number
}



@HMRouter({ pageUrl: PAGE_PATH.SEARCH_RESULT_PAGE })
@ComponentV2
export struct SearchResultView {
  breakPointClass: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  // 查询数据源
  lazyDataSource: ListDataSource<HDMGoodsItem> = new ListDataSource()
  // 查询参数
  params: SearchParams = new SearchParams() //实例化
  // 筛选条件
  sortList: SortCompAttr[] = [
    { label: '默认', field: 'publishTime' },
    { label: '专辑销量', field: 'orderNum' },
    { label: '播放数', field: 'price' }
  ]

  //搜索结果列表
  @Local list:HDMGoodsItem[]=[]

  @Local finished:boolean=false  //服务器里还有数据   // 正在加载
  @Local loading:boolean=false  //当前没有发送请求    // 是否完成
  // 控制器
  scroller = new Scroller()

  async getSearchResult(){


    // let paramsFormat: SearchParams = JSON.parse(JSON.stringify(this.params).replaceAll(/__ob_/g, ""))
    // Log.info(paramsFormat)
    // let result = await getSearchResultAPI(paramsFormat)

    let result = await getSearchResultAPI(this.params)
    Log.info(result)

    // if(this.params.page>=result.pageData.pages){
    //   // 页数大于总页数  没有数据 (完成了)
    //   this.finished=true
    // }else{
    //   this.params.page++
    // }
    //
    // this.list.push(...result.pageData.items)

  }

  onRefresh() {
    this.params.page = 1
    this.list = [] // 重新赋值为空
    this.finished = false
    this.getSearchResult()
  }

  async aboutToAppear(): Promise<void> {
    const params = HMRouterMgr.getCurrentParam() as SearchRouterParam

    // this.getUIContext().showAlertDialog({
    //   title: '关键词',
    //   message: JSON.stringify(params),
    // })
    // AlertDialog.show({ message: JSON.stringify(params) })
    this.params.keyword = params.keyword
    await this.getSearchResult()
  }

  build() {
    Column() {
      // 搜索区域
      Row() {
        Image($r('[basic].media.ic_public_left'))
          .width(24)
          .aspectRatio(1)
          .fillColor($r('[basic].color.white'))
          .margin(13)
          .onClick(() => {
            HMRouterMgr.pop()
          })
        Search({ placeholder: '搜索关键字...', value: $$this.params.keyword })
          .searchIcon({ src: $r('[basic].media.ic_public_search'), color: $r('[basic].color.gray') })
          .placeholderColor($r('[basic].color.gray'))
          .placeholderFont({ size: 14 })
          .backgroundColor($r('[basic].color.white'))
          .textFont({ size: 14 })
          .layoutWeight(1)
          .padding(0)
          .margin(0)
          .height(36)
          .caretStyle({ color: $r('[basic].color.red') })
          .onSubmit(() => {
            this.params.page = 1
            this.list = [] // 重新赋值为空
            // this.params.keyword = this.params.keyword
            this.finished = false
            this.getSearchResult()
          })
      }
      .padding({ top: this.safeArea.topHeight, right: 16 })
      .linearGradient({
        angle: 135,
        colors: [[$r('[basic].color.linear_begin'), 0], [$r('[basic].color.linear_end'), 1]]
      })

      // list
      Row() {
        ForEach(this.sortList, (item: SortCompAttr) => {
          // 筛选组件
          SearchSortItem({
            label: item.label, // 筛选条件
            field: item.field,  // 排序字段
            sortField: this.params.sortField, // 排序字段  传给子组件
            sortMethod: this.params.sortMethod, // 排序方式
            //接收子组件传递过来的排序字段和排序方式
            onSortChange: (field: SortField, method: SortMethod) => {
              this.params.sortField = field // 相当于重新加载数据 排序字段
              this.params.sortMethod = method // 排序方式
              this.onRefresh()  // 重新加载数据  重新发请求
            }
          })
        })
        // Text('筛选')
        //   .fontSize(14)
        //   .fontColor($r('[basic].color.gray'))
      }
      .padding({ left: 16, right: 16 })
      .height(50)
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .border({ width: { bottom: 0.5 }, color: $r('[basic].color.border') })

      WaterFlow({ scroller: this.scroller ,footer:this.getFootBuilder()}) {
        // LazyForEach(this.lazyDataSource, (item: HDMGoodsItem) => {
        //   FlowItem() {
        //     HDMGoods({ goods: item, smallImage: true })
        //   }
        // })
        // each:循环
        Repeat<HDMGoodsItem>(this.list).each((obj: RepeatItem<HDMGoodsItem>) => {
          FlowItem() {
            // HDMGoods({ goods: obj.item, smallImage: true })
          }
        })
          .virtualScroll() //虚拟滚动  与key配合使用 唯一key 只使用一个index也可以
          .key((item: HDMGoodsItem, index: number) => `${index}_${JSON.stringify(item)}`)

      }
      .columnsTemplate(
        new BreakPointType({
          sm: '1fr 1fr',
          md: '1fr 1fr 1fr',
          lg: '1fr 1fr 1fr 1fr'
        })
          .getValue(this.breakPointClass.breakPoint)

      )
      .columnsGap(0.5)
      .rowsGap(0.5)
      .layoutWeight(1)
      .onReachEnd(async () => {
        //当滚动到底部时触发回调   1.正在请求  2.没有数据了
        if(!this.finished&& !this.loading){
          this.loading=true  // 正在请求
          promptAction.openToast({ message: '正在加载...' })
          await this.getSearchResult()

          this.loading=false// 完成
        }
      })
    }
  }

  // 底部提示builder
  @Builder
  getFootBuilder() {
    Row({ space: 10 }) {
      if (this.loading) {
        Text("加载中...")
          .fontSize(12)
          .fontColor($r("[basic].color.gray"))
        LoadingProgress()
          .width(20)
          .aspectRatio(1)
      } else {
        if (this.finished) {
          Text("没有更多啦")
            .fontSize(12)
            .fontColor($r("[basic].color.gray"))
        }
      }
    }
    .justifyContent(FlexAlign.Center)
    .width("100%")
    .height(50)
  }
}