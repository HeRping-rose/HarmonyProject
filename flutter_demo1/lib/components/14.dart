import 'package:flutter/material.dart';

class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({super.key}); // ✅ 改成 const 构造函数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView 案例1'),
        backgroundColor: Colors.red,
      ),
      body: GridView(
        padding: const EdgeInsets.all(10), // ✅ 给 GridView 增加边距
        //根据一排宽度放几个
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // 每个子项最大宽度
          mainAxisSpacing: 10, // 主轴间距
          crossAxisSpacing: 5, // 交叉轴间距
          childAspectRatio: 4 / 3, // 宽高比
        ),
        children: const [
          GridItem(color: Colors.green, text: '内容内容1'),
          GridItem(color: Colors.pink, text: '内容2'),
          GridItem(color: Colors.blue, text: '内容3'),
          GridItem(color: Colors.yellow, text: '内容4'),
          GridItem(color: Colors.cyan, text: '内容5'),
          GridItem(color: Colors.green, text: '内容6'),
        ],
      ),
    );
  }
}

/// ✅ 抽取一个单独的子组件，代码更简洁
class GridItem extends StatelessWidget {
  final Color color;
  final String text;

  const GridItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
