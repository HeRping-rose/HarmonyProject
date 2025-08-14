import { AppUser, loginResult, RequestRcp, User } from "basic";
import { GetOrderParams, GetOrderResult, HuaweiLoginParams, LoginFormModel } from "../viewmodels";

export const loginAPI = (data: LoginFormModel) =>{
  return RequestRcp.post<loginResult>("/login", data)
}

//获取订单api
export const getOrderAPI = (params:GetOrderParams ) =>{
  return RequestRcp.get<GetOrderResult>(`/member/order`,params)
}

//携带code给 应用服务器  让他向华为去解析出用户要的用户信息 就可以在服务器中创建一个新的用户

//以此来达到 用户注册的目的

export const getHuaweiLoginAPI = (data: HuaweiLoginParams) =>{
  //这里的返回值就是服务器已经创建好的那个新用户
  return RequestRcp.post<User>("/login/huawei", data)
}