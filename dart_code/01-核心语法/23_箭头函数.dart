void main() {
  int res1 = sum1(100, 200);
  //
  print(res1);
}

// 思考：以下代码可以简写吗？
// sum1(a, b) {
//   return a + b; // 在使用函数时,一般用于函数体只有一行代码
// }
// 可以简写为
sum1(a, b) => a + b;
