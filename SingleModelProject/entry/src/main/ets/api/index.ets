import { httpClient } from "../commons/utils/httpClient"
import { IList, LoginParam, PageData, QuestionItem, QuestionListParams, UserClass } from "../models"

// 问题分类 请求 api
export const QuestionTypeApi=():Promise<IList[]>=>{
  return httpClient.request< IList[]>({
    method:'get',
    url:'question/type'
  })
}

// 问答列表
export const apiGetQuesList = (params: QuestionListParams): Promise<PageData<QuestionItem>> => {
  return httpClient.request<PageData<QuestionItem>>({
    method: 'get',
    url: 'question/list',
    params: params
  })
}

// 登录
export const apiLogin = (username: string, password: string): Promise<UserClass> => {
  return httpClient.request<UserClass, LoginParam>({
    method: 'post',
    url: 'login',
    data: {
      username,
      password
    }
  })
}

// 问题详情  api 请求
export const QuestionDetailApi=(id:string)=>{}