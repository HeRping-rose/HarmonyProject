import { SongItemType } from "."

// 联合类型  时间 销量 价格
export type SortField = 'publishTime' | 'orderNum' | 'price' // 排序字段

export type SortMethod = 'desc' | 'asc' // 排序方式  降序 升序

// 提交给服务器的参数
// 提交给服务器的参数
@ObservedV2
export class SearchParams {
  @Trace
  keyword: string = "" // 搜索关键字
  @Trace
  sortField: SortField = "publishTime" // 排序字段
  @Trace
  sortMethod: SortMethod = "desc" // 排序方式
  page: number = 1 // 当前页码
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
  pageData: SongItemType
}


// 热门搜索词数据结构
export  interface HotSearchItem {
  id: string;
  keyword: string;
  searchCount: number; // 搜索频率
  category?: string; // 所属分类（可选）
}

// 历史搜索记录数据结构
export interface HistorySearchItem {
  id: string;
  keyword: string;
  timestamp: number; // 搜索时间戳
}

// 分类推荐数据结构
export interface CategoryRecommendation {
  categoryId: string;
  categoryName: string;
  keywords: string[]; // 该分类下的推荐关键词
}

// 智能推荐数据结构
export interface SmartRecommendation {
  id: string;
  keyword: string;
  relevanceScore: number; // 相关性评分
  reason: string; // 推荐理由
}

