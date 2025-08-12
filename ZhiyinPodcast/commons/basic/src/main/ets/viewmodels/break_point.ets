// 断点枚举
export enum BreakPointEnum {
  XS='xs',
  SM='sm',
  MD='md',
  LG='lg'
}

// 封装一个工具 可以帮我们实现适配的更简单一点

interface BreakPointOption<T> {
  xs?: T
  sm?: T
  md?: T
  lg?: T
}

//1. 当实例这个类的时候 传入一个对象参数
//2. 在constructor中是否接收参数 用opt参数接收
//3.*注意* opt需要指定数据类型 object 的名字固定的xs,sm,但值的类型不固定用泛型传入
//4. 收参数就是为了赋值给一个实例属性 this.options=opt
//5. 实例属性需要先声明类型(可选 赋值初始值)
//6. getValue(breakPoint: BreakPointEnum)
// 返回 this.options[breakPoint] //断点的值'xs' 'sm' 'md' 'lg'
export class BreakPointType<T> {
  options: BreakPointOption<T> = {}

  constructor(opt: BreakPointOption<T>) {
    this.options = opt // 将传入的断点的值赋值给对象
  }

  getValue(breakPoint: BreakPointEnum): T {
    // return this.options[breakPoint]可能找到的是 undefined不符合返回类型

    return (this.options as object)[breakPoint] //这个断言不能解决问题 只是强制让ts不做类型检查

    // if (breakPoint === BreakPointEnum.XS) {
    //   return this.options.xs!
    // } else if (breakPoint === BreakPointEnum.SM) {
    //   return this.options.sm!
    // } else if (breakPoint === BreakPointEnum.MD) {
    //   return this.options.md!
    // } else {
    //   return this.options.lg!
    // }
  }
}