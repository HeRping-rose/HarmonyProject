import { getShopListApi } from "../api";
import { ShopListType } from "../models";

@ComponentV2
export  struct ShopList {
  @Local shopList: ShopListType[] = [];

  aboutToAppear(): void {
    this.getData()
  }
  async getData() {
    let res = await getShopListApi()
    console.log('res:', JSON.stringify(res))
    this.shopList = res
  }

  build() {
    List(){

    }
  }
}