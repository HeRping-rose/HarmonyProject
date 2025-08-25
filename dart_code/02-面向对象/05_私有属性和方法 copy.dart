import './05_私有属性和方法.dart'  show Person;

//show xxx,xxx  只引入xxx
// hide xxx,xxx 不引入xxx

void main() {
  //私有属性和方法
  Person person = Person(name: '小何', age: 18);
  print(person.name);
  // print(person._age); // 不能访问私有属性/

}

// 类
// class Person {
//   String? name;
//   int? _age; // 变量名前面添加下滑线 私有属性只能在内部访问

//   Person({String name='小何', int? age=18}){
//     this.name = name;
//     this._age = age;
//   }
// }
