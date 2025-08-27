import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    //接收路由参数  上一级路由传过来的参数
    // dynamic id = ModalRoute.of(context)?.settings.arguments;
    dynamic args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: const Text('详情'), centerTitle: true),
      body: Column(
        children: [
          //商品图片
          Container(
            height: 200,
            color: Colors.grey[300],
          ),
          //结果内容
          Column(children: [Center(child: Text('搜索结果$args'))]),
        ],
      ),
    );
  }
}
