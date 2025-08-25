import { RequestRcp } from "basic"

export const userRegAPI=(data:UserRegParams)=>{
  return RequestRcp.post<UserRegResult>('/user/register/',data)
}

export const userLoginAPI = (data: UserRegParams) => {
  return RequestRcp.post<UserLoginResult>('/user/login/', data)
}

export interface UserLoginResult {
  token: string
  username: string
  phone: string
}

export interface UserRegParams {
  username: string
  password: string
  //二次确认
  confirmPassword?: string
}

// UserRegResult
// export interface UserRegResult {
//   code: number
//   message: string
//   data: UserRegData
// }

export interface UserRegResult {
  id: number
}
export interface UserRegData {
  id: number
  username: string
  token: string
}