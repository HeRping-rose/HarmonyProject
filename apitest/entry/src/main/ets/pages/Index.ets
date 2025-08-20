import { addGoodsAPI, delGoodsAPI, getGoodsAPI, getNewsListAPI, GoodsList, NewsList, putGoodsAPI,
  userLoginAPI,
  userRegAPI } from '../api'
import { JSON } from '@kit.ArkTS'
import { promptAction } from '@kit.ArkUI'

@Entry
@ComponentV2
struct Index {
  @Param goodsId:number=5
  @Local list: NewsList[]  = []
  @Local GoodsList: GoodsList[] | GoodsList=[]
  @Local name: string = ''
  @Local brand: string = ''
  @Local price: string = ''
  @Local username: string = ''
  @Local password: string = ''
  @Local confirmPassword: string = ''
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

  // async getGoodsData(){
  //   return await getGoodsAPI(id:this.goodsId)
  // }

  build() {
    Column({space:10}) {
      ForEach(this.list, (item: NewsList) => {
        ListItem(){
          Row({space:5}){
            Text(item.title)
            Text(item.content)
            Text(item.id.toString())
          }
        }
      })


      //crud
      Row(){
        Button("query").onClick(async () => {
          let res =await getGoodsAPI()
          this.GoodsList=res
          promptAction.openToast({ message: JSON.stringify(res), alignment: Alignment.Center })
        })
        Button("delete").onClick(async () => {
          let res = await delGoodsAPI({ id: this.goodsId })
          promptAction.openToast({ message: JSON.stringify(res), alignment: Alignment.Center })
          // 提交后清空输入框内容

        })
        Button("update").onClick(async () => {
          let res = await putGoodsAPI({id:this.goodsId},{ name: this.name, brand: this.brand, price: this.price })
          promptAction.openToast({ message: JSON.stringify(res), alignment: Alignment.Center })
          // 提交后清空输入框内容
          this.name = ''
          this.brand = ''
          this.price = ''
        })
        Button("add").onClick(async () => {
          let res = await addGoodsAPI({name:this.name,brand:this.brand,price:this.price})
          promptAction.openToast({ message: JSON.stringify(res), alignment: Alignment.Center })
          // 提交后清空输入框内容
          this.name = ''
          this.brand = ''
          this.price = ''
        })
      }.justifyContent(FlexAlign.SpaceEvenly).width('100%')
      Column(){
        //输入id
        // 添加用于修改goodsId的输入框
        // Row() {
        //   Text("商品ID:")
        //   TextInput({
        //     placeholder: "请输入商品ID",
        //     text: this.goodsId.toString()
        //   })
        //     .onChange((value: string) => {
        //       // 将输入的字符串转换为数字并更新goodsId
        //       const id = parseInt(value) || 0;
        //       this.goodsId = id;
        //     })
        //     .type(InputType.Number) // 限制只能输入数字
        // }
        // .width('100%')
        // .padding(10)

        Button("根据id查询商品").onClick(async () => {
          let res = await getGoodsAPI({id:this.goodsId})
          this.GoodsList = res
          promptAction.openToast({ message: JSON.stringify(res), alignment: Alignment.Center })
        })
      }
      //添加数据
      Column(){
        //添加数据 通过输入框输入
        Text('添加数据')
        Row(){
          Text("请输入商品名称")
          TextInput({ placeholder: "请输入商品名称",text:$$this.name})
        }
        Row() {
          Text("请输入商品品牌")
          TextInput({ placeholder: "请输入商品品牌", text: $$this.brand })
        }
        Row() {
          Text("请输入商品价格")
          TextInput({ placeholder: "请输入商品价格", text: $$this.price })
        }
      }
      Column(){
        if (this.GoodsList == null){
          Text("GoodsList is null or undefined")
        }  // 判断this.GoodsList是否为null
        else{
          if(Array.isArray(this.GoodsList)){
            ForEach(this.GoodsList as GoodsList[], (item: GoodsList) => {
              ListItem() {
                Row({ space: 5 }) {
                  Text(item.name)
                  Text(item.logo)
                  Text(item.brand)
                  Text(item.sales.toString())
                  Text(item.stock.toString())
                  Text(item.comments.toString())
                  Text(item.desc_detail)
                  Text(item.price)
                }
              }
            })
          }else if(typeof this.GoodsList === 'object'){
            Row({ space: 5 }) {
              Text((this.GoodsList as GoodsList).name)
            }
          }else{
            Text("没有数据")
          }

        }

      }

      //简易注册接口测试
      Column(){
        Text('简易注册接口测试')
        Column() {
          Text("请输入用户名")
          TextInput({ placeholder: "请输入用户名", text: $$this.username })
          Text("请输入密码")
          TextInput({ placeholder: "请输入密码", text: $$this.password })
          Text("请输入确认密码")
          TextInput({ placeholder: "请输入确认密码", text: $$this.confirmPassword })
        }
        Button("注册").onClick(async () => {
          let res = await userRegAPI({
            username: this.username,
            password: this.password,
            confirmPassword: this.confirmPassword
          })
          promptAction.openToast({ message: this.username+this.password+this.confirmPassword, alignment: Alignment.Center  })
          promptAction.openToast({ message: JSON.stringify(res)  })

        })
      }

      //简易注册接口测试
      Column() {
        Text('简易登录接口测试')
        Column() {
          Text("请输入用户名")
          TextInput({ placeholder: "请输入用户名", text: $$this.username })
          Text("请输入密码")
          TextInput({ placeholder: "请输入密码", text: $$this.password })
          // Text("请输入确认密码")
          // TextInput({ placeholder: "请输入确认密码", text: $$this.confirmPassword })
        }

        Button("登录").onClick(async () => {
          let res = await userLoginAPI({
            username: this.username,
            password: this.password,
          })
          console.log(JSON.stringify(res))

          promptAction.openToast({ message: JSON.stringify(res) })
          // auth.set_user(res)
        // 路由跳转
        })
      }

    }
  }
}