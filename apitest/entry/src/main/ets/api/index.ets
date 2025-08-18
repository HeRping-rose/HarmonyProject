import { RequestRcp } from "../utils/RequestRcp"

export interface NewsList {
  id: number,
  title: string,
  content: string
}

//请求猜你喜欢
export const getNewsListAPI = () => {
  return RequestRcp.get<NewsList[]>("/news/news_list/")
}