import axios, { AxiosResponse } from '@ohos/axios'
import { promptAction } from '@kit.ArkUI';
import { pageStack } from './utils/utils';

interface Inews {
  userID: number;
  title: string;
  body: string;
}

@Builder
function publishNewsFn(){
  publishNews()
}

@ComponentV2
struct publishNews {
  @Local title: string = ''
  @Local body: string = ''

  build() {
    NavDestination(){
      Column({space:10}){
        Text("发布新闻")
        TextInput({text:$$this.title})
        TextInput({text:$$this.body})

        Button('立即发布').onClick(async ()=>{
          let res = await axios.post<string,AxiosResponse<string,null>,Inews>('http://jsonplaceholder.typicode.com/posts',
            {
              userID:1,
              title: this.title,
              body: this.body
            }
            )
          if(res.status==201){

            promptAction.openToast({message:`添加成功 新闻为${JSON.stringify(res.data,null,2)}`})
            pageStack.pop()
          }
          console.log(JSON.stringify(res))
        })
      }
      .width('100%')
      .height('100%')
    }
  }
}