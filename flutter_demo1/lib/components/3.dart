import 'package:flutter/material.dart';

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

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
          child: Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text(
              "Hello asdhfaowehfaoihweaetaeqwtawetawetawetawetataertaf",
              style: TextStyle(
                color: Color.fromARGB(255, 171, 98, 98),
                fontSize: 20,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                decorationColor: Color.fromARGB(255, 232, 172, 172),
                decorationStyle:TextDecorationStyle.dashed
              ),
          
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            
          ),
        ),
      ),
    );
  }
}
