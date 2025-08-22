### 六、类（面向对象编程）

#### 6.1 类的定义

需求：定义Person类，属性：名字和年龄，方法：吃饭

```dart
void main() {
  People p = new People();
  p.age = 30;
  p.name = "张三";
  p.say();
}

/*****
 * 
 * export class People {
  username: string = ""
  constrcutor (name: string) {
    this.username = name
  }
  say () {}
  run () {}
}
 * ****/

// 声明一个类
class People {
  String? name;
  int? age;

  say() {
    print('我是$name,今年$age');
  }
}
```

存在问题: 我们new一个对象时, 不能直接给对象绑定属性?

答案: 借助构造函数



#### 6.2 构造函数

##### 6.2.1 默认构造函数

无参数，默认隐藏

```dart
void main() {
  Person p = Person("小张", 24, "女");
  Person p1 = Person("老高", 35, "男");
  p.say();
  p1.say();
}

class Person {
  String? name;
  int? age;
  String? sex;

  // 构造函数 两种写法 简写  一种完整写法
  // 构造函数名称和类名一样
  // Person(String? name, int? age, String? sex) {
  //   this.age = age;
  //   this.name = name;
  //   this.sex = sex;
  // }
  // 简写的写法
  Person(this.name, this.age, this.sex);

  say() {
    print('我是$name,今年$age,我是$sex');
  }
}
```



##### 6.2.2 自定义与类同名构造函数

自定义与类同名的构造函数时，可以有参数

注意点：与类同名的构造函数只能有一个，如果自定义了该类名构造函数，那么默认的构造函数就失效

```dart
void main() {
  // 如果构造函数的参数用大括号包裹起来，传递的时候不需要按照顺序，传key value就可以了
  Person p = Person(name: "小张", sex: "女", age: 32);
  Person p1 = Person(sex: '外星人', name: "老高", age: 35);
  p.say();
  p1.say();
}

class Person {
  String? name;
  int? age;
  String? sex;

  // 构造函数 两种写法 简写  一种完整写法
  // 构造函数名称和类名一样
  // Person({String? name, int? age, String? sex}) {
  //   this.age = age;
  //   this.name = name;
  //   this.sex = sex;
  // }
  // 简写的写法
  Person({this.name, this.age, this.sex});

  say() {
    print('我是$name,今年$age,我是$sex');
  }
}
```



##### 6.2.3 命名构造函数

实际开发中,  经常会发现这么一种写法: `类名.方法(参数...)`, 然后返回一个实例化对象,  这种写法在Dart中被称为命名构造函数

```dart
void main() {
  // 正常的 new的方式构造的
  SubTabBarStyle sub = new SubTabBarStyle(color: 'red', width: 20);
  sub.run();

  // 静态的方式进行实例化对象
  SubTabBarStyle sub1 = SubTabBarStyle.of(color: 'blue', width: 30);
  sub1.run();
}

// 前端鸿蒙 Tabs组件-滚动跟随

class SubTabBarStyle {
  String? color; // 颜色和宽度
  double? width;
  SubTabBarStyle({this.color, this.width});
  // 别名构造函数 完整版本写法
  // SubTabBarStyle.of({String? color, double? width}) {
  //   this.color = color;
  //   this.width = width;
  // }
  // 别名构造函数 简写写法
  SubTabBarStyle.of({this.color, this.width});

  run() {
    print('颜色:$color, 宽度:$width');
  }
}
```



#### 6.3 私有属性和方法

flutter中没有public和private

flutter中的属性和方法只要加上下划线，就是私有属性

公有属性和方法：供类自身或者其他外部文件和类使用的属性和方法

私有属性和方法：仅供自身使用的属性和方法，其他外部文件和类无法访问

```dart
// 单独放到其他文件
// 解耦模式的弹层
class HDMDialogHelper {
  String? _ctx; // 私有属性
  init(String ctx) {
    this._ctx = ctx;
  }

  // 获取window对象
  _getWin() {}
}
// flutter中的私有属性用下划线开头就是私有
```

其他dart文件中使用：`28-类-私有属性和方法2-使用.dart`

