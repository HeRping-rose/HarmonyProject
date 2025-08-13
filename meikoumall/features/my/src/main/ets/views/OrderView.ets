import { HMRouter, HMRouterMgr } from '@hadss/hmrouter';
import { HDMNavBar, Log, OrderItem, PAGE_PATH } from 'basic';
import { getOrderAPI } from '../api';
import { OrderItemComp } from '../components/OrderItenComp';

interface TabList{
  name:string
}

@HMRouter({ pageUrl: PAGE_PATH.ORDER_PAGE })
@ComponentV2
export  struct OrderView {
  tabList:TabList[]=[{name:'全部'},{name:'待付款'}, { name: '待发货' },{name:'待收货'},{name:'待评价'}]
  // @Local orderState: 1 | 2 | 3 | 4 | 5 | 6 = 1
  @Local orderState:number=1
  @Local page:number=1
  @Local orderList:OrderItem[]=[]

  aboutToAppear(): void {
    this.getOrder()
  }

  async getOrder(){
    let res=await getOrderAPI({
      page:this.page,
      pageSize:10,
      orderState:this.orderState
    })
    this.orderList=res.items

    Log.info(res)
  }
  build() {
    Column(){
      HDMNavBar({
        title: '我的订单',
        onLeftClick: () => {
          HMRouterMgr.pop()
        }
      })

      //tabs菜单
      Tabs(){
        ForEach(this.tabList, (item:TabList, index) => {
          TabContent(){
            List(){
              ForEach(this.orderList, (item: OrderItem, index: number) => {
                //
                ListItem(){
                  OrderItemComp({ order: item })

                }

              })
            }
            .height('100%')
          }.tabBar(item.name)

        })
      }.onSelected((index)=>{
        this.orderState=index
        this.getOrder()
      })

    }

  }
}