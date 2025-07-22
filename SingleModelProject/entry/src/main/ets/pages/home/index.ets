import { ClockIn } from "../../commons/components/ClockIn"
import { SearchBox } from "../../commons/components/SearchBox"
import { CateQuestion } from "./components/CateQuestion"
import { everyDayQuestion } from "./components/everyDayQuestion"
import { HotQuestion } from "./components/HotQuestion"
import { AppStorageV2 } from "@kit.ArkUI"
import { OutArea } from "../../models"

@Preview
@ComponentV2
struct Home {
  outArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!
  @Local searchResult:string = ''
  @Local clockInNumber:number = 0
  build() {
    Column(){
      // 头部
      Row(){
        Image($r('app.media.ic_home_scan'))
          .width(25)
        SearchBox({
          searchResult:this.searchResult!!
        })
        ClockIn({
          clockInNumber:this.clockInNumber!!
        })

      }
      // .width('100%')
      .height(25)
      .padding({left: 16, right: 16})
      .margin({top: 10,bottom: 10})

      // 轮播图
      Swiper(){
        Image($r('app.media.banner_ai')).borderRadius(10)
        Image($r('app.media.banner_pj')).borderRadius(10)
        Image($r('app.media.banner_qa')).borderRadius(10)
      }.width('100%').height(150).autoPlay(true)

    //   每日一题
      everyDayQuestion()

    //   热门题目
      HotQuestion()
        .margin({bottom:5})

    //   分类题目列表
      Column(){
        CateQuestion()

      }
      .width('100%')
      .layoutWeight(1)



    }
    .width('100%')
    .height('100%')
    .padding({ top: this.outArea.topHeight, bottom: this.outArea.bottomHeight })
  }
}

export { Home }


