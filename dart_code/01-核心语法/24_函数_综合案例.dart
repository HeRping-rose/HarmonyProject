void main() {
  // 准备购物车数据
  List carts = [
    {"count": 2, "price": 10.0, "selected": true},
    {"count": 1, "price": 30.0, "selected": false},
    {"count": 5, "price": 20.0, "selected": true}
  ];

  //全选  写一个函数  当调用这个函数 都变为true
  // void selectAll(List carts) {
  //   for (var item in carts) {
  //     item["selected"] = true;
  //   }
  // }
  //可不可以改写为箭头函数
  void selectAll(List carts) => carts.forEach((item) => item["selected"] = true);

//map方法
  

  // 使用
  selectAll(carts);

  print(carts);
}
