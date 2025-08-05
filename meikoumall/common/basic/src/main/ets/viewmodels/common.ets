import { BreakPointEnum } from "./break_point"

@ObservedV2
export class AppBreakPoint {
  //AppStorage 中存储断点名类型
  @Trace breakPoint:BreakPointEnum=BreakPointEnum.SM
}

// 存储当前全局安全区的对象
@ObservedV2
export class AppSafeArea {
  @Trace
  topHeight: number = 0
  @Trace
  bottomHeight: number = 0
}

// 接口返回数据结构  定义统一的返回结构体
export interface ResponseData<T> {
  code: string
  msg: string
  result: T
}