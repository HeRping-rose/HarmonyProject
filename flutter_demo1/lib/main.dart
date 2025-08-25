

import 'package:flutter/material.dart';
import 'package:flutter_demo1/components/1.dart';
import 'package:flutter_demo1/components/2.dart';
import 'package:flutter_demo1/components/5.dart';

void main(){
  //采用MaterialApp风格
  runApp(MaterialApp(
    title: "Flutter Demo",
    // home: MyApp(count: 19,),  
    //父组件 如果该组件会经常更新视图  在这个组件中使用到了
    // myapp2 会经常删除 重构
    home: MyApp5(),
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

  ));
}


