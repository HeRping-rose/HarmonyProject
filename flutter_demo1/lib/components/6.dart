import 'package:flutter/material.dart';

class MyApp6 extends StatefulWidget {
  const MyApp6({super.key});

  @override
  State<MyApp6> createState() => _MyApp6State();
}

class _MyApp6State extends State<MyApp6> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful Widget Demo'),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
          width: 300,
          height: 400,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 100,
                child: Image.network('https://yanxuan-item.nosdn.127.net/72e734dd1a4d35ce650afebdaa600b57.png')
              ),
              Text("美妆效果嘎嘎不卡粉末面刷"),
              Text( '¥99.90')
            ],
          )
        ),
      ),
    );
  }
}