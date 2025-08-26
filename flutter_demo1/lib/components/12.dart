import 'package:flutter/material.dart';

class ListViewExample2 extends StatelessWidget {
  ListViewExample2({super.key});

  //循环一个新闻列表 数据
  List<String> newsList = List.generate(20, (index) => '新闻 $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView 示例1'),
        backgroundColor: Colors.cyan,
      ),
      body: 
        ListView.separated(
          //列表项数量
          itemCount: newsList.length,
          //分隔符构建器
          separatorBuilder: (context, index) {
            return Divider(
              color: index.isEven
                  ? const Color.fromARGB(255, 40, 117, 53)
                  : const Color.fromARGB(255, 162, 119, 168),
              height: 1,
            );
          },
          //列表项构建器
          itemBuilder: (context, index) {
            return Container(
              height: newsList[index].length > 6 ? 70 : 50,
              color: index.isEven
                  ? const Color.fromARGB(255, 40, 117, 53)
                  : const Color.fromARGB(255, 162, 119, 168),
              margin: EdgeInsets.all(10),
              child: Center(child: Text(newsList[index])),
            );
          },
        ),
    
    );
  }
}
