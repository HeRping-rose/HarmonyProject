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

