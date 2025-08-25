import 'package:flutter/material.dart';


//创建一个无状态组件
class MyApp extends StatelessWidget {
  final String title = "首页";
  int? count;

//与类同名的构造函数  用于外部传入数据和参数 
//默认有可选参数 super.key 收到一key参数 并传递给父类 
//key 是当前组件的唯一标识 与lazyForeach().key()类似 在重复出现这个组件的时候
//为了修改删除等操作时区分组件 唯一性
//如果外部不传入 key 这个key默认值为null代表不了 唯一性 
  MyApp({super.key,this.count});

// build() 构建组件的方法 用于构建并渲染出组件
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1. 添加AppBar 导航
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.cyan,
      ),
      //2. 添加body
      body: Center(
        child: Text(
          "这是一个首页${count}",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 40,
            fontFamily: '宋体',
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent
          ),
        ),
      ),
      //3. 添加floatingActionButton  按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement your onPressed logic here
          // todo: 添加点击事件
          count = count! + 1;
          print(count);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}