import { loginResult, RequestRcp } from "basic";
import { GetOrderParams, GetOrderResult, LoginFormModel } from "../viewmodels";

export const loginAPI = (data: LoginFormModel) =>{
  return RequestRcp.post<loginResult>("/login", data)
}

//获取订单api
export const getOrderAPI = (params:GetOrderParams ) =>{
  return RequestRcp.get<GetOrderResult>(`/member/order`,params)
}