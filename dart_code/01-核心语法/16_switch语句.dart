void main() {
  // 根据订单状态，打印出订单状态描述信息
  // 订单状态：1为待付款、2为待发货、3为待收货、4为待评价
  int orderState = 3;
  switch (orderState) {
    case 1:
      print('待付款');
      break;
    case 2:
      print('待发货');
      break;
    case 3:
      print('待收货');
      break;
    case 4:
      print('待评价');
      break;
    default:
      print('订单状态异常');
  }
}
