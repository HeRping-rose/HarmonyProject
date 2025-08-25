void main() {
  Dog dog = Dog(name: '小黄', age: 2, breed: '泰迪');
  print(dog.name);
  print(dog.age);
  print(dog.breed);
  dog.bark();
  dog.eat();
  dog.run();

  Cat cat = Cat(name: '小白', age: 3, color: '白色');
  print(cat.name);
  print(cat.age);
  print(cat.color);
  cat.meow();
  cat.eat();
  cat.run();

}
//类继承
// 定义
class Animal {
  String? name;
  int? age;

  Animal({this.name, this.age});
}

class Dog extends Animal {
  String? breed;

  Dog({String? name, int? age, this.breed}) : super(name: name, age: age);

  void bark() {
    print('汪汪叫');
  }

  void eat() {
    print('狗在吃东西');
  }

  void run() {
    print('狗在跑');
  }
}
class Cat extends Animal {
  String? color;

  Cat({String? name, int? age, this.color}) : super(name: name, age: age);

  void meow() {
    print('喵喵叫');
  }

  void eat() {
    print('猫在吃东西');
  }

  void run() {
    print('猫在跑');
  }
}