```dart
import 'HDMDialogHelper.dart';

void main() {
  HDMDialogHelper helper = HDMDialogHelper();
  helper.init("上下文");
}
```



#### 6.4 继承（extends）

前端鸿蒙 

implements-实现并继承-需要我们自己去实现

extends-直接继承，不写东西是可以的

- [思考]：如下定义的的两个类`Man`和`Woman`是否有重复的部分，是否可以优化？

定义三个类 

- 人
- 老师
- 学生

```dart
void main() {
  Person p = Person(name: "王皓");
  p.eat();

  // 直接用Teacher类声明
  Teacher t = Teacher(name: '马龙');
  t.eat();

  Student s = Student(name: "小趴菜");
  s.work();
}

class Person {
  String? name;
  int? age;
  String? sex;
  double? height;
  double? weight;
  String? hobby;

  //  同名
  Person({this.name, this.age, this.sex, this.hobby, this.height, this.weight});

  eat() {
    print('$name在吃饭');
  }

  sleep() {
    print('$name在睡觉');
  }

  run() {
    print('$name在跑步');
  }

  work() {
    print('$name在工作');
  }
}

// Teacher
class Teacher extends Person {
  // 继承父类构造函数
  // super 当前的父类构造函数对象
  Teacher(
      {String? name,
      int? age,
      String? sex,
      double? height,
      String? hobby,
      double? weight})
      : super(
            name: name, age: age, height: height, hobby: hobby, weight: weight);

  // 两部 第一步 接收teacher传递过来的参数
  // 调用父类的构造函数 把值传递过去
  @override
  eat() {
    // TODO: implement eat
    // return super.eat();
    print("老子叫$name, 老在喝早茶");
  }
}

// Student
class Student extends Person {
  Student(
      {String? name,
      int? age,
      String? sex,
      double? height,
      String? hobby,
      double? weight})
      : super(
            name: name, age: age, height: height, hobby: hobby, weight: weight);
  @override
  work() {
    // TODO: implement work
    super.work(); // 执行父类的方法
    print("$name工作完摸鱼"); // 执行自己的方法
  }
}
```

- 使用继承优化代码：继承的基本使用

[思考]：如下定义的的两个类Man和Woman是否有重复的部分，是否可以优化？

[解决]：定义父类`Person`，用于封装公共的属性和方法，`Man`和`Woman`类作为子类去继承父类`Person`的属性和方法

```dart
void main() {
  // 创建男人对象
  Man man = Man('李雷', 13);
  print(man.name);
  man.eat();

  // 创建女人对象
  Woman woman = Woman('韩梅梅', 14);
  print(woman.name);
  woman.eat();
}

/// 人类：父类
class Person {
  Person(this.name, this.age);

  String? name;
  int? age;

  void eat() {
    print('$name -- eat');
  }
}

/// 男人类：子类
class Man extends Person {
  // 定义子类构造函数
  // Man(String name, int age) : super(name, age);
  Man(super.name, super.age);
}

/// 女人类：子类
class Woman extends Person {
  // 定义子类构造函数
  Woman(super.name, super.age);
}
```

- 提示：子类中可以重写父类的方法

```dart
void main() {
  // 创建男人对象
  Man man = Man('李雷', 13);
  print(man.name);
  man.eat();

  // 创建女人对象
  Woman woman = Woman('韩梅梅', 14);
  print(woman.name);
  woman.eat();
}

/// 人类：父类
class Person {
  Person(this.name, this.age);

  String? name;
  int? age;

  void eat() {
    print('$name -- eat');
  }
}

/// 男人类：子类
class Man extends Person {
  // 定义子类构造函数
  // Man(String name, int age) : super(name, age);
  Man(super.name, super.age);

  // 提示：子类中可以重写父类的方法，执行子类自己的逻辑
  @override
  void eat() {
    print('我是$name，我爱吃肉');
  }
}

/// 女人类：子类
class Woman extends Person {
  // 定义子类构造函数
  Woman(super.name, super.age);

  // 提示：子类中可以重写父类的方法，执行子类自己的逻辑
  @override
  void eat() {
    print('我是$name，我爱吃蔬菜');
  }
}
```



