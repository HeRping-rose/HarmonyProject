import axios, { AxiosResponse } from "@ohos/axios"
/*
 *
 *
 * */

interface IData{
  msg: string,
  code: number,
  data: string[]
}


@Entry
@ComponentV2
struct AxiosStudy {

  @Local resData: string[] = []

  async  getData(){
  //   https://api-vue-base.itheima.net/api/joke/list?num=10
  // get请求  第一个参数 用于验证 这一次get请求后服务器返回给我返回数据 (最终要的数据时data
  //   第二个参数 用于验证码这一次请求后服务器返回给我返回【总】数据 验证是否符合格式
  //   第二个参数中的第二个参数 null用于在发送请求时修改请求头（携带数据
  //   参数三 用于验证这个请求要发送给的服务器的数据
    let res= await axios.get<IData,AxiosResponse<IData,null>,null>("https://api-vue-base.itheima.net/api/joke/list?num=10")
    console.log(JSON.stringify( res.data))
    this.resData = res.data.data //定义一个数接收data中的data
    console.log(JSON.stringify( this.resData))
  }

  aboutToAppear(): void {
    this.getData()
  }


  build() {
    Column({space:5}){
      this.head()
    //   渲染res中的data中的data
      List({space:10}){
        ForEach(this.resData, (item:string, index) => {
          ListItem(){
            Column({space:10}){
              Text(item.slice(0, 10)+"...").fontSize(20).width('100%')
                .fontWeight(FontWeight.Bold)
              Row(){
                Row(){
                  Image($r('app.media.ic_public_read')).width(20)
                  Text('xxxx')
                }
                Row() {
                  Image($r('app.media.ic_public_read')).width(20)
                  Text('xxxx')
                }
              }.width('100%')
              .justifyContent(FlexAlign.SpaceEvenly)
              .margin(10)
              Text(item)
                .margin({bottom:10})
            }
          }.backgroundColor('#ccc')
          .borderRadius(10)
        })
      }
    }
    .width('100%')
    .height('100%')
    .padding({left: 10, right: 10})
  }

  @Builder
  head() {
    Row() {
      Image($r('app.media.ic_public_comments')).width(25)
      Image($r('app.media.ic_public_joke_logo')).width(25)
      Image($r('app.media.ic_public_drawer_filled')).width(25)
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .border({
      width: { bottom: 1 },
      color: Color.Red
    })

  }
}

