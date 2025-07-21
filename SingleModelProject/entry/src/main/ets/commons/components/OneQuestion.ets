import { QuestionItem } from "../../models";
import { Tag } from "./Tag";



// 自定义单个列表详情组件
@ComponentV2
struct OneQuestion {
  @Param item: QuestionItem={
    id: '1',
    stem: '这是什么组件',
    difficulty: 1,
    likeCount: 999,
    views: 9999,
    readFlag: 1
  }
  build() {
    Column({space:5}){
      Row(){
        // 自定义标签组件
        Tag({ level:this.item.difficulty})
        Text(this.item.stem).padding({left:10}).fontSize(18)
          .layoutWeight(1)
          .maxLines(1)
          .textOverflow({overflow: TextOverflow.Ellipsis})
      }
      RowSplit(){
        Text(`点赞：${this.item.likeCount} `).padding({ left: 10, right: 10 })
        Text(`浏览：${this.item.views} `).padding({ left: 10, right: 10 })
        if(this.item.readFlag){
          Text(`已看过`).padding({ left: 10, right: 10 })
        }
      }

    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({left:20,right:20,top:5,bottom:5})
  }
}
export { OneQuestion  }