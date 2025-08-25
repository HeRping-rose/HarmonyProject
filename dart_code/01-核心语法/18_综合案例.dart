// 需求：计算购物车数据中，被勾选商品的总价
void main() {
  // 准备购物车数据
  List carts = [
    {"count": 2, "price": 10.0, "selected": true},
    {"count": 1, "price": 30.0, "selected": false},
    {"count": 5, "price": 20.0, "selected": true}
  ];
  double totalPrice = 0.0;
  for (var item in carts) {
    if (item["selected"]) {
      totalPrice += item["count"] * item["price"];
    }
  }
  print('被勾选商品的总价是：$totalPrice');

// fold 操作 直接算总价

double totalPrice2 = carts.fold(0.0, (previousValue, item) {
  if (item["selected"]) {
    return previousValue + item["count"] * item["price"];
  }
  return previousValue;
});
print('被勾选商品的总价是：$totalPrice2');

}