#### 6.5 混入（mixin、with）

Vue2

mixins-混入工具

老师类 都需要一个方法 放假-混入类的方法

学生类 都需要一个方法 放假-混入类的方法

- [思考]：以下代码如何让子类`Woman`也有唱歌的方法？

```dart
void main() {
  Teacher t = Teacher(name: "老高");
  Student s = Student(name: "张三");
  t.eat();
  s.work();
}

class Person {
  String? name;
  int? age;
  String? sex;
  double? height;
  double? weight;
  String? hobby;

  //  同名
  Person({this.name, this.age, this.sex, this.hobby, this.height, this.weight});

  eat() {
    print('$name在吃饭');
  }

  sleep() {
    print('$name在睡觉');
  }

  run() {
    print('$name在跑步');
  }

  work() {
    print('$name在工作');
  }
}

// Teacher
class Teacher extends Person with PersonUtils, HomeUtils {
  // 继承父类构造函数
  // super 当前的父类构造函数对象
  Teacher(
      {String? name,
      int? age,
      String? sex,
      double? height,
      String? hobby,
      double? weight})
      : super(
            name: name, age: age, height: height, hobby: hobby, weight: weight);

  // 两部 第一步 接收teacher传递过来的参数
  // 调用父类的构造函数 把值传递过去
  @override
  eat() {
    // TODO: implement eat
    // return super.eat();
    print("老子叫$name, 老在喝早茶");
    this.getVaction(this.name!);
    this.doHouseWork(this.name!);
  }
}

// Student with混入mixin类 就可以直接调用方法
class Student extends Person with PersonUtils, HomeUtils {
  Student(
      {String? name,
      int? age,
      String? sex,
      double? height,
      String? hobby,
      double? weight})
      : super(
            name: name, age: age, height: height, hobby: hobby, weight: weight);
  @override
  work() {
    // TODO: implement work
    super.work(); // 执行父类的方法
    print("$name工作完摸鱼"); // 执行自己的方法
    this.getVaction(this.name!);
    this.doHouseWork(this.name!);
  }
}

// 此时都需要一个放假的方法，又不想直接影响基类

mixin PersonUtils {
  // 混入工具
  getVaction(String name) {
    print('$name在放假');
  }
}

mixin HomeUtils {
  // 混入工具
  doHouseWork(String name) {
    print('$name在做家务');
  }
}
```

- 使用Mixin扩展优化代码：Mixin扩展的基本使用

[思考]：如何让子类`Woman`也有唱歌的方法？

[解决]：

方式1：将唱歌的方法，定义到子类Woman中（代码冗余）

方式2：将唱歌的方法，定义到父类Person中（代码扩展性不好，唱歌的方法不能被其他类复用）

方式3：使用mixin扩展一个类，扩展类中定义唱歌的方法

[mixin] 表示一个没有构造函数的类，这个类的方法可以组合到其他类中实现代码复用

[mixin] 可以同时对某个类设置多个扩展类，也可以扩展属性

### 七、异步编程

#### 7.1 Dart是单线程的

##### 7.1.1 程序中的耗时操作

###### 开发中的耗时操作

- 在开发中，我们经常会遇到一些耗时的操作需要完成，比如网络请求、文件读取等等；
- 如果我们的主线程一直在等待这些耗时的操作完成，那么就会进行阻塞，无法响应其它事件，比如用户的点击；
- 显然，我们不能这么干！！

###### 如何处理耗时的操作呢？

- 针对如何处理耗时的操作，不同的语言有不同的处理方式。
- **处理方式一：** 多线程，比如Java、C++、鸿蒙中，我们普遍的做法是开启一个新的线程（Thread），在新的线程中完成这些异步的操作，再通过线程间通信的方式，将拿到的数据传递给主线程。
- **处理方式二：** 单线程+事件循环，比如JavaScript、Dart都是基于单线程加事件循环来完成耗时操作的处理。

接下来, 我们一起来看看在Dart中如何去处理一些耗时的操作吧!

#### 7.2 Future

