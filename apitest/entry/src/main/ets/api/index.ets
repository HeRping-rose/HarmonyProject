import { RequestRcp } from "../utils/RequestRcp"

export interface NewsList {
  id: number,
  title: string,
  content: string
}

//请求猜你喜欢
export const getNewsListAPI = () => {
  return RequestRcp.get<NewsList[]>("/news/news_list/")
}

export const getGoodsAPI = (params?: GoodsId) => {
  return RequestRcp.get<GoodsList[] | GoodsList>("/shop/goods/",params)
}

export const addGoodsAPI = (data: GoodsPostParams) => {
  return RequestRcp.post<GoodsId>("/shop/goods/", data)
}


//put修改商品
export const putGoodsAPI = (params: GoodsId,data: GoodsPostParams) => {
  return RequestRcp.put<GoodsId>("/shop/goods/", params,data)
}

//put修改商品
export const delGoodsAPI = (params: GoodsId) => {
  return RequestRcp.delete<GoodsId>("/shop/goods/", params)
}

export interface GoodsList {
  id: number,
  name: string,
  logo: string,
  brand: string,
  sales: number,
  stock: number,
  comments: number,
  desc_detail: string,
  price: string,
}

export interface GoodsId{
  id:number
}

export interface GoodsPostParams{
  name:string,
  brand:string,
  price:string
}


export const userRegAPI = (data: UserRegParams) => {
  return RequestRcp.post<GoodsId>('/user/register/', data)
}

export interface UserRegParams {
  username: string
  password: string
  //二次确认
  confirmPassword?: string
}

export const userLoginAPI = (data: UserRegParams) => {
  return RequestRcp.post<UserLoginResult>('/user/login/', data)
}
export interface UserLoginResult {
  token: string
  username: string
  phone: string
}
