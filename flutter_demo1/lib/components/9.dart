import 'package:flutter/material.dart';

class GoodsOrder extends StatelessWidget {
  GoodsOrder({super.key});

  final Map goods = {
    'createTime': "2024-08-15 21:49:48",
    'orderState': 1,
    'image':
        "https://yanxuan-item.nosdn.127.net/a09de222ed32efa8ffe359b1d5780574.jpg",
    'name': "茶水分离杯耐热隔热玻璃杯茶水分离杯耐热隔热玻璃杯",
    'totalNum': 2,
    'curPrice': 119.5,
    'attrsText': "规格: 白色240ml",
  };

  String formatOrderState(int state) {
    if (state == 1) {
      return "订单已创建，等待发货";
    } else if (state == 2) {
      return "订单已发货，等待收货";
    } else {
      return "订单状态未知";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('案例 - 商品订单信息'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: const Color.fromARGB(255, 240, 240, 240),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 第一排 时间和状态
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(goods['createTime']),
                Text(
                  formatOrderState(goods['orderState']),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 97, 87, 87),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 2. 第二排 商品信息
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 图片
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(right: 10),
                  child: Image.network(goods['image'], fit: BoxFit.cover),
                ),

                // 文本区域
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 标题 + 数量
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              goods['name'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "x${goods['totalNum']}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // 规格
                      Text(
                        goods['attrsText'],
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),

                      // 单价
                      Text(
                        "￥${goods['curPrice']}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 30),

            // 3. 第三排 合计
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("合计: "),
                Text(
                  "￥${(goods['curPrice'] * goods['totalNum']).toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // 4. 再次购买 按钮
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // 处理再次购买逻辑
                },
                child: const Text("再次购买"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
