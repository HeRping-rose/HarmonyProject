# 01-Flutter概述

### 1. 常见的跨平台解决方案

跨平台？

跨操作系统: 

- 手机-ios-安卓-鸿蒙-塞班-window phone -黑莓-阿里云os

- - 混合开发（原生+H5）,  ReactNative, Uni-App, Flutter, Taro, Weex

- pc-macOS-windows-pc鸿蒙-linux(开源)-国内操作系统-统信-麒麟

- - Electron(vue+node, react+node)

#### 1.1. 方案1：webview（原生 + h5）



![image.png](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721137920855-cb8f7f46-e7cb-4797-b2d9-b193a23eec09.png?x-oss-process=image%2Fformat%2Cwebp)

基于 JavaScript 和 WebView的跨平台

- 最早出现的跨平台框架是基于 JavaScript 和 WebView，代表框架有PhoneGap，Apache Cordova等等。
- 主要是通过HTML来构建自己的界面，再将其显示在各个平台的WebView中。
- 该方案默认是不能调用本地的一些服务的(比如相机、蓝牙等)，所以需要通过JavaScript进行桥接调用Native的一些代码来完成某些功能。
- 该方案在体验、性能上都不能完全媲美原生，而且开发过程中的坑非常多。

原生和H5端的通信问题

- 大白话: 原生如何调用H5侧的方法, H5侧如何调用原生的方法
- iOS/Android --> JSBridge三方库
- 鸿蒙: 原生调用H5: runJavaScript(), H5调用原生:  registerJavaScriptProxy

#### 1.2. 方案2：React Native

React

Vue + React + Angular 前端三个框架

React + FaceBook-12年开源的一个前端Reactjs框架

Reactjs-遵循React语法-web版本-网页

ReactNative-遵循React语法-原生-跨平台打包！！ 安卓/ios/鸿蒙

体验媲美原生！！！！

Arkts - C++

ReactNative-js/TS - C++

JSX- JavaScript XML

```typescript
// 一切皆函数
function AddCutCount (props: { title: string }) {
  return <div>{props.title}</div>
}

function Demo () {
  return <AddCutCount title="张三"></AddCutCount>
}
```

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721138736651-59e639a4-ac5d-4187-b5c7-9902b67a3e27.png)

- 在寻求最佳跨平台解决方案的过程中，无疑React Native 是之前最优秀的一个。
- React Native（简称RN）是Facebook于2015年4月开源的跨平台移动应用开发框架，是Facebook早先开源的JS框架 React 在原生移动应用平台的衍生产物，目前支持i0S和安卓两大平台，对HarmonyOS的支持正在逐渐适配中。
- RN使用JavaScript语言，类似于HTML的JSX，以及CSS来开发移动应用，因此熟悉Web前端开发的技术人员只需很少的学习就可以进入移动应用开发领域。
- 在保留基本渲染能力的基础上，用原生自带的UI组件实现核心的渲染引擎，从而保证了良好的渲染性能。
- 但是，由于RN的本质是通过JSI调用原生接口，通信相对比较低效，而且框架本身不负责渲染，而是是间接通过原生进行渲染的。



#### 1.3. 方案3：Flutter

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721139153624-1568c048-770a-44bf-9e3c-bfd037d6a380.png)

flutter 是谷歌开源的

Android是谷歌开源的

- Flutter利用Skia绘图引擎，直接通过CPU、GPU进行绘制，不需要依赖任何原生的控件
- Android操作系统中，我们编写的原生控件实际上也是依赖于Skia进行绘制，所以Flutter在某些Android操作系统上甚至还要高于原生（因为原生Android中的Skia必须随着操作系统进行更新，而Flutter SDK中总是保持最新的）
- 而类似于RN的框架，必须通过某些桥接的方式先转成原生进行调用，之后再进行渲染

### 2. Flutter是什么？

官方定义：

```typescript
Flutter transforms the development process. 
Build, test, and deploy beautiful mobile, web, desktop, 
and embedded experiences from a single codebase.

Flutter is an open source framework by Google for building beautiful, 
natively compiled, multi-platform applications from a single codebase.
```

翻译总结如下：

- Flutter是一个UI SDK（Software Development Kit）
- **跨平台解决方案**：可以实现一套代码发布移动端（iOS、Android、harmonyOS(坑老多了)）, Web端，桌面等
- 目前很多公司都在用它，比如：Google、阿里、字节、腾讯
- 尤其是阿里的闲鱼团队，为Flutter的生态做出了很多贡献
- Flutter有着统一大前端的野望，并且它在不断蚕食iOS、Android、HarmonyOS这些原生开发

### 3. Flutter的特点

Google公司在国内做过很多宣讲，其中多次提到Flutter的几个特点：简洁！！！！ **美观**、**快速**、**高效**、**开放**

**3.1 美观-简洁**

使用Flutter内置美丽的Material Design和Cupertino widget、丰富的motion API、平滑而自然的滑动效果和平台感知，为您的用户带来全新体验。

**3.2 快速**

Flutter 的 UI渲染性能很好。在生产环境下，Flutter 将代码编译成机器码执行，并充分利用 GPU 的图形加速能力，因此使用Flutter 开发的移动应用即使在低配手机上也能实现每秒 60 帧的 U 渲染速度。

Flutter 引擎使用 C++ 编写，包括高效的 Skia 2D 渲染引擎，Dart 运行时和文本渲染库。

**3.3 高效**

Hot Reload (热重载)，在前端已经不是什么新鲜的东西，但在移动端之前一直是没有的

**3.4 开放**

Flutter 是开放的，它是一个完全开源的框架。

### 4. Flutter需要的开发环境

操作系统的选择?

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721139793989-185ac8f6-03ee-4eae-be9a-7a00affb8a7d.png)

- 学习阶段：Windows或者macOS都是可以的
- 开发阶段：一般需要使用macOS，因为我们需要针对iOS进行调试，通常方便起见还是选择macOS
- 疑问：如果以后做Flutter开发没有macOS怎么办?

- - 这个可以完全放心，使用Flutter开发的公司必然会给你配备macOS的

- Flutter可以在Windows上学习，也可以在macOS上，学习阶段使用Windows是没有任何问题
- 在搭建Flutter环境之前，先来安装Dart环境，学习Dart核心语法。



# 02-Dart核心语法

