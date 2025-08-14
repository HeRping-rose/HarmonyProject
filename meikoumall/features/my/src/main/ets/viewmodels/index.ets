import { OrderItem } from "basic"

export  interface LoginForm{
  account: string,
  password: string
}


@ObservedV2
export class LoginFormModel implements LoginForm{
  @Trace account:string=''
  @Trace password:string=''
  constructor(model:LoginForm){
    this.account= model.account
    this.password= model.password
  }
}

export interface loginResult{
  account: string,
  token:string,
  mobile: string,
  avatar: string,
  nickName: string,

}

export interface GetOrderParams {
  page: number
  pageSize: number
  orderState: number
}

export interface GetOrderResult {
  counts: number
  pageSize: number
  pages: number
  page: number
  items: OrderItem[]
}

export interface HuaweiLoginParams{
  clientId:string  //客户端id
  clientSecret:string  //客户端密钥
  code:string  //华为授权码
}