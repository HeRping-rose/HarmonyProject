import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerSwiper extends StatelessWidget {
  BannerSwiper({super.key, required this.bannerList});

  List bannerList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      // 有一组内容(图片) 在屏幕上滚动
      items: bannerList.map((item) {
        //map更新
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              item['imgUrl'], 
              fit: BoxFit.cover, // 填充方式
            ),
          ),
        );
      }).toList(), //toList()
      // 配置轮播  自动播放  ,速度
      options: CarouselOptions(
        height: 180, // 轮播图高度
        autoPlay: true, //自动播放
        autoPlayInterval: Duration(seconds: 3), //间隔3秒
        enlargeCenterPage: true, //放大中心页,
        viewportFraction: 1, //视口比例 1表示占满  一屏占满
      ),
    );
  }
}
