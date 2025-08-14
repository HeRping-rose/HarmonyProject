//子集
export interface HDMGoodsItem {
  id: string
  name: string
  desc: string
  price: string
  picture: ResourceStr
  orderNum: number
}

// 搜索和猜你喜欢的返回类型
export interface GoodsItems {
  counts: number;
  items: HDMGoodsItem[];
  page: number;
  pages: number;
  pageSize: number;
}

// 猜你喜欢的参数
export interface GuessParams {
  page: number // 当前页码
  pageSize: number  // 每页数量
}

export interface CategoryItem {
  children?: CategoryItemChild[]
  goods?: HDMGoodsItem[]
  id: string
  name: string
  picture: ResourceStr
}

export interface CategoryItemChild {
  id: string
  name: string
  picture: ResourceStr
}

@ObservedV2
export class AppCategory{
  // 一组数据
  @Trace category: CategoryItem[] = []

}

// 购物车单品的数据类型
export interface CartGoods {
  count: number;
  id: string;
  name: string;
  picture: string;
  price: number;
  selected: boolean;
  skuId: string;
  stock: number;
  attrsText: string;
}

@ObservedV2
export class CartGoodsModel implements CartGoods {
  @Trace
  count: number = 0
  id: string = ''
  name: string = ''
  picture: string = ''
  price: number = 0
  @Trace
  selected: boolean = false
  skuId: string = ''
  stock: number = 0
  attrsText: string = ''

  constructor(model: CartGoods) {
    this.count = model.count
    this.id = model.id
    this.name = model.name
    this.picture = model.picture
    this.price = model.price
    this.selected = model.selected
    this.skuId = model.skuId
    this.stock = model.stock
    this.attrsText = model.attrsText
  }
}

export interface AddCartParams {
  skuId: string
  count: string
}

//购物车数量
export interface CartCount {
  count: number
}

//购物车数量
@ObservedV2
export class  AppCart {
  @Trace count: number=0
  @Trace cartList: CartGoodsModel[] = []
}


// 在basic中声明请求参数的类型
export interface UpdateCartParams {
  selected: boolean
  count: number
}


export interface SelectCartParams {
  selected: boolean
}

export interface DeleteCartParams {
  ids: string[]
}


// 结算信息  (预订单)
export interface PreOrder {
  goods: OrderGoodsItem[]  // 商品
  userAddresses: AddressItem[]  // 用户地址
  summary: Summary  // 订单摘要
}
// 订单
export interface OrderGoodsItem {
  attrsText: string;  // 属性
  count: number; // 数量
  id: string;  // 商品id
  name: string;  // 商品名称
  payPrice: string;  // 订单价格(支付)
  picture: string; // 图片
  price: string;  // 商品价格
  skuId: string;   // skuId
  totalPayPrice: string;  // 总价(支付)
  totalPrice: string;   // 总价
}
// 地址
export interface AddressItem {
  address: string  // 地址
  contact: string  // 联系人
  fullLocation: string  // 地址全部信息
  id: string  // id
  isDefault: 0 | 1   // 是否默认
  receiver: string  // 收货人
  provinceCode: number  // 省
  cityCode: number  // 市
  countyCode: number //  区
}
// 摘要
export interface Summary {
  discountPrice: number;
  goodsCount: number;
  postFee: number;
  totalPayPrice: number;
  totalPrice: number;
}

// 生成订单参数
export interface CreateOrderParams {
  deliveryTimeType: number
  payType: number
  buyerMessage: string
  payChannel: number
  goods: CreateOrderParamsGoods[]
  addressId: string
}
// 创建订单商品信息
export interface CreateOrderParamsGoods {
  skuId: string
  count: number
}

// 创建订单结果
export interface CreateOrderResult {
  id: string
}
// 订单
export interface OrderItem {
  countdown: number;
  createTime: string;
  id: string;
  orderState: 1 | 2 | 3 | 4 | 5 | 6;
  payChannel: number;
  payLatestTime: string;
  payMoney: number;
  payType: number;
  postFee: number;
  skus: OrderSku[];
  totalMoney: number;
  totalNum: number;
}

// 订单 sku
export interface OrderSku {
  attrsText: string;
  curPrice: number;
  id: string;
  image: string;
  name: string;
  properties: Property[];
  quantity: number;
  realPay: number;
  spuId: string;
}

// 属性
export interface Property {
  propertyMainName: string;
  propertyValueName: string;
}


export class getContext2{
  context:Context
  constructor(ctx:Context){
    this.context=ctx
  }
}