##### 7.2.1 同步网络请求

我们先来看一个例子吧：

- 在这个例子中，我使用getNetworkData来模拟了一个网络请求；
- 该网络请求需要5秒钟的时间，之后返回数据；

```dart
import 'dart:io';

void main(List<String> args) {
  print("开始执行逻辑");
  getGoodsList(); // 同步逻辑
  print("执行逻辑完成");
}

void getGoodsList() {
  sleep(new Duration(seconds: 5)); // 阻塞线程5秒
}
```

这段代码会运行怎么的结果呢？

- getGoodsList会阻塞main函数的执行

```dart
开始执行main函数
// 等待5秒  
返回的网络数据
这是不能被阻塞的代码
```

显然，上面的代码不是我们想要的执行效果，因为网络请求阻塞了main函数，那么意味着其后所有的代码都无法正常的继续执行。

前端鸿蒙的做法是 return new Promise() 或者是标记函数为async异步函数

##### 7.2.2 Future基本使用

我们来对上面的代码进行改进，代码如下：

- 和刚才的代码唯一的区别在于使用了Future对象来将耗时的操作放在了其中传入的函数中；
- 稍后，我们会讲解它具体的一些API，我们就暂时知道我创建了一个Future实例即可；

```dart
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
    throw new Exception("异常啦");
  });
}
```

我们来看一下代码的运行结果：

- 这一次的代码顺序执行，没有出现任何的阻塞现象；
- 和之前直接打印结果不同，这次我们打印了一个Future实例；
- 结论：我们将一个耗时的操作隔离了起来，这个操作不会再影响我们的主线程执行了。

- 问题：我们如何去拿到最终的结果呢？

```dart
开始执行main函数
Instance of 'Future<String>'
这是不能被阻塞的代码
```



##### 7.2.3 Future链式调用

有了Future之后，如何去获取请求到的结果：通过.then的回调

```dart
import 'dart:io';

void main() {
  print("开始执行逻辑");
  // 1. 回调地狱 极其不推荐的写法 不专业的写法
  // getFirstData().then((value1) {
  //   print("第一层结果:$value1");
  //   getSecondData().then((value2) {
  //     print("第二层结果:$value2");
  //     getThirdData().then((value3) {
  //       print("第三层结果:$value3");
  //     });
  //   });
  // });
  // 2. 采用真正的链式调用实现异步请求
  getFirstData().then((value) {
    print(value);
    return getSecondData();
  }).then((value) {
    print(value);
    return getThirdData();
  }).then((value) {
    print(value);
  });
}
// 前端 鸿蒙 的promise的链式调用

/***
 *  pending fullfiled rejected
 *  Future Uncompleted Completed with a value Completed with a error
 *  new Promise((resolve, reject) => {
 *     resolve(1)
 *   }).then(() => new Promise())
 *   .then(() => new Promise())
 *   .then(() => new Promise())
 *   .catch()
 *   .finally()
 * 
 * 
 * 
 * ****/

Future getFirstData() {
  return Future(() {
    sleep(Duration(seconds: 2));
    print("获取第一层数据成功");
    return 1;
  });
}

Future getSecondData() {
  return Future(() {
    sleep(Duration(seconds: 2));
    print("获取第二层数据成功");
    return 2;
  });
}

Future getThirdData() {
  return Future(() {
    sleep(Duration(seconds: 2));
    print("获取第三层数据成功");
    return 3;
  });
}
```

上面代码的执行结果：

```dart
开始执行main函数
这是不能被阻塞的代码
// 3s后执行下面的代码  
返回的网络数据
```



**执行中出现异常**

如果调用过程中出现了异常，拿不到结果，如何获取到异常的信息呢？

```dart
import 'dart:io';

void main() {
  print('开始执行main函数');
  getNetworkData().then((value) {
    print(value);
  }).catchError((e) {
    print(e);
  });

  print('这是不能被阻塞的代码');
}

Future<String> getNetworkData() {
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    // 不再返回结果，而是出现异常
    // return '返回的网络数据';
    throw Exception('网络请求出现错误');
  });
}
```

