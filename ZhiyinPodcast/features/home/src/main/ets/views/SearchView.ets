import { AppSafeArea, PAGE_PATH } from 'basic'
import { AppStorageV2 } from '@kit.ArkUI'
import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'
import { CategoryRecommendation, HistorySearchItem, HotSearchItem, SmartRecommendation } from '../viewmodels'
import { HotSearchSection } from '../components/HotSearchSection'
import { HistorySearchSection } from '../components/HistorySearchSection'
import { CategoryRecommendSection } from '../components/CategoryRecommendSection'
import { SmartRecommendSection } from '../components/SmartRecommendSection'


//@HMRouter  作用 替代之前的navDestination()  参数 pageUrl是以个页面地址  用于指导其他页面跳转到当前页面是正确的
@HMRouter({ pageUrl: PAGE_PATH.SEARCH_PAGE })
@ComponentV2
export struct SearchView {
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  @Local keyword: string = ''
  // 热门搜索词推荐区域
  @Local hotSearchList: HotSearchItem[] = [
    { id: '1', keyword: '科技', searchCount: 1000 },
    { id: '2', keyword: '音乐', searchCount: 800 },
    { id: '3', keyword: '新闻', searchCount: 750 },
  // 更多热门搜索词...
  ]
  // 历史搜索记录区域
  @Local historySearchList: HistorySearchItem[] = []
  // 分类推荐区域
  @Local categoryRecommendations: CategoryRecommendation[] = []
  // 智能推荐区域
  @Local smartRecommendations: SmartRecommendation[] = []

  build() {
    Column() {
      // search
      Row() {
        //返回上一页
        Image($r('[basic].media.ic_public_left'))
          .width(24)
          .aspectRatio(1)
          .fillColor($r('[basic].color.white'))
          .margin(13)
          .onClick(() => {
            HMRouterMgr.pop() // 使用pop返回
          })
        //专用的搜索框
        Search({ placeholder: '商品关键字...', value: this.keyword })
          .searchIcon({ src: $r('app.media.ic_search'), color: $r('[basic].color.gray') })
          .placeholderColor($r('[basic].color.gray'))
          .placeholderFont({ size: 14 })
          .searchButton('搜索', { fontSize: 14, fontColor: $r('[basic].color.red') })
          .backgroundColor($r('[basic].color.white'))
          .textFont({ size: 14 })
          .layoutWeight(1)
          .padding(0)
          .margin(0)
          .height(36)
          .caretStyle({ color: $r('[basic].color.red') })
          .defaultFocus(true)
          .onSubmit((value) => {
            HMRouterMgr.push({
              pageUrl: PAGE_PATH.SEARCH_RESULT_PAGE,
              param: { keyword: value }
            })
          })
      }
      .padding({ top: this.safeArea.topHeight, right: 16 })
      .linearGradient({
        angle: 135,
        colors: [[$r('[basic].color.linear_begin'), 0], [$r('[basic].color.linear_end'), 1]]
      })

      //搜索页面默认推荐搜素结构

      // 热门搜索区域
      HotSearchSection({
        hotSearchList: this.hotSearchList
      })

      // 历史搜索区域
      HistorySearchSection({
        historyList: this.historySearchList
      })

      // 分类推荐区域
      CategoryRecommendSection({
        categories: this.categoryRecommendations
      })

      // 智能推荐区域
      SmartRecommendSection({
        recommendations: this.smartRecommendations
      })


    }
  }
}