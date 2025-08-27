import 'package:flutter/material.dart';
import 'package:zhihuishangcheng/pages/home/components/AdBanner.dart';
import 'package:zhihuishangcheng/pages/home/components/BannerSwiper.dart';
import 'package:zhihuishangcheng/pages/home/components/HomeNav.dart';
import 'package:zhihuishangcheng/pages/home/components/Search.dart';
import 'package:dio/dio.dart';
import 'package:zhihuishangcheng/pages/home/components/home_shop_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map resData = {};
  List bannerList = [];
  List navList = [];
  List adList = [];
  List goodsList = [];

  // 组件初始化完成时去请求数据
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  Future<void> getData() async {
    // TODO: implement getData
    print('Fetching data...');
    Dio dio = Dio(); // 创建 Dio 实例
    String path = 'http://smart-shop.itheima.net/index.php?s=/api/page/detail';
    Response res = await dio.get(path);
    // print(res.data['data']['pageData']);
    resData = res.data['data']['pageData'];

    setState(() {
      bannerList = resData['items'][1]['data'];
      navList = resData['items'][3]['data'];
      print(navList);
      adList = resData['items'][4]['data'];
      goodsList = resData['items'][6]['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('智慧商城', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 187, 56, 41),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //搜索栏
          HomeSearch(),

          //轮播图
          BannerSwiper(bannerList: bannerList),

          //导航菜单
          HomeNav(navList: navList),

          //广告栏目
          AdBanner(adList: adList),

          //猜你喜欢标题
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '猜你喜欢',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // 猜你喜欢商品列表
          HomeShopList(goodsList: goodsList),
        ],
      ),
    );
  }
}
