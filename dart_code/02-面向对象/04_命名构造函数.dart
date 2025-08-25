void main() {
  //命名构造函数
  Person person = Person('小何', 18);
  Person person2 = Person.withNameAndAge({'name': '小平', 'age': 19});
  Person person3 = Person.empty();

  print(person.name);
  print(person2.name);
  print(person3.name);
  //eat
  person.eat();
  person2.eat();
  person3.eat();
}

//可以以不同形式传参

class Person {
  String? name;
  int? age;

  Person(String name, int age) {
    this.name = name;
    this.age = age;
  }
  // 命名构造函数
  //Map<String, dynamic> 指定数据类型 参数:字典 要求属性时字符串 dynamic 任意类型
  Person.withNameAndAge(Map<String, dynamic> data) {
    name = data['name'];  //省略了this关键字 自动推断
    age = data['age'];
    print("使用命名构造函数创建对象: $name, $age");
  }
  //默认不传参数
  Person.empty({String? name='未知', int? age=0}) {
    this.name = name; //如果省略this关键字 会null
    this.age = age;
  }
  // Person.empty() {
  //   name = "未知";
  //   age = 0;
  // }

  void eat() {
    // var name ='ron'; //局部变量
    print("$name 在吃饭"); ///有冲突会就近访问 ,没有冲突则会推断为this.name
  }
}