1. 认识DartGoogle为Flutter选择了Dart语言已经是既定的事实，无论你多么想用你熟悉的语言，比如JavaScript、TypeScript、ArkTS等来开发Flutter，至少目前都是不可以的。[Dart](https://dart.cn/) 是由谷歌开发的计算机编程语言，它可以被应用于 Web/服务器/移动应用和物联网等领域开发。Dart 也是 [Flutter](https://flutter.cn/) 的基础，Dart 作为 Flutter 应用程序的编程语言，为驱动应用运行提供了环境。因此,  要学习Flutter,  则首先得会Dart,  Dart 目前最新稳定版本：v3.4.0好消息：如果你会 JavaScript、 Typescript、Java 中任何一门语言，你将很快且很容易就能学会Dart的使用。2. 搭建Dart开发环境（略过）为什么需要安装Dart呢？事实上如果提前安装了Flutter SDK，它已经内置了Dart了，我们完全可以直接使用Flutter去进行Dart的编写并且运行。但是，如果想单独学习Dart，并且运行自己的Dart代码，最好去安装一个Dart SDK。



要在本地开发Dart程序,  首先需要安装[Dart SDK](https://dart.dev/get-dart/archive)

官方文档: https://dart.dev/get-dart , 中文文档: https://dart.cn/

无论是什么操作系统，安装方式都是有两种：`通过工具安装`和`直接下载SDK，配置环境变量`

a.通过工具安装

- Windows可以通过Chocolatey
- macOS可以通过homebrew
- 具体安装操作官网网站有详细的解释

b.直接下载SDK，配置环境变量

- 下载地址：https://dart.dev/tools/sdk/archive
- 我采用了这个安装方式。
- 下载完成后，根据路径配置环境变量即可。



#### 1. Windows环境安装Dart

##### 1.1 下载压缩包, 然后解压放在任意盘符下(注意不要是中文目录下)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721097316669-d7c61ff4-65d0-4e61-80aa-782a37f55555.png)

##### 1.2 找到bin目录,  复制完整路径,  配置环境变量

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721097435716-501b0441-b73c-443e-9fd5-11b06c42a6a7.png)

##### 1.3 cmd 窗口执行 dart --version 看到dart-sdk的版本代表OK

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721097530554-e988eb82-04a2-41bb-9e5b-89fe166cde01.png)



#### 2. Mac环境安装Dart

- macOS支持的架构： x64、ARM64

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721097932778-fa19346d-2521-481d-bf47-618705508716.png)

##### 2.1 下载并解压Dart SDK，放到电脑的某个目录下面（不要是中文）

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721956608525-b2f7c067-5ef5-4e29-b26a-745445a677ab.png)

##### 2.2 配置环境变量

打开终端，‌使用文本编辑器（‌如`vi`或`nano`）‌编辑`~/.zshrc`和`~/.bash_profile`文件。‌在文件的末尾添加以下行，‌将Dart SDK的路径添加到系统的PATH中：‌



在终端中运行`vim ~/.zshrc`命令

```bash
export PATH="/path/to/dart/sdk/bin:$PATH"
```

注意：

1. 将`/path/to/dart/sdk/bin`替换为你解压Dart SDK的实际路径。‌
2. **保存并关闭文件**：‌保存并关闭文本编辑器（按下esc，输入:wq）

##### 2.3 使环境变量生效

在终端中运行`source ~/.zshrc`命令，‌使新的环境变量设置立即生效。‌

##### 2.4 验证安装

运行`dart --version`命令来检查Dart的版本信息，‌如果正确显示版本信息，‌则表示Dart已经成功安装。‌

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721956882069-641ac6fa-4e80-4a78-83f0-a3ac2b21e16b.png)



### 3. Dart初体验

#### 3.1 VSCode中安装常用插件

- Dart插件：可以帮助我们在VSCode中更加高效的编写Dart代码
  提供了友好的代码提示，代码高亮，以及代码的重构、运行和重载

​     ![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721097789024-340ad8c2-97fd-4c31-8137-becf448c3f41.png)

- Flutter插件：为Flutter开发准备的

​    ![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743903011264-756f4595-fc9f-4076-9b9e-7d59a5267951.png)

- Code Runner：可以点击右上角的按钮快速运行代码

​    ![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721141032627-ce5e4637-0141-48a6-821e-98a21c4aebba.png)



#### 3.2 第一个Dart程序

1. 创建dart文件

- dart文件名必须以 `.dart` 结尾：`01-第一个dart程序.dart`

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721100358767-4130d416-ae83-45fd-8fa7-563ae6721619.png)

1. 编写dart代码

 需求：打印字符串 'hello dart!'

```dart
// 程序的入口：main函数
void main() {
  // 需求：打印字符串 'hello itcast'
  print('hello world'); // hello world
}
```

1. 执行dart代码

- 方式一：终端中执行：终端打开dart文件所在目录

```bash
dart 01-dart初体验.dart
```

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1721100607216-4be8e989-1f28-4927-b74d-3fcc9dfd9c3f.png)

- 方式二：

- - VSCode中执行

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743860624772-31999568-9ead-4d3d-924b-78bd211bb5fe.png)

- - VSCode中查看代码执行结果

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743860635971-c7dcc47a-256a-4a40-ba94-31b3bb6732ba.png)

小结:

1、Dart语言的入口也是main函数，并且必须显示的进行定义；

2、Dart的入口函数`main`是没有返回值的；

3、定义字符串的时候，可以使用单引号或双引号；

4、每行语句必须使用分号结尾，很多语言并不需要分号，比如JavaScript；



### 4. Dart基础语法

#### 变量和常量（存储数据）

##### 4.1.1 变量（存储并修改数据）

需求：存储一个姓名和年龄并修改年龄？

实现：变量关键字：`**var**`

要点:

1. 声明变量：var 变量名 = 表达式;
2. 修改变量：变量名 = 新值;
3. 类型推断：var关键字声明的变量支持类型推断，修改变量时会检查之前存储数据的类型

```dart
void main() {
  // 变量的声明
  // 前端 var 鸿蒙 let const
  var name = "老高";
  print(name);
  name = "老高老了";
  print(name);

  const BASE_URL = "https://toutiao.itheime.net"; // 常量地址
  print(BASE_URL);
  // BASE_URL = "abc"; 常量地址不能被赋值
}
```

##### 4.1.2 常量（存储不变的数据）

需求：存储不可被修改的数据

实现：常量关键字：`**const**` **和** `**final**`

区别：final是运行时常量，值在运行时赋值；const是编译期常量，值在编译时赋值；

```dart
void main() {
  var count = 10;
  var count2 = 20;

  const Safe_Top_Height = 30; // 定义顶部安全区的高度
  final Safe_Bottom_Height = count + count2; // 定义底部安全区的高度
  // Safe_Top_Height = 40;
  // Safe_Bottom_Height = 50;
  // 都不能被修改
  // const 编译期运行
  // final 运行时
  // 编译- 程序- 编译过程-编译过了才可以运行
  // 运行-编译完成之后运行的代码
  print(Safe_Bottom_Height);
  // const性能更好，没运行的时候就确定了值和类型
}
```

注意:  const 和 final的区别

final：运行时常量，值在运行时赋值

const：编译期常量，值在编译时赋值



#### 4.2 数据类型（可存储数据类型）

##### 4.2.1 num（数字）

需求：存储并修改整数和小数

实现：关键字：`**num**`**、**`**int**`**、**`**double**`



```dart
void main() {
  // 前端 鸿蒙 类型注解 username: string = "张三"
  // flutter 类似java写法 String a = "11"
  // 数字类型 num(整数 + 小数) int(整数) double(小数)
  num price = 23; // 声明一个价格的变量
  print(price);
  price = ((price * 10) * (1.4 * 10)) / 100; // 处理进度
  print(price);

  // int 只能是整数
  int index = 0;
  while (index < 10) {
    print(index);
    index++;
  }
  // double带精度的数字
  double good_price = 19.99;
  print(good_price);

  // double不能给int赋值
  // int也不可以double赋值
  // double可以给num赋值
  // num不能给double赋值
  // int可以给num赋值
  price = good_price;
  print(price);

  // 如果确定是整数 用int 比如索引 比如数量
  // 如果是价格类的数据 用 double
  // 都用num不好，num占的空间更大，占了整数和小数的空间
}
```



以下是 Dart 中 `num`、`int`、`double` 可调用的属性和方法分类表格（基于 Dart 3.x 版本），其中 **通用** 指 `num` 中定义的、`int` 和 `double` 均可继承使用的成员，**特有** 指仅 `int` 或 `double` 单独拥有的成员：

