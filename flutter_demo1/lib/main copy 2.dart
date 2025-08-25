import 'package:flutter/material.dart';

void main(){ 
  // runApp() 启动flutter项目的主方法
  //参数const MyApp() 是一个根组件  在启动项目时作为app的根节点
  // runApp(const MyApp());
  runApp(const Center(
    child: Text(
      "Hello World阿斯顿合法哦阿斯蒂芬哈维合法问你",
      textDirection: TextDirection.ltr, 
      style: TextStyle(
        fontSize: 40,
        fontFamily: '宋体',
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent
      ),
      ),
  )); 
}


