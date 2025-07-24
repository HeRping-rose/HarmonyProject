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
  stem: string; /* 题干 */
  difficulty: number; /* 难度 */
  likeCount: number; /* 点赞数 */
  views: number; /* 浏览数 */
  readFlag: 0 | 1; /* 是否已看 */
}
// QuestionDetail
export interface QuestionDetail extends QuestionItem{
  answer: string //答案
  stage: string[] //特定阶段的知识点
  collectFlag:number //收藏
  likeFlag:number //点赞
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
// token jwt json web token 以json字符串的形式用来验证前端登录状态的令牌 //   由三段组成 用户名 密码 过期时间
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

// 用户协议 隐私政策 传递参数类型
export interface webParams{
  title:string
  url:string
}

@ObservedV2
export class Agreement{
  @Trace title:string=''
  @Trace url:string=''
  @Trace toBottom1: boolean = false
  @Trace toBottom2: boolean = false
}
export  interface IList{
  id: number
  name: string
  displayNewestFlag:0|1
}

export interface questionOptParam{
  id: string
  type: 0|1
  optType: 1|2
}

@ObservedV2
export  class JumpInfoClass{
  idList:string[]=[]
  @Trace activeIndex:number=0
  ListLength:number=0
}


// 响应返回的数据类型
@ObservedV2
export class QuestionLocalItem {
  id: string= '';
  stem: string=''; /* 题干 */
  difficulty: number=0; /* 难度 */
  likeCount: number=0; /* 点赞数 */
  views: number=0; /* 浏览数 */
  readFlag: 0 | 1=0; /* 是否已看 */
  answer: string =''//答案
  stage: string[] =[]//特定阶段的知识点
  collectFlag: number =0//收藏
  likeFlag: number =0//点赞
}

@ObservedV2
export class QuestionLocalClass {
  @Type(QuestionLocalItem) //观测这个类整体
  @Trace question : QuestionLocalItem = new QuestionLocalItem()
}


export { savedContext , OutArea , TabInterface , QuestionItem, QuestionListParams , PageData, LoginParam}