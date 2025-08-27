import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioDemo extends StatefulWidget {
  const DioDemo({super.key});

  @override
  State<DioDemo> createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  @override
  void initState() {
    // 获取订单列表数据
    loadData();
    super.initState();
  }

  List goods = [];

  // 演示dio插件的基本使用
  void loadData() async {
    // 1. 准备请求地址
    String path =
        'https://smart-shop.itheima.net/index.php?s=/api/page/detail&pageId=0';

    // 2. 创建http client
    Dio dio = Dio();

    // 3. 发送网络请求，得到响应
    Response response = await dio.get(path);
    // 4. 提取订单列表数据
    // print(response.data);
    // List list = response.data['data']['data']['productList'];
    print(response.data['data']['pageData']['items'][6]['data']);

    setState(() {
      goods = response.data['data']['pageData']['items'][6]['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio插件'),
        backgroundColor: const Color.fromARGB(255, 54, 244, 244),
      ),
      body: Container(),
    );
  }
}
