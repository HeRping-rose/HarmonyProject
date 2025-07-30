import { Context } from '@kit.AbilityKit'
import { Type } from '@ohos.arkui.StateManagement'
import { ValuesBucket } from '@kit.ArkData'

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
  keyword?: string
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
  @Trace clockinNumber?:number =0//连续打卡天数
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
// 在 models 文件中添加
export class CurrentQuestionId {
  id: string = '';

  constructor(id: string = '') {
    this.id = id;
  }
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

//统计学习时长埋点 数据类型
export interface  TrackingItem{
  questionId:string,
  startTime: number
  endTime:number
}

export interface  TrackingArray {
  timeList:TrackingItem []
}

export interface ClockInParams{
  month:string,
  year:string
}

export interface ClockInResItem {
  id: string;
  createdAt: string;
}
// 打卡返回数据类型
export interface ClockInRes {
  clockinNumbers: number;//连续签到天数
  clockins: ClockInResItem[];//签到信息
  flag: boolean; //当天是否签到
  totalClockinNumber: number; //累计签到天数

}
export interface wordItem{
  en:string,
  zh:string,
  down:number,
  code?:string
}

// 音频数据 类型
export  interface AudioItem extends ValuesBucket {
  id: number | null // 主键
  user_id: string, //用户id
  name: string, //音频名称
  path: string, // 音频路径
  duration: number, //总时长
  size: number, // 音频质量大小
  create_time: number // 创建时间
}
// 别名 不确定对象中的key  Record<> 指定该类型的值是一个对象
// 属性名是字符串 属性值是wordItem[]
export type WordType=Record<string,wordItem[]>

export { savedContext , OutArea , TabInterface , QuestionItem, QuestionListParams , PageData, LoginParam}