| 类型            | 类别     | 成员（属性 / 方法）                 | 说明                                                         |
| --------------- | -------- | ----------------------------------- | ------------------------------------------------------------ |
| **通用（num）** | **属性** | `sign`                              | 返回表示数值符号的整数：负数返回 `-1`，零返回 `0`，正数返回 `1` |
|                 | **方法** | `abs()`                             | 返回绝对值                                                   |
|                 |          | `ceil()`                            | 返回大于等于当前值的最小整数（`int` 类型）                   |
|                 |          | `compareTo(num other)`              | 比较当前值与另一个数值，返回 `-1`（小于）、`0`（等于）、`1`（大于） |
|                 |          | `floor()`                           | 返回小于等于当前值的最大整数（`int` 类型）                   |
|                 |          | `remainder(num other)`              | 返回当前值除以 `other` 的余数（同数学取余）                  |
|                 |          | `round()`                           | 四舍五入为最接近的整数（`int` 类型）                         |
|                 |          | `toDouble()`                        | 转换为 `double` 类型（`int` 会转为浮点形式，`double` 返回自身） |
|                 |          | `toInt()`                           | 转换为 `int` 类型（`double` 会截断小数部分，`int` 返回自身） |
|                 |          | `toString()`                        | 转换为字符串表示                                             |
|                 |          | `truncate()`                        | 截断小数部分，返回整数（`int` 类型，与 `floor()` 不同：负数会向零取整） |
| **int 特有**    | **属性** | `bitLength`                         | 返回表示当前整数所需的最小二进制位数（不包含符号位）         |
|                 |          | `isEven`                            | 是否为偶数（`bool`）                                         |
|                 |          | `isOdd`                             | 是否为奇数（`bool`）                                         |
|                 | **方法** | `gcd(int other)`                    | 返回与 `other` 的最大公约数（`int`）                         |
|                 |          | `modInverse(int modulus)`           | 返回模 `modulus` 的逆元（需满足当前值与 `modulus` 互质）     |
|                 |          | `modPow(int exponent, int modulus)` | 返回 `(当前值^exponent) % modulus` 的结果                    |
|                 |          | `toRadixString(int radix)`          | 转换为指定进制（`radix`，2-36）的字符串                      |
|                 |          | `parse(String source)` （静态方法） | 将字符串解析为 `int`（如 `int.parse("123")`）                |
| **double 特有** | **属性** | `isInfinite`                        | 是否为无限大（`double.infinity` 或 `-double.infinity`）      |
|                 |          | `isNaN`                             | 是否为非数字（`NaN`，如 `0/0` 的结果）                       |
|                 | **方法** | `acos()`                            | 计算反余弦值（返回 `double`，单位弧度）                      |
|                 |          | `asin()`                            | 计算反正弦值（返回 `double`，单位弧度）                      |
|                 |          | `atan()`                            | 计算反正切值（返回 `double`，单位弧度）                      |
|                 |          | `atan2(double other)`               | 计算 `(other, 当前值)` 的反正切值（返回 `double`，单位弧度） |
|                 |          | `ceilToDouble()`                    | 返回大于等于当前值的最小双精度浮点数（`double` 类型）        |
|                 |          | `cos()`                             | 计算余弦值（返回 `double`，单位弧度）                        |
|                 |          | `exp()`                             | 计算自然指数（e^ 当前值，返回 `double`）                     |
|                 |          | `floorToDouble()`                   | 返回小于等于当前值的最大双精度浮点数（`double` 类型）        |
|                 |          | `log()`                             | 计算自然对数（返回 `double`）                                |
|                 |          | `roundToDouble()`                   | 四舍五入为最接近的双精度浮点数（`double` 类型）              |
|                 |          | `sin()`                             | 计算正弦值（返回 `double`，单位弧度）                        |
|                 |          | `sqrt()`                            | 计算平方根（返回 `double`）                                  |
|                 |          | `tan()`                             | 计算正切值（返回 `double`，单位弧度）                        |
|                 |          | `truncateToDouble()`                | 截断小数部分，返回双精度浮点数（`double` 类型）              |
|                 |          | `parse(String source)` （静态方法） | 将字符串解析为 `double`（如 `double.parse("3.14")`）         |



##### 4.2.2 String（字符串）

Dart字符串是UTF-16编码单元的序列。您可以使用单引号或双引号创建一个字符串

需求：声明字符串，修改字符串，拼接字符串

注意：模板字符串支持运算

实现：关键字：`**String**`

```dart
void main() {
  String username = "张三";
  print(username);
  username = "flutter真好学";
  print(username);

  // 前端和鸿蒙字符串 `${username}`
  // flutter不要反引号
  print('当前的用户名:$username');
  print('当前的用户名的长度:${username.length * 10}');

  // 使用\n换行符
  String poemStr = '白日依山尽\n黄河入海流\n欲穷千里目\n更上一层楼';
  print(poemStr);

  // 还有一种换行模式
  String song = '''
    Hiding from rain and snow,
    Looking at crowed from our around go
''';
  print(song);
}
```

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743907038911-102c006f-1f8f-4ac4-b22f-d1b70817a09d.png)



以下是 Dart 中 `String` 类型可调用的主要属性和方法（基于 Dart 3.x 版本），按功能分类整理：

###### **一、属性（直接访问，无需调用）**

| 属性名       | 类型        | 说明                                                         |
| ------------ | ----------- | ------------------------------------------------------------ |
| `length`     | `int`       | 返回字符串的字符数量（UTF-16 代码单元计数，大部分常用字符占 1 个单元） |
| `isEmpty`    | `bool`      | 判断字符串是否为空（长度为 0），等价于 `length == 0`         |
| `isNotEmpty` | `bool`      | 判断字符串是否非空（长度大于 0），等价于 `length > 0`        |
| `codeUnits`  | `List<int>` | 返回字符串的 UTF-16 编码代码单元列表（每个元素是字符的编码值） |
| `runes`      | `Runes`     | 返回字符串的 Unicode 码点（可迭代对象，支持表情符号等占多单元的字符） |

###### **二、方法（需调用，部分带参数）**

#### **1. 基本操作（拼接、比较等）**

| 方法名                     | 返回类型 | 说明                                                         |
| -------------------------- | -------- | ------------------------------------------------------------ |
| `operator +(String other)` | `String` | 拼接两个字符串（等价于 `+` 运算符，如 `"a" + "b"`）          |
| `compareTo(String other)`  | `int`    | 比较两个字符串（按字典序），返回 `-1`（小于）、`0`（等于）、`1`（大于） |
| `toString()`               | `String` | 返回字符串本身（所有对象都有此方法，String 直接返回自身）    |

#### **2. 查找与判断**

| 方法名                                                      | 返回类型 | 说明                                                      |
| ----------------------------------------------------------- | -------- | --------------------------------------------------------- |
| `contains(Pattern other, [int startIndex = 0])`             | `bool`   | 判断是否包含子串 / 正则（`startIndex` 为起始查找位置）    |
| `startsWith(Pattern other, [int startIndex = 0])`           | `bool`   | 判断是否以指定子串 / 正则开头（从 `startIndex` 开始检查） |
| `endsWith(String other)`                                    | `bool`   | 判断是否以指定子串结尾                                    |
| `indexOf(Pattern other, [int startIndex = 0])`              | `int`    | 查找子串 / 正则第一次出现的索引，找不到返回 `-1`          |
| `lastIndexOf(Pattern other, [int? startIndex])`             | `int`    | 查找子串 / 正则最后一次出现的索引，找不到返回 `-1`        |
| `indexWhere(bool test(String char), [int startIndex = 0])`  | `int`    | 按条件 `test` 查找第一个符合的字符索引，找不到返回 `-1`   |
| `lastIndexWhere(bool test(String char), [int? startIndex])` | `int`    | 按条件 `test` 查找最后一个符合的字符索引，找不到返回 `-1` |

