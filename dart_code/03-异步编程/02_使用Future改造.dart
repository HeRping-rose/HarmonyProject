import 'dart:io';

void main(List<String> args) {
  print("开始执行逻辑");
  getGoodsList().then((value) {
    print(value);
  }).catchError((error) {
    print(error.message);
  });

  // 解决阻塞问题
  print("执行逻辑完成");
}

Future getGoodsList() {
  // sleep(new Duration(seconds: 5)); // 阻塞线程5秒
  return Future(() {
    sleep(new Duration(seconds: 5));
    print("获取数据执行完成");
    // return "老高在此";
    
  });
}
