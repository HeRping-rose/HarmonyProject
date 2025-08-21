void main() {
  // 前端 鸿蒙 类型注解 username: string = "张三"
  // flutter 类似java写法 String a = "11"
  // 数字类型 num(整数 + 小数) int(整数) double(小数)
  num price = 23; // 声明一个价格的变量
  print(price);
  price = ((price * 10) * (1.4 * 10)) / 100; // 处理进度
  print(price);

  // int 只能是整数
  int index = 0;
  while (index < 10) {
    print(index);
    index++;
  }
  // double带精度的数字
  double good_price = 19.99;
  print(good_price);

  // double不能给int赋值
  // int也不可以double赋值
  // double可以给num赋值
  // num不能给double赋值
  // int可以给num赋值
  price = good_price;
  print(price);

  // 如果确定是整数 用int 比如索引 比如数量
  // 如果是价格类的数据 用 double
  // 都用num不好，num占的空间更大，占了整数和小数的空间
}