import { HDMGoodsItem, HDMSkuType, HDMSpec } from "basic";

// 其他略
export interface GoodsProperty {
  name: string;
  value: string;
}

export interface GoodsDetail {
  pictures: string[];
  properties: GoodsProperty[];
}

//
export interface Goods extends HDMGoodsItem {
  inventory: number  //库存
  mainPictures: string[]  //大图
  details: GoodsDetail //详情
  specs: HDMSpec[]  // 规格
  skus: HDMSkuType[] //sku
}

export interface HmSpecValue {
  name: string
  picture: string | null
  selected: boolean | null
  disabled: boolean | null
}

export interface GoodsParams {
  id: string  //get 需携带参数
}