void main() {
  //私有属性和方法
  Person person = Person(name: '小何', age: 18);
  print(person.name);
  print(person._age); // 不能访问私有属性/
  person._run();

}

// 类
class Person {
  String? name;
  int? _age; // 变量名前面添加下滑线 私有属性只能在内部访问

  Person({String name='小何', int? age=18}){
    this.name = name;
    this._age = age;
  }

//私有方法   不让外部访问
  _run() {
    print('姓名：$name');
    print('年龄：$_age');
  }

  //在dart中 一个.dart文件就是一个库/模块
  // 在一个库中都有独立的环境
  // 不同库中的同名类互不影响
  // 可以通过导入来使用其他库中的类
  // dart中一个库中的变量函数 类都是可见的 (外部主要引入这个库) 库中公开的都是可见=的
}
