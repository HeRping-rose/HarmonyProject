void main() {
// 0. 正常代码
  String name = '张三';
  String intro = '大家好，我是$name';

  print(intro);

// 1. 无法正常执行的代码：在代码编译期就会报错
  String? nullName;
  String nullIntro = '大家好，我是$nullName';  // 报错
  print(nullIntro);

// 2. 解决办法：使用 ? 显示的指定变量可以为空
  String? nullIntro1 = '大家好，我是${nullName ?? "未知"}';
  print(nullIntro1);
// 3. 使用可以为空的变量
// 如果intro没有值则返回null, 有值则返回正常的结果
  // String? intro = '大家好，我是$name';
  String? nullIntro2 = '大家好，我是${nullName ?? "未知"}';
  print(nullIntro2);
}
