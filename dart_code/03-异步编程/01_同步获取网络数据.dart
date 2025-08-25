// void main() {}
import 'dart:io';

void main(List<String> args) {
  print("开始执行逻辑");
  getGoodsList(); // 同步逻辑
  print("执行逻辑完成");
}

void getGoodsList() {
  sleep(new Duration(seconds: 5)); // 阻塞线程5秒
}