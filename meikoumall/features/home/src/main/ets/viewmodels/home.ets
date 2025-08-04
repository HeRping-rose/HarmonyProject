import { HDMGoodsItem } from "basic";

export interface Banner {
  id: string;
  imgUrl: string;
  type: string;
}

export interface Params {
  title: string,
  subTitle: string,
  bg: ResourceStr,
  list: HDMGoodsItem[]
}

export enum DiscountType {
  COMMAND,
  DISCOUNT,
  NEW
}
