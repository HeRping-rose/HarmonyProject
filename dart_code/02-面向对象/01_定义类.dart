// 需求：定义Person类，属性：名字和年龄，方法：吃饭
void main() {
  //var 会自动推断变量的数据类型
  // var person = Person('张三', 18);
  // Person person = new Person('张三', 18);

  Person person = Person('小何', 18);
  person.eat();
  print('name=${person.name}, age=${person.age}');



}
class Person {
  String name;
  int age;
  //原始写法
  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }
  
  Person(this.name, this.age);

  void eat() {
    print("$name 在吃饭");
  }
}
