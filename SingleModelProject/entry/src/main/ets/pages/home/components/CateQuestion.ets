import { OneQuestion } from "../../../commons/components/OneQuestion"
import { QuestionList } from "../../../commons/components/QuestionList"
import { skeletonBox } from "../../../commons/components/skeletonBox"
import { skeletonItem } from "../../../commons/components/skeletonItem"
import { Tag } from "../../../commons/components/Tag"
import { httpClient } from "../../../commons/utils/httpClient"
import { IList, SortType } from "../../../models"
import { FilterButton } from "./FilterButton"
import emitter from "@ohos.events.emitter"
import { QuestionTypeApi } from "../../../api"

// interface IList{
//   id: number
//   name: string
//   displayNewestFlag:0|1
// }

@ComponentV2
struct CateQuestion {
  @Local titleList:IList[]=[
    // { id: 1, name: 'ArkTS', displayNewestFlag: 1 },
    // { id: 2, name: 'ArkUI', displayNewestFlag: 1 },
  ]
  @Local isShow:boolean=false
  @Local tempIndex:number=0
  @Local tempSort:SortType=SortType.Default //临时排序
  @Local overSort:SortType=SortType.Default //最终排序
  viewsArr: SortType[] = [SortType.ViewLow, SortType.ViewHigh]
  difficultyArr: SortType[] = [SortType.DifficultyLow, SortType.DifficultyHigh]
  @Local isLoading:boolean=false

  //  获取分类 列表
  async getCate(){
    //res=res.data.data
    try {
      this.isLoading=true
      // let res = await httpClient.request<IList[]>({
      //   // method:'get', 默认是get 可以不用写
      //   url: 'question/type'
      // })
      let  res=await QuestionTypeApi()
      this.titleList = res //真数据列表

      this.isLoading=false
      console.log(JSON.stringify(res))
    }catch (e) {
      //请求失败返回  401
      console.log(e)
    }
  }
  aboutToAppear(): void {
    this.getCate()
    //事件发布
    emitter.on('refresh',()=>{
    //   回调
      this.getCate()
    })
  }
  @Local activeIndex:number=0 //默认索引从0开始

  clickSort(arr: SortType[]) {
    let index = arr.findIndex(item => item === this.tempSort)
    if (index === -1) {
      this.tempSort = arr[0]
    } else {
      this.tempSort = arr[index === 0 ? 1 : 0]
    }
  }

  @Builder
  listItem(item:IList,index:number){
    Row({space:4}){
      Column({space:5}){
        Text(item.name)
          .fontWeight(this.activeIndex==index?600:300)
        Text()
          .height(2)
          .width(this.activeIndex==index?10:0)
          .backgroundColor('#333')
        }
        // .margin(item.name==="性能优化"?{right:30}:{right:0})
      .padding({
        right: index === this.titleList.length - 1 ? 30 : 0
      })

      if (item.displayNewestFlag == 1) {
        Image($r('app.media.ic_home_new'))
          .width(30)
          .translate({x:3,y:-3})
      }
    }
    .padding({left:10,right:10})
  }

  //bindSheetBuilder
  @Builder
  showPopUp(){
    Column() {
      Row() {
        Text('重置')
          .fontSize(16)
          .fontWeight(500)
          .fontColor($r('app.color.common_gray_03'))
          .onClick(()=>{
            this.tempIndex=0
            this.tempSort=SortType.Default
            this.isShow = false
          })
        Text('筛选题目')
          .layoutWeight(1)
          .fontSize(18)
          .fontWeight(500)
          .fontColor($r('app.color.black'))
          .textAlign(TextAlign.Center)
        Text('完成')
          .fontWeight(500)
          .fontSize(16)
          .fontColor($r('app.color.common_main_color'))
          .onClick(() => {
            this.activeIndex=this.tempIndex
            this.overSort=this.tempSort
            this.isShow=false
          })
      }
      .margin({ bottom: 4, top: 4 })

      Text('题目排序')
        .textTitle()
      Flex({ wrap: FlexWrap.Wrap }) {
        FilterButton({
          text: '默认' ,
          isSelect:this.tempSort==SortType.Default})
          .onClick(() => {
            this.tempSort=SortType.Default
          })
        FilterButton({
          text: '浏览量',
          isSort: true ,
          isSelect:this.viewsArr.includes(this.tempSort),
          sort: this.tempSort
        })
          .onClick(() => {
            this.clickSort(this.viewsArr)
          })
        FilterButton({
          text: '难度',
          isSort: true ,
          isSelect: this.difficultyArr.includes(this.tempSort),
          sort: this.tempSort
        })
          .onClick(() => {
            this.clickSort(this.difficultyArr)
          })
        FilterButton({ text: '推荐' , isSelect: this.tempSort == SortType.Commend})
          .onClick(() => {
            this.tempSort=SortType.Commend
          })
      }

      Text('选择分类')
        .textTitle()
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.titleList, (item: IList,index:number) => {
          FilterButton({
            text: item.name,
            isNew: item.displayNewestFlag === 1,
            isSelect: this.tempIndex == index,
          })
            .onClick(() => {
              this.tempIndex = index
            })
        })
      }
    }
    .padding(16)
    .backgroundColor($r('app.color.white'))
    .height('100%')
  }

  //骨架结构
  @Builder
  skeletonBuilder(){
    skeletonBox(){
      Column({space:10}){
        Row({ space: 20 }) {
          skeletonItem({ widthValue: 100 })
          skeletonItem({ widthValue: 100 })
          skeletonItem({ widthValue: 100 })
        }.width('100%')
        .justifyContent(FlexAlign.Center)

        ForEach([1, 2, 3, 4, 5], (item: number) => {
          Column({ space: 10 }) {
            skeletonItem({ widthValue: '45%' })
            skeletonItem({ widthValue: '85%' })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
        })
      }
    }
  }

  build() {
    if(this.isLoading){
      this.skeletonBuilder()
    }else {
      Stack({ alignContent: Alignment.TopEnd }) {
        Tabs({ index: $$this.activeIndex }) {
          ForEach(this.titleList, (item: IList, index: number) => {
            TabContent() {
              Column() {
                // Text(item.name)
                //
                // Tag()
                // Tag({level:3})
                // Tag({level:5})
                // Tag({font:'xxxx',color:'#f09'})
                // OneQuestion()
                // 问题列表
                QuestionList({
                  typeID: item.id,
                  overSort: this.overSort,
                  activeIndex: this.activeIndex,
                  index: index
                })
              }
            }.tabBar(this.listItem(item, index)) //builder
          })
        }.barMode(BarMode.Scrollable)
        .divider({ color: '#ccc', strokeWidth: 1 })
        .barHeight(40)
        .onTabBarClick((index: number) => {
          this.activeIndex = index //点击切换index
        })

        //图标 模态框
        Row() {
          Image($r('app.media.ic_home_filter'))
            .width(24)
            .aspectRatio(1)
        }
        .height(31)
        .backgroundColor('#fff')
        .bindSheet(this.isShow, this.showPopUp(), { height: '45%', showClose: false })
        .onClick(() => {
          this.isShow = true //显示模态框
          this.tempIndex = this.activeIndex //临时索引 当前索引赋值给模态框的临时索引
        })
      }
    }
  }
}

@Extend(Text)
function textTitle() {
  .fontSize(14)
  .fontWeight(500)
  .fontColor($r('app.color.black'))
  .width('100%')
  .margin({ top: 20 })
}

export { CateQuestion }