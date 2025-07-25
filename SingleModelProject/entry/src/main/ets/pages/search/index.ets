import { OutArea } from "../../models"
import { AppStorageV2 } from "@kit.ArkUI"
import { SearchHistory } from "./components/SearchHistory"
import { navPathStack } from "../../commons/utils/navPathStack"
import { QuestionList } from "../../commons/components/QuestionList"
import { history } from "../../commons/utils/History"

@ComponentV2
struct SearchPage {
  @Local outArea: OutArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!
  @Local keyword: string = '' //搜索关键字
  @Local isSearch: boolean = false

  build() {
    //必须用NavDestination包裹
    NavDestination() {
      Column() {
        Row({ space: 16 }) {
          Search({ placeholder: '请输入试题关键字', value: this.keyword })
            .placeholderFont({ size: 14 })
            .height(32)
            .layoutWeight(1)
            .defaultFocus(true)
            .onSubmit(value => {
              this.keyword = value //把输入框中的关键字保存起来给 this.keyword
              if( this.keyword){
                this.isSearch = true //  显示列表
                //加入历史记录
                history.setOne(this.keyword)
              }
            })
            .onChange(value => {
              if(!value){
                this.isSearch = false
              }
            })
          Text('取消')
            .fontColor($r('app.color.black'))
            .fontSize(15)
            .fontWeight(500)
            .onClick(() => navPathStack.pop())
        }
        .height(64)
        .padding({ left: 16, right: 16 })
        .border({ width: { bottom: 0.5 }, color: $r('app.color.common_gray_border') })

        Column() {
          if (this.isSearch) {
            // TODO 试题列表
            QuestionList({
              typeID: 0,
              keyword: this.keyword
            })
          } else {
            SearchHistory({
              onSearch: keyword => {
                // TODO 进行搜索
                // 重新搜索 重新赋值
                this.keyword = keyword //回传
                this.isSearch = true // -->展示列表 并刷新
              }
            })
          }
        }
        .layoutWeight(1)
      }
      .padding({ top: this.outArea.topHeight })
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}

// 跳转页面入口函数
@Builder
export function SearchBuilder() {
  SearchPage()
}