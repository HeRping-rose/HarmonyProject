import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    //接收路由参数  上一级路由传过来的参数
    // dynamic id = ModalRoute.of(context)?.settings.arguments;
    dynamic args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: const Text('搜索'), centerTitle: true),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: '搜索',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          //结果内容
          Column(children: [Center(child: Text('搜索结果$args'))]),
        ],
      ),
    );
  }
}
