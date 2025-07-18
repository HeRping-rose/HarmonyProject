import { OneQuestion } from "./OneQuestion"
import { promptAction } from "@kit.ArkUI"

@ComponentV2
struct QuestionList {
  @Local refreshing:boolean=false
  @Local totalPage:number=5
  build() {
    Refresh({refreshing:$$this.refreshing}){
      List({space:10}) {
        ForEach(new Array(10).fill(0), (item: number, index: number) => {
          ListItem() {
            OneQuestion()
          }
          .outline({
            style: OutlineStyle.DASHED,
            width: { bottom: 1 },
            color: '#ccc'
          })

        })
      }
      .onReachEnd(()=>{
        // 加载数据 更多
        if(this.totalPage<=0){
          promptAction.openToast({ message: "没有了" })

        }else {
          promptAction.openToast({ message: "已到达底部" })
        }
        this.totalPage--
      })
    }
    .onRefreshing(()=>{
      setTimeout(()=>{
        this.refreshing=false
        promptAction.openToast({message:"数据已刷新"})
      },1000)
    })
  }
}
export { QuestionList }