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