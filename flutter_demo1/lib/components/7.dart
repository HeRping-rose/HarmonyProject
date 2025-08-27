// 弹性盒子


import 'package:flutter/material.dart';

class MyApp7 extends StatelessWidget {
  const MyApp7({super.key});

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
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          color: Color.fromARGB(255, 179, 190, 195),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 166, 128, 204),
                //flex中text能自适应   expanded布局  组件扩展  解决文字超出区域溢出的问题
                child: Text("1faweijrqoiwejrqowejroqwjerqjweorqjwierjqaiowejrqiow"),
              ),),
              Expanded(
                flex:4,
                child: Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 174, 96, 90),
              ),),
              Expanded(
                flex: 6,
                child: Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 188, 148, 146),
              ),),
              
              
            ],
          ),
),
      )
    );
  }
}