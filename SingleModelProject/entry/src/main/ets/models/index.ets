import { Context } from '@kit.AbilityKit'
import { Type } from '@ohos.arkui.StateManagement'

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

//登录请求数据类型格式
interface  LoginParam {
  username:string
  password:string
}

// 响应返回的数据类型
@ObservedV2
export class  UserClass {
// token jwt json web token 以json字符串的形式用来验证前端登录状态的令牌
//   由三段组成 用户名 密码 过期时间
  @Trace token: string ='' //后续交互使用的token
  @Trace refreshToken: string =''//token过期后，刷新token使用
  @Trace id: string=''
  @Trace username: string=''
  @Trace avatar: string=''
  @Trace nickName: string='' //昵称
  @Trace totalTime: number=0//学习时长，单位s
  @Trace clockinNumber:number =0//连续打卡天数
}
@ObservedV2
export class  AppUser{
  @Type(UserClass) //观测这个类整体
  @Trace user:UserClass=new UserClass()
}


export { savedContext , OutArea , TabInterface , QuestionItem, QuestionListParams , PageData, LoginParam}