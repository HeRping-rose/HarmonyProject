/*
[思考]：如何让子类Woman也有唱歌的方法？
[解决]：
方式1：将唱歌的方法，定义到子类Woman中（代码冗余）
方式2：将唱歌的方法，定义到父类Person中（代码扩展性不好，唱歌的方法不能被其他类复用）
方式3：使用mixin扩展一个类，扩展类中定义唱歌的方法
[mixin] 表示一个没有构造函数的类，这个类的方法可以组合到其他类中实现代码复用
[mixin] 可以同时对某个类设置多个扩展类，也可以扩展属性

mixin 混入 解决了不能多继承问题  
// 一个类需要有大量的公共方法需要引入  就可以使用mixin
 */


import './08_Mixin扩展 copy.dart';
void main() {

  //
  Teacher teacher = Teacher('小何', 18);
  teacher.eat();

}

//人的父类
class Person {
  String? name;
  int? age;
  Person({this.name, this.age});
  eat() {
    print('吃饭');
  }
}

//老师子类
class Teacher extends Person with Utils {
  Teacher(String name, int age ):super();
  
  @override
  eat() {
    print('老师在吃饭');

    this.sing(); // 调用mixin中的方法
  }
}