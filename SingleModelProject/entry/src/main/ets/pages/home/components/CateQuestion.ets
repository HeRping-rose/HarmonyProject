import { OneQuestion } from "../../../commons/components/OneQuestion"
import { QuestionList } from "../../../commons/components/QuestionList"
import { Tag } from "../../../commons/components/Tag"

interface IList{
  id: number
  name: string
  displayNewestFlag:0|1
}

@ComponentV2
struct CateQuestion {
  @Local titleList:IList[]=[
    { id: 1, name: 'ArkTS', displayNewestFlag: 1 },
    { id: 2, name: 'ArkUI', displayNewestFlag: 1 },
    { id: 3, name: 'Hap', displayNewestFlag: 1 },
    { id: 4, name: 'Hsp', displayNewestFlag: 0 },
    { id: 5, name: 'Har', displayNewestFlag: 0 },
    { id: 6, name: 'Ability', displayNewestFlag: 0 },
    { id: 7, name: 'Stage', displayNewestFlag: 0 },
    { id: 8, name: 'Kit', displayNewestFlag: 0 }
  ]
  @Local activeIndex:number=1

  @Builder
  listItem(item:IList,index:number){
    Row({space:4}){
      Column({space:5}){
        Text(item.name)
          .fontWeight(this.activeIndex=index?300:600)
        Text()
          .height(2)
          .width(this.activeIndex==index?10:0)
          .backgroundColor('#333')
        }

      if (item.displayNewestFlag == 1) {
        Image($r('app.media.ic_home_new'))
          .width(30)
          .translate({x:3,y:-3})
      }
    }
    .padding({left:10,right:10})
  }

  build() {
    Tabs({index:$$this.activeIndex}){
      ForEach(this.titleList, (item:IList,index:number) => {
        TabContent() {
          Column(){
            // Text(item.name)
            //
            // Tag()
            // Tag({level:3})
            // Tag({level:5})
            // Tag({font:'xxxx',color:'#f09'})
            // OneQuestion()
            QuestionList()

          }
        }.tabBar(this.listItem(item,index))
      })
    }.barMode(BarMode.Scrollable)
    .divider({ color: '#ccc', strokeWidth: 1})
  }
}

export { CateQuestion }