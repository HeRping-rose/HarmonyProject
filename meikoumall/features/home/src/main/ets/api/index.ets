import { CategoryItem, HDMGoodsItem, RequestRcp } from "basic"
import { Banner, HotResult, RecommendParams } from "../viewmodels/home"

import { SearchResult, SearchParams, Goods, GoodsParams } from "../viewmodels"

//二次封装

// 获取轮播图数据banner
export const getBannerAPI=()=>{
  return RequestRcp.get<Banner[]>('/home/banner')
}

//获取分类categories请求数据
export const getCategoryAPI = () => {
  return RequestRcp.get<CategoryItem[]>("/home/category/head")
}

// 获取特惠推荐
export const getHotResultAPI = () => {
  return RequestRcp.get<HotResult>("/hot/preference")
}

// 爆款推荐
export const getInVogueAPI = () => {
  return RequestRcp.get<HotResult>("/hot/inVogue")
}

// 一站买全
export const getOneStopAPI = () => {
  return RequestRcp.get<HotResult>("/hot/oneStop")
}

// 获取新鲜好物
export const getHomeNewAPI = () => {
  return RequestRcp.get<HDMGoodsItem[]>("/home/new")
}

// 获取推荐数据
export const getRecommendAPI = (params: RecommendParams) => {
  return RequestRcp.get<HDMGoodsItem[]>("/home/recommend", params)
}

export const getSearchResultAPI = (data: SearchParams) =>
RequestRcp.post<SearchResult>("/search/all", data)


// 获取商品详情
export const getGoodsDetailAPI = (params: GoodsParams) => {
  return RequestRcp.get<Goods>("/goods", params)
}