#### **3. 截取与分割**

| 方法名                                                       | 返回类型       | 说明                                                         |
| ------------------------------------------------------------ | -------------- | ------------------------------------------------------------ |
| `substring(int startIndex, [int? endIndex])`                 | `String`       | 截取子串：从 `startIndex` 到 `endIndex`（不含，默认到末尾）  |
| `split(Pattern pattern)`                                     | `List<String>` | 按 `pattern`（子串 / 正则）分割字符串为列表，如 `"a,b".split(",")` → `["a", "b"]` |
| `splitMapJoin(Pattern pattern, {String Function(Match)? onMatch, String Function(String)? onNonMatch})` | `String`       | 分割字符串并分别处理匹配部分（`onMatch`）和非匹配部分（`onNonMatch`） |
| `codeUnitAt(int index)`                                      | `int`          | 返回指定索引位置字符的 UTF-16 编码值（索引越界会报错）       |
| `runAt(int index)`                                           | `int`          | 返回指定索引位置字符的 Unicode 码点（支持多单元字符，如表情符号） |

#### **4. 转换操作**

| 方法名                                        | 返回类型 | 说明                                                     |
| --------------------------------------------- | -------- | -------------------------------------------------------- |
| `toUpperCase()`                               | `String` | 转换为全大写字符串（如 `"Abc".toUpperCase()` → `"ABC"`） |
| `toLowerCase()`                               | `String` | 转换为全小写字符串（如 `"Abc".toLowerCase()` → `"abc"`） |
| `trim()`                                      | `String` | 去除首尾空白字符（空格、换行、制表符等）                 |
| `trimLeft()`                                  | `String` | 仅去除左侧空白字符                                       |
| `trimRight()`                                 | `String` | 仅去除右侧空白字符                                       |
| `padLeft(int width, [String padding = ' '])`  | `String` | 左侧填充字符至指定长度 `width`（不足则返回原字符串）     |
| `padRight(int width, [String padding = ' '])` | `String` | 右侧填充字符至指定长度 `width`（不足则返回原字符串）     |

#### **5. 替换操作**

| 方法名                                                       | 返回类型 | 说明                                                         |
| ------------------------------------------------------------ | -------- | ------------------------------------------------------------ |
| `replaceAll(Pattern from, String to)`                        | `String` | 替换所有匹配 `from`（子串 / 正则）的部分为 `to`              |
| `replaceFirst(Pattern from, String to, [int startIndex = 0])` | `String` | 替换第一个匹配 `from` 的部分为 `to`（从 `startIndex` 开始查找） |
| `replaceRange(int startIndex, int? endIndex, String replacement)` | `String` | 替换指定范围（`startIndex` 到 `endIndex`）的字符为 `replacement` |
| `replaceAllMapped(Pattern from, String Function(Match) replace)` | `String` | 用函数 `replace` 处理每个匹配 `from` 的结果，返回替换后的字符串 |

#### **6. 其他实用方法**

| 方法名                                       | 返回类型          | 说明                                                         |
| -------------------------------------------- | ----------------- | ------------------------------------------------------------ |
| `matchesAsPrefix(String string, int start)`  | `int?`            | 静态方法：判断当前字符串是否为 `string` 从 `start` 开始的前缀，返回匹配长度（不匹配返回 `null`） |
| `allMatches(String string, [int start = 0])` | `Iterable<Match>` | 静态方法：返回当前正则在 `string` 中所有匹配的迭代器（需用正则字符串调用） |
| `hashCode`                                   | `int`             | 返回字符串的哈希码（用于哈希表等场景）                       |
| `operator [](int index)`                     | `String`          | 获取指定索引的字符（等价于 `charAt(index)`，如 `"abc"[1]` → `"b"`） |

### 补充说明：

- `Pattern` 类型参数可以是 `String`（子串）或 `RegExp`（正则表达式），如 `contains(RegExp(r'\d'))` 可判断是否包含数字。
- 字符串是不可变的：所有修改字符串的方法（如 `replaceAll`、`toUpperCase`）都会返回新字符串，原字符串不会被修改。
- 静态方法（如 `String.fromCharCode`、`String.fromCharCodes`）用于创建字符串，需通过 `String` 类调用（如 `String.fromCharCode(65)` → `"A"`）。



```dart
void main() {
  String str = "  Hello Dart!  ";
  print("原始字符串: '$str'");
  
  // 常用属性
  print("1. 长度: ${str.length}"); // 包含空格和符号的总长度
  print("2. 是否为空: ${str.isEmpty}");
  print("3. 是否非空: ${str.isNotEmpty}");
  print("4. 第一个字符编码: ${str.codeUnits[0]}"); // 空格的ASCII码
  
  // 字符串拼接与比较
  String str2 = " Programming";
  print("5. 拼接结果: '${str + str2}'"); // 使用 + 拼接
  print("6. 比较结果: ${str.compareTo(str2)}"); // 比较字符串
  
  // 查找与判断
  print("7. 是否包含'Dart': ${str.contains("Dart")}");
  print("8. 是否以'Hello'开始: ${str.trim().startsWith("Hello")}"); // 先去空格
  print("9. 是否以'!'结束: ${str.endsWith("!")}");
  print("10. 'Dart'的索引: ${str.indexOf("Dart")}");
  print("11. 'l'最后出现的索引: ${str.lastIndexOf("l")}");
  
  // 截取与分割
  print("12. 截取子串: '${str.substring(3, 8)}'"); // 从索引3到8(不含)
  String csv = "apple,banana,orange";
  print("13. 分割结果: ${csv.split(",")}"); // 按逗号分割
  
  // 转换操作
  print("14. 全大写: '${str.toUpperCase()}'");
  print("15. 全小写: '${str.toLowerCase()}'");
  print("16. 去除首尾空格: '${str.trim()}'");
  print("17. 左侧补全: '${str.trim().padLeft(15, "*")}'"); // 补全到15个字符
  print("18. 右侧补全: '${str.trim().padRight(15, "-")}'");
  
  // 替换操作
  print("19. 替换所有'l': '${str.replaceAll("l", "L")}'");
  print("20. 替换第一个'l': '${str.replaceFirst("l", "L")}'");
}

```



##### 4.2.3 bool（布尔）

需求：存储并修改真或假

实现：关键字：`**bool**`

```dart
void main() {
  // 前端鸿蒙 showSheet: boolean = false
  bool showSheet = true;
  if (showSheet) {
    print("半模态显示");
  } else {
    print("半模态隐藏");
  }
  // flutter支持三元表达式
  bool isMarry = false;
  isMarry ? print("已婚") : print("未婚");

  // flutter中的类型不支持隐性转化
  // 前端 鸿蒙 !!0
  int count = 0;
  bool isOK = count == 0; // flutter中没有全等 强类型语言  == 就是等同于前端鸿蒙中的全等
}
```

##### 4.2.4 List（列表）

需求：使用一个变量有序的存储多个值

