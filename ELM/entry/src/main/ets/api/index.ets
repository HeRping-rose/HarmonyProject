import { CateMenuType, ShopListType } from "../models"
import { requestRcp } from "../utils/requestRcp"

export const getCateMenuApi =()=>{
  return requestRcp.get<CateMenuType[]>('/shop/cate/')
}
//getShopListApi
export const getShopListApi =()=>{
  return requestRcp.get<ShopListType[]>('/shop/shop/')

}