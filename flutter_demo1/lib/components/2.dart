import 'package:flutter/material.dart';

// 创建一个有状态组件  
// 创建一个名为 MyApp2 的类 继承自 StatefulWidget 作用是一个容器 本身是无状态的
class MyApp2 extends StatefulWidget {
  String? title;
  MyApp2({super.key,  this.title});
  @override
  State<MyApp2> createState(){
      // 
      print('当状态组件刚创建时调用');
    return _MyApp2State();
    } //关联
}

// 创建一个名为 _MyApp2State 的类 继承自 State<MyApp2> |形成与myapp2的关联
// 这个有状态的类 会被flutter框架单独存起来 不受外部重构的影响
class _MyApp2State extends State<MyApp2> {
  int _count = 0;  //_count 用于记录点击次数 _count 是一个私有变量 只能在本类中访问


  @override
  void initState() {
    // TODO: implement initState
    print("initState() 组件初始化");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("didChangeDependencies() 组件依赖发生变化");
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print("deactivate() 组件被移除  销毁前");
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("dispose() 组件被销毁  销毁后");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("每次重新渲染时会触发");
    return Scaffold(
      appBar: AppBar(
        //widget.title 这个widget是state类内置的一个属性 他只想当前state所关联的statefullWidget的实例 即myapp2
        //通过widget.title可以获取到myapp2传递过来的title
        title: Text("Stateful Widget${widget.title}"),
      ),
      body: Center(
        child: Text("Count: $_count"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //如果需要更新_count的值 需要调用setState方法,专用的方法
          setState(() {
            _count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}