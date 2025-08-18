import { getNewsListAPI, NewsList } from '../api'
import { JSON } from '@kit.ArkTS'

@Entry
@ComponentV2
struct Index {
  @Local list: NewsList[]=[]
  aboutToAppear(): void {
    this.getData()
  }

  async getData() {
    try {
      let res = await getNewsListAPI()
      console.log(JSON.stringify(res))
      this.list = res
    } catch (e) {
      console.log(JSON.stringify(e))
    }

  }

  build() {
    Column() {
      ForEach(this.list, (item: NewsList) => {
        ListItem(){
          Row({space:5}){
            Text(item.title)
            Text(item.content)
            Text(item.id.toString())
          }
        }

      })
    }
  }
}