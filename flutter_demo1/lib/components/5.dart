import 'package:flutter/material.dart';

class MyApp5 extends StatelessWidget {
  const MyApp5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateless Widget Demo'),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
          width: 300,
          height: 400,
          // color: const Color.fromARGB(255, 112, 152, 192),
          // margin: EdgeInsets.all(20),
          margin: EdgeInsets.only(left: 50, top: 20, right: 50, bottom: 20),
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            border: Border.all(
              color: const Color.fromARGB(255, 119, 128, 189),
              width: 5,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          // child: Image.network(
          //   'https://yanxuan-item.nosdn.127.net/e529b6ab111ade9da9314867f98d360f.png',
          //   fit: BoxFit.cover,
          // ),
          child: Image.asset(
            'qiche.png',   //图标的最大值只能是图标的实际尺寸  不然会模糊
            // fit: BoxFit.cover,
          ),
          
        ),
      ),
    );
  }
}
