import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView 示例'),
        backgroundColor: Colors.cyan,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,  //默认certical
        // physics: AlwaysScrollableScrollPhysics(),
        children: 
        // List.generate(100, (index) {
        //   return ListTile(
        //     title: Text('Item $index'),
        //   );
        // }),
        [
          Container(
            height: 50,
            color: const Color.fromARGB(255, 40, 117, 53),
            margin: EdgeInsets.all(10),
            child: const Center(child: Text('Item 1')),
          ),
          Container(
            height: 50,
            color: const Color.fromARGB(255, 57, 8, 65),
            margin: EdgeInsets.all(10),
            child: const Center(child: Text('Item 2')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            margin: EdgeInsets.all(10),
            child: const Center(child: Text('Item 3')),
          ),
          Container(
            height: 50,
            color: const Color.fromARGB(255, 69, 47, 79),
            margin: EdgeInsets.all(10),
            child: const Center(child: Text('Item 4')),
          ),
          Container(
            height: 50,
            color: const Color.fromARGB(255, 129, 179, 220),
            margin: EdgeInsets.all(10),
            child: const Center(child: Text('Item 5')),
          ),
          Container(
            height: 50,
            color: const Color.fromARGB(255, 40, 117, 53),
            margin: EdgeInsets.all(10),
            child: const Center(child: Text('Item 6')),
          ),
          Container(
            height: 50,
            color: const Color.fromARGB(255, 57, 8, 65),
            margin: EdgeInsets.all(10),
            child: const Center(child: Text('Item 7')),
          ),
          Container(
            height: 50,
            color: const Color.fromARGB(255, 129, 179, 220),
            margin: EdgeInsets.all(10),
            child: const Center(child: Text('Item 8')),
          ),
        ]
      ),
    );
  }
}
