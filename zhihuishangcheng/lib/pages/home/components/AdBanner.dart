import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  List adList;

  AdBanner({super.key, required this.adList});

  @override
  Widget build(BuildContext context) {
    if (adList.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Image.network(adList[0]['imgUrl'], fit: BoxFit.cover),
      );
    } else {
      //如果是空就返回空组件
      return Container();
    }
  }
}
