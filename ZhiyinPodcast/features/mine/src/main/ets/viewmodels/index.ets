
export * from './break_point'

// 存储当前全局安全区的对象
@ObservedV2
export class AppSafeArea {
  @Trace
  topHeight: number = 0
  @Trace
  bottomHeight: number = 0
}

export enum BreakPointEnum {
  XS = "xs",
  SM = "sm",
  MD = 'md',
  LG = "lg"
}
@ObservedV2
export class AppBreakPoint {
  @Trace breakPoint:BreakPointEnum = BreakPointEnum.XS
}