上面代码的执行结果：

```dart
开始执行main函数
这是不能被阻塞的代码
// 3s后没有拿到结果，但是我们捕获到了异常
Exception: 网络请求出现错误
```



**补充一：上面内容的小结**

我们通过一个案例来学习了一些Future的使用过程：

1、创建一个Future（可能是我们创建的，也可能是调用内部API或者第三方API获取到的一个Future，总之你需要获取到一个Future实例，Future通常会对一些异步的操作进行封装）；

2、通过.then(成功回调函数)的方式来监听Future内部执行完成时获取到的结果；

3、通过.catchError(失败或异常回调函数)的方式来监听Future内部执行失败或者出现异常时的错误信息；



**补充二：Future的两种状态**

事实上Future在执行的整个过程中，我们通常把它划分成了两种状态：

状态一：`未完成状态（uncompleted）`

- 执行Future内部的操作时（在上面的案例中就是具体的网络请求过程，我们使用了延迟来模拟），我们称这个过程为未完成状态

状态二：**完成状态（completed）**

- 当Future内部的操作执行完成，通常会返回一个值，或者抛出一个异常。
- 这两种情况，我们都称Future为完成状态。

Dart官网有对这两种状态解析，之所以拿出来说是为了区别于Promise的三种状态



##### 7.2.4 Future链式调用小练习

例子：用户先登录，登录成功之后拿到token，然后再保存token到本地

```dart
// 用户先登录，登录成功之后拿到token，然后再保存token到本地
import 'dart:io';

void main() {
  print('开始执行main函数');

  login().then((token) {
    setToken(token).then((res) {
      if (res == 'ok') {
        print('本地存储token成功, token是$token');
      }
    }).catchError((e) {
      print(e);
    });
  }).catchError((e) {
    print(e);
  });

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
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    print('假装本地存储token');
    return 'ok';
  });
}
```

打印结果如下：

```dart
开始执行main函数
这是不能被阻塞的代码
// 3s后打印  
假装登录成功
// 3s后打印
假装本地存储token
本地存储token成功, token是666888
```



#### 7.3  async和await

如果你已经完全搞懂了Future，那么学习await、async应该没有什么难度。

**await、async是什么呢？**

- 它们是Dart中的关键字
- 它们可以让我们用`同步的代码格式`，去实现`异步的调用过程`。
- 并且，通常一个async的函数会返回一个Future。

我们已经知道，Future可以做到不阻塞我们的线程，让线程继续执行，并且在完成某个操作时改变自己的状态，并且回调then或者errorCatch回调。

**如何生成一个Future呢？**

- 1、通过我们前面学习的Future构造函数，或者后面学习的Future其他API都可以。
- 2、还有一种就是通过async的函数。

通常使用 `async await` 解决Future链式调用带来的回调地狱的问题

```dart
import 'dart:io';

//
void main() async {
  try {
    int result1 = await getFirstData(); //
    print(result1);
    int result2 = await getSecondData(); //
    print(result2);
    int result3 = await getThirdData(); //
    print(result3);
  } catch (e) {
    print(e);
  }
}

// async / await 让我们用同步的方式去写异步
// 前端鸿蒙 async 必须配套await出现
// await总是会强制等待后面的promise进行resolve
// 如果没有resolve 需要使用try catch进行捕获

Future<int> getFirstData() {
  return Future<int>(() {
    sleep(Duration(seconds: 2));
    print("获取第一层数据成功");
    return 1;
  });
}

Future<int> getSecondData() {
  return Future<int>(() {
    sleep(Duration(seconds: 2));
    print("获取第二层数据成功");
    return 2;
  });
}

Future<int> getThirdData() {
  return Future<int>(() {
    sleep(Duration(seconds: 2));
    throw new Exception("获取第三层数据失败");
    // print("获取第三层数据成功");
    // return 3;
  });
}
```



### 八、泛型

**[思考]****：**为什么`List`和`Map`中可以存储任意类型的数据？

**[原因]****：**Dart在封装List和Map时，使用了泛型去限定了List和Map中数据的类型为`dynamic`类型

