// 用户先登录，登录成功之后拿到token，然后再保存token到本地

// 用户先登录，登录成功之后拿到token，然后再保存token到本地

// 用户先登录，登录成功之后拿到token，然后再保存token到本地
import 'dart:io';

Future<void> main() async {
  print('开始执行main函数');

  // login().then((token) {
  //   setToken(token).then((res) {
  //     if (res == 'ok') {
  //       print('本地存储token成功, token是$token');
  //     }
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }).catchError((e) {
  //   print(e);
  // });
  var token=await login();

  var res=await setToken(token);
  if (res == 'ok') {
    print('本地存储token成功, token是$token');
  }

  print('这是不能被阻塞的代码');
}

// 1. 模拟耗时的登录操作
Future<String> login() {
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    print('假装登录成功');
    String token = '666888';
    return token;
  });
}

// 2. 模拟耗时的本地存储操作
Future<String> setToken(String token) {
  //future 异步处理
  return Future<String>(() {
    sleep(Duration(seconds: 3)); //停三秒
    print('假装本地存储token: $token');
    return 'ok';
  });
}
