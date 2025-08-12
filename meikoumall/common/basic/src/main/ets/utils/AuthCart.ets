import { auth } from "./Auth";
import { AppStorageV2 } from "@kit.ArkUI";
import { AppCart, CartGoodsModel } from "../viewmodels";
import { getCartCountAPI, getCartListAPI } from "../api/cartApi";

export class AuthCart{
  //获取count
   getCartCount(){
    let appCart:AppCart = AppStorageV2.connect(AppCart, () => new AppCart())!
    return appCart.count
  }

  //获取count
  getCartList() {
    let appCart: AppCart = AppStorageV2.connect(AppCart, () => new AppCart())!
    return appCart.cartList
  }


  // 更新count
  async updateCartCount(){
    // 1.是否登录
    let user=auth.getUser()
    let appCart =AppStorageV2.connect(AppCart,()=>new AppCart())!
    //appCart={count:0}
    if (user.token) {
      // 获取数量
      let res=await getCartCountAPI()
      appCart.count=res.count

      //获取 购物车列表

      let result=await getCartListAPI()
      appCart.cartList=result.map(item=>new CartGoodsModel(item))

    }else {
      appCart.count=0
      appCart.cartList=[]
    }
  }

  //删除count
  deleteCartCount(){
     AppStorageV2.remove(AppCart)
  }
}

export const authCart = new AuthCart()