实现：列表(数组)关键字：`**List**`

- 定义列表  List 变量名 = [元素1, 元素2, ..., 元素n];

- - 1.1 需求：按序存储数字 1 3 5 7
  - 1.2 需求：按序存储字符串 '居家' '美食' '服饰'
  - 1.3 列表中可以存储任意类型的数据

- add 在尾部添加
- addAll 在尾部添加一个数组
- remove 删除满足内容第一个
- removeAt 根据索引删除
- removeLast 删除最后一个
- removeRange删除索引范围内数据
- forEach 循环
- every 是否都满足条件
- where 类似于前端鸿蒙的filter
- last 最后一个元素
- first 第一个元素
- isEmpty 是否为空

```dart
void main() {
  // 前端 鸿蒙数组类型 1.Array<类型> 2. number[]
  // Flutter使用List关键字声明数组列表 -列表类型
  // var const final int num double String bool List
  List indexList = [1, 2, 3];
  print(indexList);
  print(indexList[1]);
  // 数组前端鸿蒙 forEach-map-find寻找-findIndex(寻找索引)-every(所有都满足)-some(有一个满足)
  // reduce(累计运行) filter(筛选) indexOf(寻找索引) pop(在尾部删除) push(在尾部追加) shift(在头部删除) unshift(在头部追加) slice(截取) splice(删除替换) join(链接) includes(包含) reverse(反转) flat(数组拍平方法)

  // 追加操作
  indexList.add(4); // 追加操作
  print(indexList);
  // 插入操作 在具体位置插入
  indexList.insert(0, 999);
  print(indexList);
  // 删除操作 删除具体数据
  indexList.remove(999);
  print(indexList);
  // 删除具体位置 索引
  indexList.removeAt(0);
  print(indexList);
  // 添加数组
  indexList.addAll([5, 6, 7]);
  print(indexList);
  // 删除最后一个
  indexList.removeLast();
  print(indexList);
  // 删除第一个
  // indexList.removeRange(0, indexList.length);
  // print(indexList);
  print(indexList.isEmpty); // 判断是否为空
  // 可以拿第一个最后一个
  if (indexList.length > 0) {
    print(indexList.first);
    print(indexList.last);
  }

  // 循环
  indexList.forEach((element) {
    print(element);
  });
  // 箭头函数只有一行逻辑的时候才可以写箭头函数 不能省略参数的括号
  indexList.forEach((element) => print(element));

  // every 筛选是否都满足条件
  print(indexList.every((element) => element > 0));

  // where方法类似filter方法
  print(indexList.where((element) => element > 4));

  // 直接使用for循环List

  for (int i = 0; i < indexList.length; i++) {
    print('当前循环的第$i个, ${indexList[i]}');
  }
  // for in循环
  for (var element in indexList) {
    print('当前的循环项$element');
  }
}
```



以下是 Dart 中 `List`（列表）的主要属性和方法（基于 Dart 3.x 版本），按功能分类整理：

###### **一、属性（直接访问）**

| 属性名        | 类型          | 说明                                                 |
| ------------- | ------------- | ---------------------------------------------------- |
| `length`      | `int`         | 返回列表中元素的数量                                 |
| `isEmpty`     | `bool`        | 判断列表是否为空（`length == 0`）                    |
| `isNotEmpty`  | `bool`        | 判断列表是否非空（`length > 0`）                     |
| `first`       | 元素类型      | 返回列表的第一个元素（空列表访问会报错）             |
| `last`        | 元素类型      | 返回列表的最后一个元素（空列表访问会报错）           |
| `reversed`    | `Iterable<E>` | 返回列表的反向迭代器（不修改原列表，仅提供反向视图） |
| `runtimeType` | `Type`        | 返回列表的运行时类型（如 `List<int>`）               |

###### **二、方法（需调用）**

#### **1. 元素添加与插入**

| 方法名                                       | 返回类型 | 说明                                                         |
| -------------------------------------------- | -------- | ------------------------------------------------------------ |
| `add(E value)`                               | `void`   | 在列表末尾添加一个元素（仅可修改的列表可用，如 `List.from()` 创建的列表） |
| `addAll(Iterable<E> iterable)`               | `void`   | 在列表末尾添加另一个可迭代对象（如另一个列表）的所有元素     |
| `insert(int index, E element)`               | `void`   | 在指定索引 `index` 处插入一个元素（索引越界会报错）          |
| `insertAll(int index, Iterable<E> iterable)` | `void`   | 在指定索引 `index` 处插入另一个可迭代对象的所有元素          |

#### **2. 元素删除**

| 方法名                              | 返回类型 | 说明                                                         |
| ----------------------------------- | -------- | ------------------------------------------------------------ |
| `remove(Object? value)`             | `bool`   | 删除第一个与 `value` 相等的元素，返回是否删除成功（找到并删除则为 `true`） |
| `removeAt(int index)`               | `E`      | 删除并返回指定索引 `index` 处的元素（索引越界会报错）        |
| `removeLast()`                      | `E`      | 删除并返回列表的最后一个元素（空列表调用会报错）             |
| `removeWhere(bool test(E element))` | `void`   | 删除所有满足条件 `test` 的元素（如 `list.removeWhere((e) => e < 0)`） |
| `retainWhere(bool test(E element))` | `void`   | 保留所有满足条件 `test` 的元素，删除其他元素                 |
| `clear()`                           | `void`   | 清空列表中的所有元素                                         |

#### **3. 查找与判断**

| 方法名                                               | 返回类型 | 说明                                                         |
| ---------------------------------------------------- | -------- | ------------------------------------------------------------ |
| `contains(Object? value)`                            | `bool`   | 判断列表是否包含 `value` 元素                                |
| `indexOf(Object? value, [int start = 0])`            | `int`    | 从 `start` 索引开始，查找 `value` 第一次出现的索引，找不到返回 `-1` |
| `lastIndexOf(Object? value, [int? start])`           | `int`    | 从 `start` 索引（默认末尾）开始，查找 `value` 最后一次出现的索引，找不到返回 `-1` |
| `indexWhere(bool test(E element), [int start = 0])`  | `int`    | 从 `start` 开始，查找第一个满足 `test` 的元素索引，找不到返回 `-1` |
| `lastIndexWhere(bool test(E element), [int? start])` | `int`    | 从 `start` 开始，查找最后一个满足 `test` 的元素索引，找不到返回 `-1` |
| `any(bool test(E element))`                          | `bool`   | 判断是否至少有一个元素满足 `test`（类似 “存在”）             |
| `every(bool test(E element))`                        | `bool`   | 判断是否所有元素都满足 `test`（类似 “全部”）                 |

#### **4. 截取与子列表**

| 方法名                            | 返回类型      | 说明                                                         |
| --------------------------------- | ------------- | ------------------------------------------------------------ |
| `sublist(int start, [int? end])`  | `List<E>`     | 返回从 `start` 到 `end`（不含，默认到末尾）的子列表（原列表的视图，修改会影响原列表） |
| `getRange(int start, int end)`    | `Iterable<E>` | 返回从 `start` 到 `end` 的元素视图（不可修改）               |
| `take(int count)`                 | `Iterable<E>` | 返回前 `count` 个元素组成的可迭代对象（不足则返回所有元素）  |
| `takeWhile(bool test(E element))` | `Iterable<E>` | 从开头开始，返回连续满足 `test` 的元素，直到不满足为止       |
| `skip(int count)`                 | `Iterable<E>` | 跳过前 `count` 个元素，返回剩余元素组成的可迭代对象          |
| `skipWhile(bool test(E element))` | `Iterable<E>` | 从开头开始，跳过连续满足 `test` 的元素，返回剩余元素         |

