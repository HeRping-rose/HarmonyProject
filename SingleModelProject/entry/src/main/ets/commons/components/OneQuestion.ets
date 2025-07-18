import { Tag } from "./Tag";

interface QuestionItem {
  id: string;
  /* 题干 */
  stem: string;
  /* 难度 */
  difficulty: number;
  /* 点赞数 */
  likeCount: number;
  /* 浏览数 */
  views: number;
  /* 是否已看 */
  readFlag: 0 | 1;
}


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
    Column({space:10}){
      Row(){
        Tag()

        Text(this.item.stem).padding({left:10}).fontSize(18)
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
    .padding({left:20,right:20})
  }
}
export { OneQuestion , QuestionItem }