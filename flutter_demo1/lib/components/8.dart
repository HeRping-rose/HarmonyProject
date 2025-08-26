// 堆叠布局


import 'package:flutter/material.dart';

class MyApp8 extends StatelessWidget {
  const MyApp8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateless Widget Demo'),
          backgroundColor: Colors.cyan,
        ),
        body: Container(width: 100, height: 100, color: Colors.red,
          child: Stack(
            // alignment: Alignment.bottomRight,
            alignment: AlignmentDirectional.center,
            fit: StackFit.loose,  //子集的宽高撑满父组件  loose原始  expand 撑满
            clipBehavior: Clip.none, //裁剪方式  沿着边裁剪
            children: [
              Container(width: 90, height: 90, color: Colors.yellow,),
              Container(width: 80, height: 80, color: Colors.blue,
  ),
              Container(width: 70, height: 70, color: Colors.green,),
              Container(width: 60, height: 60, color: Colors.orange,),
              Positioned(
                top: -105,
                child: Image.asset('assets/open_eyes.png')
              ),

            ]
          ),
        )
      )
    );
  }
}