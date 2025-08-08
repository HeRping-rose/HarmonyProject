import { loginResult, RequestRcp } from "basic";
import { LoginFormModel } from "../viewmodels";

export const loginAPI = (data: LoginFormModel) =>{
  return RequestRcp.post<loginResult>("/login", data)
}
