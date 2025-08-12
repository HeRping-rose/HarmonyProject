export enum BreakPointEnum {
  XS = "xs",
  SM = "sm",
  MD = "md",
  LG = "lg"
}
// 封装一个工具 可以帮我们实现适配的更简单一点
interface BreakPointOption<T> {
  xs?: T
  sm?: T
  md?: T
  lg?: T
}
//1. 类 当实例这个类时，需要传入一个对象参数
//2. 在constructor是不是要接收参数，用叫opt接收了它
//3.*注意* opt需要指定数据类型 的名字固定的 xs sm..但值的类型不固定用泛型传入
//4. 收参数不就是为了赋值给一个实例属性this.options = opt
//5. 实例属性需要先，声明类型(可选：赋值初始值) options: BreakPointOption<T> = {}
//6. 在这个类中还实现了一个getValue方法，它接收一个参数是breakPoint
// this.options = {
//   sm: 1,
//   md: 2,
//   lg: 3
//  }
//7. 返回 this.options["md"]  2
export class BreakPointType<T> {
  options: BreakPointOption<T> = {}
  constructor(opt: BreakPointOption<T>) {
    this.options = opt // 将传入的断点的值赋值给对象
  }
  getValue(breakPoint: BreakPointEnum): T {
    //问题：如果this.options[breakPoint] 可能找到的是undefined不符合返回类型
    //(this.options as object) 这个断言根本不能解决问题，强制让ts不做类型检查
    return (this.options as object)[breakPoint]
  }
}