#### **5. 排序与替换**

| 方法名                                                       | 返回类型 | 说明                                                         |
| ------------------------------------------------------------ | -------- | ------------------------------------------------------------ |
| `sort([int compare(E a, E b)?])`                             | `void`   | 对列表进行排序（默认按升序，可传入 `compare` 函数自定义排序规则，如 `(a, b) => b - a` 降序） |
| `shuffle([Random? random])`                                  | `void`   | 随机打乱列表元素的顺序                                       |
| `replaceRange(int start, int end, Iterable<E> replacements)` | `void`   | 用 `replacements` 中的元素替换从 `start` 到 `end` 的元素     |
| `fillRange(int start, int end, [E? fillValue])`              | `void`   | 用 `fillValue` 填充从 `start` 到 `end` 的范围（默认填充 `null`） |

#### **6. 转换与映射**

| 方法名                           | 返回类型      | 说明                                                         |
| -------------------------------- | ------------- | ------------------------------------------------------------ |
| `map<T>(T f(E e))`               | `Iterable<T>` | 对每个元素应用函数 `f`，返回转换后的可迭代对象（如 `list.map((e) => e * 2)`） |
| `where(bool test(E element))`    | `Iterable<E>` | 返回所有满足 `test` 的元素组成的可迭代对象（过滤）           |
| `whereType<T>()`                 | `Iterable<T>` | 返回列表中类型为 `T` 的元素组成的可迭代对象（类型过滤）      |
| `toList({bool growable = true})` | `List<E>`     | 将可迭代对象（如 `map`/`where` 的结果）转换为列表（`growable` 表示是否可动态扩容） |
| `toSet()`                        | `Set<E>`      | 将列表转换为集合（去重）                                     |
| `cast<T>()`                      | `List<T>`     | 将列表强制转换为 `List<T>` 类型（类型不匹配会报错）          |

#### **7. 静态方法（通过 `List` 类调用）**

| 方法名                                                       | 返回类型  | 说明                                                         |
| ------------------------------------------------------------ | --------- | ------------------------------------------------------------ |
| `List.from(Iterable elements, {bool growable = true})`       | `List`    | 从可迭代对象创建列表（可指定是否可扩容）                     |
| `List.generate(int length, E generator(int index), {bool growable = true})` | `List<E>` | 根据长度 `length` 和生成器函数 `generator` 创建列表（如 `List.generate(3, (i) => i*2)` → `[0, 2, 4]`） |
| `List.of(Iterable<E> elements, {bool growable = true})`      | `List<E>` | 从可迭代对象创建列表（类型更严格，要求元素类型匹配）         |
| `List.unmodifiable(Iterable elements)`                       | `List`    | 创建不可修改的列表（尝试修改会报错）                         |

```dart
void main() {
  // 初始化一个可修改的列表
  List<int> numbers = [1, 2, 3, 4, 5];
  print("原始列表: $numbers");

  // --------------------------
  // 常用属性
  // --------------------------
  print("\n=== 属性示例 ===");
  print("1. 长度: ${numbers.length}"); // 元素数量
  print("2. 是否为空: ${numbers.isEmpty}"); // 是否为空列表
  print("3. 是否非空: ${numbers.isNotEmpty}"); // 是否为非空列表
  print("4. 第一个元素: ${numbers.first}"); // 第一个元素
  print("5. 最后一个元素: ${numbers.last}"); // 最后一个元素
  print("6. 反向视图: ${numbers.reversed.toList()}"); // 反向列表（需转成List）

  // --------------------------
  // 元素添加与插入
  // --------------------------
  print("\n=== 添加与插入 ===");
  numbers.add(6); // 末尾添加元素
  print("7. 添加后: $numbers");

  numbers.addAll([7, 8]); // 末尾添加多个元素
  print("8. 添加多个后: $numbers");

  numbers.insert(2, 10); // 在索引2处插入元素
  print("9. 插入后: $numbers");

  // --------------------------
  // 元素删除
  // --------------------------
  print("\n=== 删除操作 ===");
  numbers.remove(10); // 删除值为10的元素
  print("10. 删除值后: $numbers");

  numbers.removeAt(3); // 删除索引3处的元素
  print("11. 删除索引后: $numbers");

  numbers.removeLast(); // 删除最后一个元素
  print("12. 删除最后一个后: $numbers");

  numbers.removeWhere((n) => n % 2 == 0); // 删除所有偶数
  print("13. 删除偶数后: $numbers");

  // --------------------------
  // 查找与判断
  // --------------------------
  print("\n=== 查找与判断 ===");
  print("14. 是否包含3: ${numbers.contains(3)}");
  print("15. 3的索引: ${numbers.indexOf(3)}");
  print("16. 是否有元素>4: ${numbers.any((n) => n > 4)}");
  print("17. 是否所有元素>0: ${numbers.every((n) => n > 0)}");

  // --------------------------
  // 排序与打乱
  // --------------------------
  print("\n=== 排序与打乱 ===");
  numbers.sort((a, b) => b - a); // 降序排序
  print("18. 降序排序后: $numbers");

  numbers.shuffle(); // 随机打乱
  print("19. 打乱后: $numbers");

  // --------------------------
  // 截取与转换
  // --------------------------
  print("\n=== 截取与转换 ===");
  List<int> subList = numbers.sublist(1, 3); // 截取索引1到3（不含）的子列表
  print("20. 子列表: $subList");

  List<int> doubled = numbers.map((n) => n * 2).toList(); // 每个元素乘2
  print("21. 转换后: $doubled");

  List<int> filtered = numbers.where((n) => n > 3).toList(); // 过滤出大于3的元素
  print("22. 过滤后: $filtered");

  // --------------------------
  // 列表创建（静态方法）
  // --------------------------
  print("\n=== 列表创建 ===");
  List<int> generated = List.generate(3, (index) => index * 5); // 生成列表
  print("23. 生成的列表: $generated");

  List<int> fromList = List.from([10, 20, 30]); // 从其他可迭代对象创建
  print("24. 从列表创建: $fromList");
}
    
```



##### 4.2.5 Map（字典）

需求：声明`键值对的集合`，并使用与之相关联的键从中获取值（类似JS中的对象）

实现：字典关键字：`**Map**`

1. 存储商品分类的编号 和 名称
2. 对字典数据进行查改增删

2.1 查询：字典[key]

2.2 修改：字典[key] = 新值

2.3 新增：字典[新key] = 新值  (注意：key必须是当前字典中不存在的key，如果key已存在就是修改)

2.4 删除：remove(key)   (注意：如果key不存在，不会报错，也不会执行删除操作)

1. 遍历字典

- 定义字典语法

```dart
Map 变量名 = {
    '键1': 值1,
    '键2': 值2,
    ...,
};
```

- 例子：存储商品分类的编号 和 名称

```dart
void main() {
  // 1. 例子：存储商品分类的编号 和 名称
  Map category = {
    'id': 1,
    'name': '居家',
  };
  print(category); // {id: 1, name: 居家}
}
```

- 使用字典：查改增删

