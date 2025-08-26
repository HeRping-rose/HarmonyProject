import 'package:flutter/material.dart';

class ListViewExample1 extends StatelessWidget {
  ListViewExample1({super.key});

  //循环一个新闻列表 数据
  List<String> newsList = List.generate(20, (index) => '新闻标题 $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView 示例1'),
        backgroundColor: Colors.cyan,
      ),
      body: 
        ListView.builder(
          itemCount: newsList.length,
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
