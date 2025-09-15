//我的播放列表视图
import { HMRouter } from '@hadss/hmrouter'
import { PAGE_PATH } from 'basic'

@HMRouter({ pageUrl: PAGE_PATH.ALL_CATEGORY_PAGE })
@ComponentV2
export struct AllCategoryView {
  build() {
    Column(){
      Text('全部分类')
    }
  }
}
