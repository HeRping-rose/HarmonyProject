import { http } from '@kit.NetworkKit'

interface  Result{
  msg:string
  code:number
  data:string[]

}

@Entry
@ComponentV2
struct Main2 {
  @Local jokeList: Result[]=[ {
    msg: '',
    code: 0,
    data: []
  }]
  @Local joke: string[]=["123"]
  build() {
    Column(){
      Button('获取网络数据').onClick(async ()=>{
        let instance=http.createHttp()
        let res= await instance.request(
          "https://api-vue-base.itheima.net/api/joke/list?num=10"
        )
        console.log(JSON.stringify(res))
        let res2=JSON.parse(res.result.toString()) as Result
        console.log(JSON.stringify(this.jokeList))
        this.joke=res2.data
      })
    }
  }
}