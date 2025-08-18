@ObservedV2
export class  MessageItem {
  id: string=''
  role: 'user'  | 'system' | 'assistant'='system'
  @Trace content: string=''   //记得内容要追踪
}


export interface LLMDataMsg {
  id: string
  role: 'user' | 'system' | 'assistant'
  content: string
}
interface StreamOpt{
  include_usage:boolean
}
// 大模型数据参数类型
export interface LLMData{
  model:string
  messages: LLMDataMsg[]
  stream:boolean  // 是否流式返回数据
  stream_options?:StreamOpt
  temperature: number  // 0-1  温度 温度越高 模型越 deterministic活泼 温度越低 模型越 stochastic严谨
}