//我的播放列表视图
import { HMRouter } from '@hadss/hmrouter'
import { PAGE_PATH } from 'basic'

@HMRouter({ pageUrl: PAGE_PATH.PODCAST_SQUARE_PAGE })
@ComponentV2
export struct PodcastSquareView {
  build() {
    Column(){
      Text('播客广场')
    }
  }
}
