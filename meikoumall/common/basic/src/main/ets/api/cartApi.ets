import { RequestRcp } from "../utils/RequestRcp"
import { AddCartParams, CartCount, CartGoodsModel,
  CreateOrderParams,
  CreateOrderResult,
  DeleteCartParams,
  PreOrder,
  SelectCartParams, UpdateCartParams } from "../viewmodels"

// 获取购物车列表
export const getCartListAPI = () => {
  return RequestRcp.get<CartGoodsModel[]>('/member/cart')
}


//加入购物车
export const addCartAPI = (params: AddCartParams) => {
  return RequestRcp.post<null>('/member/cart', params)
}

//购物车数量
export const getCartCountAPI = () => {
  return RequestRcp.get<CartCount>('/member/cart/count')
  // AppStorage
}


//封装更新商品的API
export const updateCartAPI =
  (skuId: string, data: UpdateCartParams) => RequestRcp.put<null>(`/member/cart/${skuId}`, data)

//封装全选或者取消全选API
export const selectOrUnSelectAPI = (data: SelectCartParams) => RequestRcp.put<null>("/member/cart/selected", data)

export const delCartAPI = (data: DeleteCartParams) =>{
  RequestRcp.delete<null>("/member/cart", undefined, data)
}

//获取订单预览信息
export const  getPreOrderAPI= ()=>{
  return RequestRcp.get<PreOrder>(`/member/order/pre`)
}

//创建订单  CreateOrderParams请求携带的参数   CreateOrderResult返回结果是一个id
export const createOrderAPI = (data: CreateOrderParams) => {
  return RequestRcp.post<CreateOrderResult>('/member/order', data)
}