```dart
void main() {
  // 前端鸿蒙的对象类型 interface class 属性和类型是确定类型
  // Map Record 属于动态属性类型
  // map: Map<string, number> = new Map() get set -ComponentContent(uiContext, wrapBuilder, options）
  // key a b c d 要用Record和Map
  // username password interface class
  // 前端鸿蒙中只有两个类型能用[]取值, object 和Record
  // flutter Map
  Map goodsMap = {"goods_name": "连衣裙"}; // 类似前端 let obj = {}
  // 读取和设置属性
  goodsMap["goods_id"] = 10001; // 设置商品订单编号
  goodsMap["goods_price"] = 108.34; // 设置商品订单编号
  goodsMap["goods_count"] = 20; // 设置商品订单编号

  print(goodsMap);
  goodsMap.remove("goods_count");
  print(goodsMap);

  // 循环
  goodsMap.forEach((key, value) {
    print('当前的key:$key,当前的value:$value');
  });
}
```



##### 4.2.6 Dart空安全机制

如何尽早的发现并解决null带来的异常？

Dart提供了健全的`空安全机制`，默认所有的变量都是非空的，如果某个变量得到了一个null，则代码在编译期就会报错

1. 无法正常执行的代码：在代码编译期就会报错
2. 解决办法：使用 ? 显示的指定变量可以为空



   如何比较数字大小？

没有 === 和 !== 运算符

```dart
void main() {
  int n1 = 10;
  int n2 = 20;

  // 大于 >
  print(n1 > n2); // false
  // 小于 <
  print(n1 < n2); // true

  // 大于等于 >=
  print(n1 >= n2); // false
  // 小于等于 <=
  print(n1 <= n2); // true

  // 等于 ==
  print(n1 == n2); // false
  print('itcast' == 'itheima'); // false
  // 不等于 !=
  print(n1 != n2); // true
  print('itcast' != 'itheima'); // true
}
```

##### 4.3.4 逻辑运算符(同TS)

如果表示数据之间的逻辑关系？

```dart
void main() {
  // 年龄
  int age = 33;
  // 工作年限
  int years = 10;

  // 1. 逻辑与：一假则假
  // 年龄大于28岁，并且工作年限大于4年
  bool ret1 = age > 35 && years > 4;
  print(ret1); // false

  // 2. 逻辑或：一真则真
  // 年龄大于23岁，或者工作年限大于2年
  bool ret2 = age > 35 || years > 2;
  print(ret2); // true

  // 3. 逻辑非：真变假，假变真
  print(!true); // false
  print(!false); // true

  // 工作年限不小于9年
  bool ret3 = years >= 9;
  // bool ret3 = !(years < 9);
  print(ret3); // true
}
```



#### 4.4 流程控制（选择或重复执行）

##### 4.1.1 if分支语句(同TS)

单分支、双分支、多分支

```dart
void main() {
  // 1. if单分支语句
  // 准备高考成绩，如果分数大于等于700分，则输出 '恭喜考入黑马程序员'
  int score1 = 699;
  if (score1 >= 700) {
    print('恭喜考入黑马程序员');
  }

  // 2. if双分支语句
  // 准备高考成绩，如果分数大于等于700分，则输出 '恭喜考入黑马程序员'，反之，则输出 '继续努力'
  int score2 = 699;
  if (score2 >= 700) {
    print('恭喜考入黑马程序员');
  } else {
    print('继续努力');
  }

  // 3. if多分支语句
  // 根据学生分数划分学生成绩等级：
  // 优秀：分数大于等于90分
  // 良好：分数小于90分，且大于等于80分
  // 中等：分数小于80分，且大于等于60分
  // 不及格：分数小于60分
  int score3 = 58;
  if (score3 >= 90) {
    print('优秀');
  } else if (score3 >= 80) {
    print('良好');
  } else if (score3 >= 60) {
    print('中等');
  } else {
    print('不及格');
  }
}
```



##### 4.1.2 三元运算符(同TS)

简化简单的if双分支语句

```dart
void main() {
  // 需求：准备高考成绩，如果分数大于等于700分，则输出 '恭喜考入黑马程序员'，反之，则输出 '继续努力'
  // 思考：以下代码可以简化吗？
  int score1 = 699;
  // if (score1 >= 700) {
  //   print('恭喜考入黑马程序员');
  // } else {
  //   print('继续努力');
  // }

  // 1. 使用三元运算符简化if双语句：条件表达式 ? 表达式1 : 表达式2
  score1 >= 700 ? print('恭喜考入黑马程序员') : print('继续努力');

  // 2. 思考：以下代码适合使用三元运算符改写吗？
  int score2 = 88;
  if (score2 >= 90) {
    print('优秀');
  } else if (score2 >= 80) {
    print('良好');
  } else if (score2 >= 60) {
    print('中等');
  } else {
    print('不及格');
  }
}
```



##### 4.1.3 switch case 语句(同TS)3.使用可以为空的变量

```dart
void main() {
  // 如果在编译期间发现变量有可能为空 直接编译不过
  String? username; // username有可能为null也有可能为空字符串
  // 可以理解为 flutter String 和 null的联合类型
  // flutter 没有联合类型
  // 前端鸿蒙 avplayer: media.Avplayer | null = null
  print(username?.length);
  // ? 运行时检查和 ！非空断言
}
```

#### 4.3 运算符（数据如何做运算）

##### 4.3.1 算术运算符



```dart
void main() {
  // 加减乘除
  double salary = 10000; // 工资
  double start = 5000;
  double tax = (salary - start) * 0.05; // 税率
  double social = salary * 0.12; // 社保
  double fund = salary * 0.12; // 公积金
  double medicel = salary * 0.05; // 医保
  double other = salary * 0.02; // 养老 失业 生育 工伤
  double meals = 12 * 22; // 餐补
  double car = 10 * 22; // 车补
  double house = 500; // 房补

  print(
      '应发工资：$salary,实际发放工资：${salary - tax - social - fund - medicel - other + meals + car + house}');
}
```

##### 4.3.2 赋值运算符(同TS)

如何对数字做赋值运算?

```dart
void main() {
  // 等于 =
  int n1 = 10;

  // 加等于 +=
  // n1 = n1 + 5;
  n1 += 5;
  print(n1); // 15

  // 减等于 -=
  n1 -= 5;
  print(n1); // 10

  // 乘等于 *=
  n1 *= 5;
  print(n1); // 50

  // 除等于 /=
  // 注意：double类型的数据才能做除等于的操作
  // A value of type 'double' can't be assigned to a variable of type 'int'.
  // n1 /= 5;

  double n2 = 50;
  n2 /= 5;
  print(n2); // 10.0

  // 取余等于 %=
  int n3 = 10;
  n3 %= 3;
  print(n3); // 1

  // 自增：在原有数值上加1 ++
  int a = 10;
  a++;
  print(a); // 11

  // 自减：在原有数值上减1 --
  int b = 20;
  b--;
  print(b); // 19
}
```

##### 4.3.3 比较运算符

如果分支很多，且条件是**判断相等**，则switch case 语句性能比 if 分支语句要好

```dart
void main() {
  // 根据订单状态，打印出订单状态描述信息
  // 订单状态：1为待付款、2为待发货、3为待收货、4为待评价
  int orderState = 3;
  switch (orderState) {
    case 1:
      print('待付款');
      break;
    case 2:
      print('待发货');
      break;
    case 3:
      print('待收货');
      break;
    case 4:
      print('待评价');
      break;
    default:
      print('其他');
  }
}
```



##### 4.1.4 循环语句(同TS)

