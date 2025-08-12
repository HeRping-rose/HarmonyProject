import { RequestRcp } from "../utils/RequestRcp"
import { CartGoodsModel, GoodsItems } from "../viewmodels"

export const getGuessDataAPI = (params: object) => {
  return RequestRcp.get<GoodsItems>('/home/goods/guessLike', params)
}


