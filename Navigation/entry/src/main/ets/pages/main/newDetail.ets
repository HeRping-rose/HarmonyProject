import axios, { AxiosResponse } from '@ohos/axios'
import { IData } from './utils/utils'

@Builder
function newDetailFn(){
  newDetail()
}


@ComponentV2
struct newDetail {
  @Local newsId:string=''
  @Local newsData: IData = {id: 0, userId: 0, title: '', body: '',}
  async getData(){
    let res =
      await axios.get<IData, AxiosResponse<IData, null>, null>(`http://jsonplaceholder.typicode.com/posts/${this.newsId}`)
    this.newsData=res.data

  }
  build() {
    NavDestination(){

      Column({space:10})
      {
        Text(this.newsData.title)
          .fontColor('#ff6e8ecb')
          .fontSize(24)
          .textAlign(TextAlign.Center)
          .width('100%')
        Text(this.newsData.body)
          .width('100%')
          .padding(10)
      }



    }.onReady((context:NavDestinationContext)=>{
      console.log(JSON.stringify(context.pathInfo.param as string))
      this.newsId=context.pathInfo.param as string
      this.getData()
    })
  }
}

export { newDetailFn }