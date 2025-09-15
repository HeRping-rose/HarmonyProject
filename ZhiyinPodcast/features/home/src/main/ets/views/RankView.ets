//我的播放列表视图
import { HMRouter } from '@hadss/hmrouter'
import { PAGE_PATH } from 'basic'

@HMRouter({ pageUrl: PAGE_PATH.RANK_PAGE })
@ComponentV2
export struct RankView {
  build() {
    Column(){
      Text('排行榜')
    }
  }
}