**[泛型]****：**可用于限定数据的类型，比如可以限定List和Map中数据的类型

```dart
abstract class List<E> implements EfficientLengthIterable<E>
```

**[问题演示]****：**保存商品分类名称时，不应该出现100、true这样类型的数据

```dart
List categories = ['居家', '美食', 100, true];
```

**[解决]****：**使用[泛型]限定List或者Map中元素的类型

```dart
void main(List<String> args) {
  List<String> list = ["123"];
  Map<String, int> map = {};
  String str = getTypeValue<String>("abc");
  int count = getTypeValue(0, 0);
  bool isMarry = getTypeValue(false);

  ListDataSource<String> list2 = ListDataSource();
}

// 函数的泛型
T getTypeValue<T>(T value) {
  return value;
}

// lazyForach 必须实现并继承IDataSource
class ListDataSource<T> {
  List<T> _originArr = [];
  int totalCount() {
    return this._originArr.length;
  }

  T getData(int index) {
    return this._originArr[index];
  }

  registerDataListener(listener) {}
  unregisterDataListener() {}
}
```



**[泛型的作用]**：在程序设计中提供一种机制，使得代码能够在编写时不指定具体类型，从而**实现更灵活、可复用、类型安全的代码结构**，能适应多种不同类型的数据处理需求。

比如：List和Map中的元素使用泛型限定为可以是任意类型的，从而不需要单独去封装存储某一种数据类型的List和Map

```dart
/*
 泛型的作用：使用泛型可以减少重复的代码
 封装函数：接收字符串就返回字符串，接收数字就返回数字，接收bool就返回bool
 */
void main() {
  // 1. 普通封装
  // String demoString(String str) {
  //   return str;
  // }

  // int demoInt(int a) {
  //   return a;
  // }

  // bool demoBool(bool b) {
  //   return b;
  // }

  // 2. 基于泛型封装
  T demo<T>(T parm) {
    return parm;
  }

  // 调用
  String ret1 = demo<String>('itcast');
  print(ret1);
  int ret2 = demo<int>(17);
  print(ret2);
  bool ret3 = demo<bool>(true);
  print(ret3);
}
```

- json字符串转化实际对象

```dart
// import 'dart:convert';

// class People {
//   String? name;
//   int? age;
//   // 修改构造函数为命名参数
//   People({this.name, this.age});
//   factory People.fromJson(Map<String, dynamic> map) {
//     return People(name: map["name"], age: map["age"]);
//   }
// }

// void main() {
//   String str = '{"name": "张三", "age": 20 }';
//   Map<String, dynamic> map = json.decode(str);
//   People p = People.fromJson(map);
//   print(p.name);
// }

// JSON.parse  JSON.stringify()

// 前端 鸿蒙的字符串如何转化对象 JSON.parse() any as 具体类型
//
import 'dart:convert';

void main() {
  // 得到一个json字符串
  String str = '{"name": "张三", "age": 20 }';
  print(str);
  print(json.decode(str));
  Map<String, dynamic> map = json.decode(str); // json字符串转化map对象
  print(map["name"]);
  People p = People.fromJSONToClass(map);
  print(p.name);
}

class People {
  String? name;
  int? age;
  People({this.name, this.age});

  // factory 是类中的工厂关键字 相当于在类上添加了一个静态方法
  factory People.fromJSONToClass(Map<String, dynamic> map) {
    return People(name: map["name"], age: map["age"]); // 实例化对象
  }
}
```

### 九、异常处理

```dart
void main() {
  // 1. 捕获异常：try catch
  // try {
  //   dynamic name = 'itheima';
  //   name.haha();
  // } catch (e) {
  //   print(e);
  // } finally {
  //   // 无论是否有异常都会执行这个代码块
  //   print('finally');
  // }

  // 2. 手动抛出异常：判断字符串是否相等，如果不相等手动抛出异常
  try {
    String str = 'itcast';
    if (str == 'yjh') {
      print('ok');
    } else {
      // 手动抛出异常
      throw Exception('字符串不相等');
    }
  } catch (e) {
    print(e);
  }
}
```

