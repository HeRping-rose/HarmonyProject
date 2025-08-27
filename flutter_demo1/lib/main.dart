import 'package:flutter/material.dart';
import 'package:flutter_demo1/components/1.dart';
import 'package:flutter_demo1/components/10.dart';
import 'package:flutter_demo1/components/11.dart';
import 'package:flutter_demo1/components/12.dart';
import 'package:flutter_demo1/components/13.dart';
import 'package:flutter_demo1/components/14.dart';
import 'package:flutter_demo1/components/15.dart';
import 'package:flutter_demo1/components/2.dart';
import 'package:flutter_demo1/components/5.dart';
import 'package:flutter_demo1/components/6.dart';
import 'package:flutter_demo1/components/7.dart';
import 'package:flutter_demo1/components/8.dart';
import 'package:flutter_demo1/components/9.dart';

void main() {
  //采用MaterialApp风格
  runApp(
    MaterialApp(
      title: "Flutter Demo",
      // home: MyApp(count: 19,),
      //父组件 如果该组件会经常更新视图  在这个组件中使用到了
      // myapp2 会经常删除 重构
      // home: MyApp8(),
      home: DioDemo(),

      // home:Scaffold(
      //   //1. 添加AppBar 导航
      //   appBar: AppBar(
      //     title: Text("Flutter Title"),
      //     backgroundColor: Colors.blueGrey,
      //   ),
      //   //2. 添加body
      //   body: Center(
      //     child: Text(
      //       "主体内容",
      //       textDirection: TextDirection.ltr,
      //       style: TextStyle(
      //         fontSize: 40,
      //         fontFamily: '宋体',
      //         fontWeight: FontWeight.bold,
      //         color: Colors.blueAccent
      //       ),
      //     ),
      //   ),
      // ),
    ),
  );
}
