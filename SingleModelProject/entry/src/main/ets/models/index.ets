import { Context } from '@kit.AbilityKit'

class savedContext{
  context:Context

  constructor(context: Context){
  this.context=context
  }
}

@ObservedV2
class OutArea{
  @Trace topHeight:number
  @Trace bottomHeight:number
  constructor(topHeight:number,bottomHeight:number){
    this.topHeight=topHeight
    this.bottomHeight=bottomHeight
  }
}

interface TabInterface {
  icon: ResourceStr //resourse
  selectIcon: ResourceStr
  name: string
  title: string
}

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

interface QuestionListParams {
  type: number
  questionBankType: 9 | 10
  sort?: SortType
  page?: number
  pageSize?: number
}

export enum SortType {
  Default = 0,
  DifficultyLow = 10, // 先看到易 → 难
  DifficultyHigh = 11,
  ViewLow = 20, // 先看到浏览量小 → 大
  ViewHigh = 21,
  Commend = 30 //推荐
}

interface PageData<T> {
  total: number
  pageTotal: number
  rows: T[]
}
export { savedContext , OutArea , TabInterface , QuestionItem, QuestionListParams , PageData}