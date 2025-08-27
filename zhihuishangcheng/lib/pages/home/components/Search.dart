import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: const Color(0xFFF1F1F1),
      padding: const EdgeInsets.all(8.0),
      //gesture手势检查器Detector
      child: GestureDetector(
        onTap: () {
          //路由参数跳转 一般会携带参数去做一些什么事
          Navigator.pushNamed(context, "/search", arguments: 123);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Icon(Icons.search, color: Colors.grey),
              ),
              //搜索框搜索上平  文字居中
              Text(
                '搜索你要找的商品',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      ),

      // child: Container(
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(20),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.withOpacity(0.2),
      //         spreadRadius: 2,
      //         blurRadius: 5,
      //         offset: Offset(0, 3),
      //       ),
      //     ],
      //   ),
      //   child: Row(
      //     children: [
      //       Padding(
      //         padding: EdgeInsets.only(left: 8, right: 8),
      //         child: Icon(Icons.search, color: Colors.grey),
      //       ),
      //       //搜索框搜索上平  文字居中
      //       Text(
      //         '搜索你要找的商品',
      //         style: TextStyle(color: Colors.grey, fontSize: 16),
      //       ),
      //     ],
      //   ),
      // ),
      // const TextField(
      //   decoration: InputDecoration(
      //     hintText: '搜索商品',
      //     prefixIcon: Icon(Icons.search),
      //     // border: OutlineInputBorder(),

      //   ),
      // ),
    );
  }
}
