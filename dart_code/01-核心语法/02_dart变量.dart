void main() {
  // 1. 声明变量
  const a=100;
  final b=200;

  // 2. 修改变量  final 和const都不能改值
  // a=200 // 错误：const变量不能被修改
  // b=300 // 正确：final变量可以在声明时赋值，之后不能再修改

  // 3. var声明的变量支持类型推断
  // const c=a+b;  //const 在申明时只能赋值 不能通过计算去得到一个值
  final d=a+b;  //final 变量可以通过计算得到一个值
  // print(c);
  print(d);
}
