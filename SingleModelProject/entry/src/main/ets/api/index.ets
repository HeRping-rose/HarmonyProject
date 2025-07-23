import { httpClient } from "../commons/utils/httpClient"
import { IList } from "../models"

// 问题分类 请求 api
export const QuestionTypeApi=():Promise<IList[]>=>{
  return httpClient.request< IList[]>({
    method:'get',
    url:'question/type'
  })
}

// 问题详情  api 请求
export const QuestionDetailApi=(id:string)=>{}