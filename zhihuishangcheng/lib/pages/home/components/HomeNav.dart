import 'package:flutter/material.dart';

class HomeNav extends StatelessWidget {
  HomeNav({super.key, required this.navList});

  List navList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //网格配置(代理配置)
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // 5列
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 1, // 宽高比1:1
      ),
      itemCount: navList.length,
      shrinkWrap: true, // 收缩包裹内容  // 处理listview嵌套报错
      //组件上下文context  index  每次循环出来的哪项的索引
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                child: Image.network(navList[index]['imgUrl']),
              ),
              Text(navList[index]['text']),
            ],
          ),
        );
      },
    );
  }
}
