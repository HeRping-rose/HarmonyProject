void main() {
  int n1 = 10;
  int n2 = 3;

  // 加 +
  print(n1 + n2); // 13

  // 减 -
  print(n1 - n2); // 7

  // 乘 *
  print(n1 * n2); // 30

  // 除 /
  print(n1 / n2); // 3.3333333333333335

  // 取整：取除法结果的整数部分 ~/
  print(n1 ~/ n2); // 3

  // 取模：取除法结果的余数 %
  print(n1 % n2); // 1

  // 案例：计算购物车商品总价格：商品A一件，每件289.0元；商品B二件，每件39.0元
  double priceA = 289.0;
  double priceB = 39.0;
  int countA = 1;
  int countB = 2;
  double totalPrice = priceA * countA + priceB * countB;
  print('购物车商品总价格：$totalPrice 元');  // 购物车商品总价格：367.0 元
}