如何让代码重复执行？

循环语句：`while循环` **和** `for循环`

```dart
void main() {
    // 1. while循环
  // 重复打印10次 '月薪过万'
  int n = 0;
  while (n < 10) {
    print('$n -- 月薪过万');
    n++;
  }

  // 2. for循环
  // 重复打印5次 '李白姓白'
  for (var i = 0; i < 5; i++) {
    print('$i -- 李白姓白');
  }

  // 3. 使用循环遍历列表
  // 3.1 遍历列表：for循环
  List categories = ['居家', '美食', '服饰'];
  for (var i = 0; i < categories.length; i++) {
    String name = categories[i];
    print(name);
  }

  // 3.2 遍历列表：for ... in
  for (var item in categories) {
    // item就是遍历出来的元素
    print(item);
  }

  // 4. 终止循环
  // 4.1 break：中断整个循环
  for (var i = 0; i < 5; i++) {
    if (i == 2) {
      // 吃到第三个苹果发现了虫子，剩下的苹果没胃口都不吃了
      break;
    }
    print('我把第 ${i + 1} 个苹果吃了');
  }

  // 4.2 continue：跳过本次循环直接进入下一次循环
  for (var i = 0; i < 5; i++) {
    if (i == 2) {
      // 吃到第三个桃子发现了虫子，第三个桃子不吃了，剩下的桃子接着吃
      continue;
    }
    print('我把第 ${i + 1} 个桃子吃了');
  }
}
```

#### 4.5 基础语法 - 综合案例

需求：计算购物车数据中，被勾选商品的总价

```dart
void main() {
  // dynamic 动态类型 什么类型都可以 就是any
  List goodsList = [
    {"id": 1, "price": 22.68, "count": 3, "goods_name": "西瓜", "selectd": true},
    {"id": 2, "price": 11.99, "count": 3, "goods_name": "草莓", "selectd": true},
    {
      "id": 3,
      "price": 60.99,
      "count": 1,
      "goods_name": "车厘子",
      "selectd": false
    },
    {
      "id": 4,
      "price": 11.68,
      "count": 3,
      "goods_name": "平谷大桃",
      "selectd": false
    }
  ];

// fold相对于前端鸿蒙的reduce方法
// List中fold 和reduce 方法 都是累加计算 但是fold有初始值
  // 筛选所有的选中的商品
  double allValue = goodsList.where((item) => item["selectd"]).fold(
      0.0, (value, element) => value + element["count"] * element["price"]);
  print(allValue);
}
```

### 五、函数（复用代码）

#### 5.1 函数的定义

1. 定义函数：无参数无返回值函数
2. 定义函数：有参数有返回值函数
3. 函数的特点：

- 返回值类型和参数类型是可以省略的

```dart
void main() {
  print('计算的结果是：${add(1, 2)}');
  test();
}

// 前端鸿蒙 全局函数 function test () {}

// 前端鸿蒙 const add = () => {}

// flutter定义函数  省略返回类型 类型(void/其他类型) 函数名() {}
// 前面的类型是返回类型
int add(int a, int b) {
  return a + b;
}

// 没有返回类型的函数
void test() {
  print("执行test函数");
}

test1() {}
```

- 函数的特点：

- - 返回值类型和参数类型是可以省略的
  - 建议不省略

```dart
void main() {
  // 2. 调用无参数无返回值函数
  // func();
  
  // 4. 调用有参数有返回值函数
  int ret = sum(10, 20);
  print(ret); // 30
}

// 1. 定义函数：无参数无返回值函数
func() {
  print('这是一个无参数无返回值函数');
}

// 3. 定义函数：有参数有返回值函数
// 需求：定义函数，计算任意两个整数的和，并返回计算结果
// 特点2：返回值类型和参数类型是可以省略的
sum(a, b) {
  int ret = a + b;
  return ret;
}
```

#### 5.2 函数的参数

函数的参数可以分为：必传参数(位置参数)、可选参数(关键字参数)

注意点：必传参数不能为空，可选参数可以为空，且参数都可以设置默认值

```dart
void main() {
  // 函数的参数分必选参数和可选参数
  slice(1, null);
  getUserInfo(1, address: '北京昌平', age: 30, name: "大婶", sex: "男"); // 写法low到爆！！！
  testFunc(1, city: '广州', location: '天河');
}

// int? end的含义是 end的值可以为null，但是空必须得传 不传报错
slice(int start, int? end) {
  print('起始位置：$start, 结束位置：$end');
}

// 可选参数在声明的时候 要用{}把可选参数包裹起来
// 所有可选参数都加?

getUserInfo(int id,
    {String? name,
    int? age,
    String? sex,
    bool? isMarry = false,
    String? address}) {
  print('姓名：$name, 年龄：$age, 性别：$sex, 婚姻状态：$isMarry, 地址: $address');
}

testFunc(int id, {String location = '北京顺义', String city = "深圳"}) {
  print("当前的id:$id, 城市：$city, 位置: $location");
}
```



#### 5.3 函数对象

callback

把函数当成属性传递给使用方，

调用就是-方法名()

函数可以作为对象赋值给其他变量

函数可以作为参数传递给其他函数

```dart
void main() {
  // 匿名函数
  start((int a) {
    print("调用了函数:$a");
  });
}

// 声明一个函数
// callback: () => void
start(Function callback) {
  // capturer.on("readData", (bf) => )
  callback(1); // 谁写小括号谁是调用
}
```



#### 5.4 匿名函数

1. 匿名函数赋值给变量，并调用
2. 可以作为参数传递给其他函数去调用（回调函数）

```dart
void main() {
  // 匿名函数
  // 1. 匿名函数赋值给变量，并调用
  Function f = () {
    print('这是一个匿名函数');
  };
  f();

  // 2. 可以作为参数传递给其他函数去调用（回调函数）
  funcDemo(() {
    print('这个匿名函数是个参数');
  });
}

// 定义一个接收函数作为参数的函数
void funcDemo(Function func) {
  func();
}
```



#### 5.5 箭头函数

当函数体只有一行代码时，可以使用箭头函数简写

```dart
void main() {
  int ret1 = sum1(10, 20);
  print(ret1);

  int ret2 = sum2(30, 40);
  print(ret2);
}

// 思考：以下代码可以简写吗？
sum1(a, b) {
  return a + b; // 函数体只有一行代码
}

// 箭头函数简写函数体：简写只有一行代码的函数体
sum2(a, b) => a + b;
```



#### 5.6 函数 - 综合案例

需求：计算购物车中商品是否全选

```dart
void main() {
    // 准备购物车数据
  List carts = [
    {"count": 2, "price": 10.0, "selected": true},
    {"count": 1, "price": 30.0, "selected": false},
    {"count": 5, "price": 20.0, "selected": true}
  ];

  // 调用封装的函数
  bool isSelectedAll = getSelectedState(carts);
  if (isSelectedAll) {
    print('全选');
  } else {
    print('非全选');
  }
}

// 核心逻辑：只要有任何一个商品是未勾选的，那么就是非全选
bool getSelectedState(List carts) {
  // 购物车初始的状态：假设默认是全选
  bool isSelectedAll = true;

  carts.forEach((element) {
    bool selected = element['selected'];
    // 核心代码：只要有任何一个商品是非勾选的，则购物车就是非全选
    if (selected == false) {
      isSelectedAll = selected;
    }
  });
    // 返回是否全选结果
  return isSelectedAll;
}
```



### 
