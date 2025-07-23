import { OneQuestion } from "./OneQuestion"
import { promptAction } from "@kit.ArkUI"
import { PageData, QuestionItem, QuestionListParams, SortType } from "../../models"
import { httpClient } from "../utils/httpClient"
import { navPathStack } from "../utils/navPathStack"

@ComponentV2
struct QuestionList {
  @Local refreshing:boolean=false
  @Local totalPage:number=5
  @Local questionList: QuestionItem[]=[]
  @Local page:number=1
  @Local isFinish:boolean=false
  @Param typeID: number = 447
  @Param activeIndex: number = 0
  @Param index: number = 0
  @Param overSort:SortType= SortType.Default  //观察overSort变了没有 变了才更新视图
  @Monitor('overSort')
  overSortChange(){
    if(this.activeIndex==this.index){
      this.refreshing = true
    }
  }
  // 封装请求接口方法  只要成功返回的是 Promise<T>  T= <PageData<QuestionItem>>返回成功的结果数据类型
   getData(): Promise<PageData<QuestionItem>>{
   return  httpClient.request<PageData<QuestionItem>>({
      url: 'question/list',
      params: {
        type: this.typeID, //id从447才有数据
        questionBankType: 10, //10 表示题库
        sort: this.overSort, //默认排序  传入的sort
        page: this.page,
        pageSize: 8
      } as QuestionListParams
    })
  }

  // 获取题目数据  不用第一次就刷新
  // async getList(){
  //   let res=await this.getData()
  //   // this.questionList=res.rows  //赋值列表数据
  //   console.log(JSON.stringify(res))
  // }
  // aboutToAppear(): void {
  //   this.getList()
  // }

  // 完成到底了继续加载
  async  onLoad(){
    let res = await this.getData()
    console.log(JSON.stringify(res))
    this.questionList.push(...res.rows)
    if(this.page>=res.pageTotal){
      this.isFinish=true
      // promptAction.openToast({ message: "没有了" })
    }else {
      this.page++ // 页数加1
    }
  }

  // 下拉刷新
  async onRefreshing() {
    this.page=1
    let res = await this.getData()
    console.log(JSON.stringify(res))
    // this.questionList.unshift(...res.rows)
    this.questionList=res.rows
    this.refreshing=false
  }

  build() {
    Refresh({refreshing:$$this.refreshing}){
      List({space:10}) {
        ForEach(this.questionList, (item: QuestionItem, index: number) => {
          ListItem() {
            //单个列表组件 一道题目  传Id给详情页
            OneQuestion({ item: item })
              .onClick(()=>{
                navPathStack.pushPath({
                  name:'question',
                  param:item.id
                })
              })
          }
          .outline({
            style: OutlineStyle.DASHED,
            width: { bottom: 1 },
            color: '#ccc'
          })
        })
      }
      // 列表触底事件  子容器高度比父容器高 会触发  触发一次
      .onReachEnd(()=>{
        if(this.isFinish){
            promptAction.openToast({ message: "没有了" })
        }else {
          this.onLoad()
          promptAction.openToast({ message: "加载完成" })
        }
        // 加载数据 更多
        // if(this.totalPage<=0){
        //   promptAction.openToast({ message: "没有了" })
        // }else {
        //   promptAction.openToast({ message: "已到达底部" })
        // }
        // this.totalPage--
      })
    }
    .onRefreshing(()=>{
      setTimeout(()=>{
        // this.refreshing=false
        // promptAction.openToast({message:"数据已刷新"})
        this.onRefreshing()
      },1000)
    })
  }
}
export { QuestionList }