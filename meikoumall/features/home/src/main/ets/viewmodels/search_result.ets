import { GoodsItems } from "."

// 联合类型
export type SortField = 'publishTime' | 'orderNum' | 'price'  // 排序字段

export type SortMethod = 'desc' | 'asc' // 排序方式

// 提交给服务器的参数
// 提交给服务器的参数
@ObservedV2
export class SearchParams {
  @Trace
  keyword: string = ""   // 搜索关键字
  @Trace
  sortField: SortField = "publishTime" // 排序字段
  @Trace
  sortMethod: SortMethod = "desc"  // 排序方式
  page: number = 1  // 当前页码
  pageSize: number = 10 // 每页数量
}

// 筛选条件
export interface SortCompAttr {
  field: SortField
  label: string
}


// 路由参数
export interface SearchRouterParam {
  keyword: string
}


// 定义搜索结果类型
export interface SearchResult {
  // conditions:
  pageData: GoodsItems
}