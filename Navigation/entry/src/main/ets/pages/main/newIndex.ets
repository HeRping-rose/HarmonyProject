import axios, { AxiosResponse } from '@ohos/axios'
import { IData, pageStack } from './utils/utils';
import { promptAction } from '@kit.ArkUI';


@Entry
@ComponentV2
struct newIndex {
  @Local resData: IData[] = []

  async getData(){
    let res=await axios.get<IData[],AxiosResponse<IData[],null>,null>("http://jsonplaceholder.typicode.com/posts?userID=9")

    console.log(JSON.stringify(res))
    this.resData=res.data

  }
  aboutToAppear(): void {
    this.getData()
  }
  build() {
    Navigation(pageStack){
      Column({space:5}){
        Button("发表新闻").onClick(()=>{
          pageStack.pushPath({name:'publishNews'})
        })
        List(){
          ForEach(this.resData, (item:IData, index) => {
            ListItem(){
              Column({space:10}){
                Text(item.title)
                  .fontColor('#ff6e8ecb')
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .width('100%')
                Text(item.body)
                Button("删除").onClick(async ()=>{
                  let res=await axios.delete<string,AxiosResponse<string,null>,null>(`http://jsonplaceholder.typicode.com/posts/${item.id}`)
                  console.log(JSON.stringify(res))
                  if(res.status==200){
                    promptAction.openToast({ message: `新闻已删除${JSON.stringify(res, null, 2)}` })
                  }
                })
              }
              .onClick(()=>{
                pageStack.pushPath({name:'newsDetail',param:`${item.id}`})
              //   todo 刷新页面  重新渲染

              })
            }.backgroundColor('#ccc')
            .margin(10)
          })
        }

      }
      .width('100%')
      .height('100%')
    }
  }
}