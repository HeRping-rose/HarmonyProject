import { RequestRcp } from "basic"

export const userRegAPI=(data:UserRegParams)=>{
  return RequestRcp.post<UserRegResult>('/user/reg',data)
}
export interface UserRegParams {
  username: string
  password: string
  //二次确认
  confirmPassword: string
}

// UserRegResult
export interface UserRegResult {
  code: number
  message: string
  data: UserRegData
}
export interface UserRegData {
  id: number
  username: string
  token: string
}