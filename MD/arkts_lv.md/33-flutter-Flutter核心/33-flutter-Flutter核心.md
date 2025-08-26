# Flutter核心

环境搭建有点麻烦，特别是Android环境的安装，大家耐心安装

## 1. 如何搭建Flutter开发环境？

### 1.1 Mac搭建Flutter开发环境

参考文档：https://flutter.cn/docs/get-started/install/macos

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722123292439-82c34eb4-ce3c-449b-b5bc-2a7e67064674.png)

### 1.2 Windows搭建Flutter开发环境

参考文档：https://flutter.cn/docs/get-started/install/windows

#### 1.2.1 安装Flutter SDK

使用Flutter开发，首先我们需要安装一个Flutter的SDK。

**下载Flutter的SDK**

来到Flutter的官网网站，选择最新稳定的Flutter SDK的版本

- 网站地址：https://docs.flutter.cn/get-started/install/windows/mobile
- 选择自己的操作系统和最新稳定的版本（Stable版本）

**安装Flutter**

1. 解压下载好的Flutter SDK

- 这个在Windows和macOS都是一样的（选择一个自己想要安装的目录）

 ![img](https://cdn.nlark.com/yuque/0/2025/png/38706227/1743854906210-d8abca38-ed52-4430-be34-fbb8939294c5.png)



2.配置Flutter的环境变量

- 因为我们之后需要在命令行执行Flutter的命令，所以需要配置环境变量

macOS或者Linux系统，需要编辑`~/.bash_profile` 或者  `~/.zshenv`文件

```plain
export PATH=$PATH:/你的目录/flutter/bin
```

Windows用户将所在路径添加到环境变量的Path下

- Windows环境变量修改：点击计算机图标 - 属性 - 高级系统设置 - 高级 - 环境变量
- 找到Path，在其中添加Flutter SDK目录下`bin目录`

![img](https://cdn.nlark.com/yuque/0/2025/png/38706227/1743855005487-1121258a-e50e-4dff-9cdd-319b5959baf9.png)

在终端中执行 `flutter --version`，出现如下内容，说明安装flutter成功

![img](https://cdn.nlark.com/yuque/0/2025/png/38706227/1743855270966-d8e40fc5-7847-48ee-9624-6e31bee4ed25.png)



1. 配置镜像

flutter项目会依赖一些东西，在国内下载这些依赖会有一些慢，所以我们可以将它们的安装源换成国内的（也就是设置国内的镜像）

macOS或者Linux操作系统，依然是编辑`~/.bash_profile` 或者  `~/.zshenv`文件

```bash
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

Windows用户还是需要修改环境变量

- Windows环境变量修改：点击计算机图标 - 属性 - 高级系统设置 - 高级 - 环境变量
- 新建 变量 PUB_HOSTED_URL，其值为https://pub.flutter-io.cn
- 新建 变量 FLUTTER_STORAGE_BASE_URL， 其值为https://storage.flutter-io.cn

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722150659097-2ed039d5-7002-418c-9668-2c1a8563f7cd.png)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722150673124-31cc31d5-5448-497e-80f6-b984597da39e.png)

**注意：** 此镜像为临时镜像，并不能保证一直可用。



#### 1.2.2 安装Android Studio(windows版本)

如果想为Flutter配置Android开发环境，需要在我们的电脑上安装一个Android Studio

- Android Studio是基于IntelliJ IDEA的、Google 官方的 Android 应用集成开发环境 (IDE)。

**Android Studio的下载**

- 官网地址：https://developer.android.com/studio/?utm_source=android-studio
- 中文官方地址: https://developer.android.google.cn/studio?hl=zh-cn
- 直接在官方下载即可
- 安装直接双击安装即可

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722159339595-2f371c59-ba48-4b37-932e-c88d01f86921.png)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722159372895-01f2d38a-af5a-45e5-bb1a-2e9d0d79f3c9.png)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722159412511-ba9f6b92-b805-47cb-9c15-10bb1d1ccd0f.png)

**Android的环境配置**

打开Android Studio，会问我们是否要设置代理，这是因为下载Android SDK等在国内不好下载

- 至于如何设置代理，你懂的~~~

- 最好要设置代理哦，不然你会被气炸的~~~

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722149085844-d384cf3d-bc8a-4557-a379-15b5184f2413.png)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722149333097-404c8568-158e-4f9c-8b4d-0911519a5ff1.png)

之后各种下一步，就会帮我们安装SDK等相关需要使用的内容

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722150117607-c4e49e52-5b81-4bc9-a2e8-865bcff67e66.png)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722150157597-bb41371a-f553-4088-ad51-2e571d8725d5.png)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722159729637-ae7d35f7-0555-4c21-875e-d35b1c364e43.png)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722159751073-744c4703-55d0-43b9-821b-655f584d0be6.png)

注意: 此处得出去下载

由于自定义了`Android-SDK`的安装目录, 所以在运行`flutter doctor`命令之前，用`flutter Config`命令手动配置一下`Android SDK`的安装目录。

```bash
flutter config --android-sdk C:\dev\android_sdk
```

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722150957035-9f07eefe-d04c-44fd-89e2-2325e49f2b43.png)

运行`flutter doctor`命令, 提示还需要安装`cmdline-tools`,以及同意android-licenses协议条款。

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722151074894-17366179-c4d5-416b-a38f-0c0b2d480a45.png)

先安装一下最新的`Command-line Tools`，点击`apply`按钮后还会弹出一个确认框，点击确认框中的`OK`按钮。

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722159897888-0b5bc082-4c93-44b7-97eb-88c05b7d0ade.png)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722151163963-6d3d7a23-71c1-4dc1-aebc-f3b734287f7c.png)

再执行一下同意Android协议命令，会出现很多协议问询对话，都输y。

```bash
flutter doctor --android-licenses
```

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722151272909-9c548e8a-a11f-421e-a6d3-00a8bf6fd378.png)

安装配置完`Android Studio`之后运行`flutter doctor`,重新检查平台依赖安装情况, 可以看到，一切都OK了。

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722159990501-521e28ac-30e5-4d76-9159-399f53f1c3eb.png)

常见报错:

https://blog.csdn.net/weixin_43748192/article/details/124868144

https://juejin.cn/post/7348363812948230183

点击`Plugins`开始安装`Dart`和`Flutter`插件:

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722152815130-5aec7f01-bb7c-4867-ab68-d0fe36f27fe0.png)

安装Flutter插件时，会弹出一个窗口,说这个插件不是来自`JetBrains`, `JetBrains`对任何第三方插件供应商对您的个人数据的任何处理不承担任何责任。要用自行承担风险，这里选择接受。安装之后按照提示重启`Android Studio`。

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722152849088-12f4058c-2e1c-42fc-92b9-d7ae609794b8.png)

重启之后, 你会发现出现一个`New Flutter Project`的菜单图标，现在flutter的开发环境已经配置好了，接下来我们创建自己的第一个flutter项目。

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722152926763-3b0fb046-3fe4-48f9-8252-826a26519ef5.png)

**创建flutter项目**

点击`New Flutter Project`的菜单图标之后,选择左侧的`Flutter`导航菜单,接着在右侧选择`Flutter`安装目录。

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722153135540-56437727-fe6a-4a54-b1d1-28650caf4a76.png)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722153340337-d0db39a3-f47c-47c3-a053-6d668067ab60.png)

点击创建之后，项目就创建好了。想看flutter项目运行效果，还得安装手机模拟器。

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722153532605-526006f6-d9c4-4965-90b6-161f2c06b61e.png)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722160510558-ee9458c5-7442-412d-ada9-7e21798f0964.png)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722160551039-e4638d57-92f9-4a43-bc8e-10ea6a19b57b.png)

启动模拟器

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722153774180-20a34a8a-7f3e-443d-94b4-5ceca4792b68.png)

**运行flutter项目**

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722160867523-3c1ce236-7bd0-47f8-887e-e7b0970b01ff.png)

## 2. Flutter起步

鸿蒙化版本的flutter

国内进行了鸿蒙化适配Flutter版本，3.7版本

### 2.1 创建Flutter工程

创建项目可以用上边的Android Studio, 也可以用命令行创建; 如果是用vscode开发flutter项目, 建议用命令行, 降低学习成本;

注意点：工程名不能使用中划线 `-`，多个单词相连需要使用下划线 `_`

```bash
flutter create 工程名
```

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722123604815-b0697e80-e20d-40a2-804b-890e54d4c86b.png)

项目目录结构: 

![img](https://cdn.nlark.com/yuque/0/2025/png/38706227/1743857156882-8804f9e5-c43f-4dbd-9a29-32e3af7e1853.png)

开发中，可以很方便的使用 **VSCode**编写代码并运行项目（需要先安装Flutter插件）

- 鸿蒙模拟器设备能够监测到-只有Mac-Arm版本才可以监测到

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1744015552918-f95fb1b8-6156-48f5-a17a-0cb424d5a00f.png?x-oss-process=image%2Fformat%2Cwebp)

### 2.2 安装Flutter插件

Flutter插件：VSCode中支持Flutter开发工作流 (运行、调试、热重载等)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722155973033-a5edd9c1-b3ce-4d8e-884e-b4480f4879e6.png)

### 2.3 启动程序

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722161019490-5183b1f4-f4c8-4870-b857-ab54625267e3.png)

运行在Android模拟器:

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722161163508-dda27f14-e38b-4547-9b39-90a989cbc6ae.png)

运行在iOS模拟器:

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722125323523-e327411b-961b-42f5-89f3-5ceecba13e56.png)

运行在Web端:

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722161254143-deadae63-96f9-49a5-8fcb-2ad6a50aee00.png)

运行在鸿蒙端:

![img](https://cdn.nlark.com/yuque/0/2025/png/38706227/1743857232425-e4dcca8b-fd5d-4419-9b30-81d5bf3614b7.png)

### 2.4. 体验Flutter热重载

对于我们开发测试阶段，如果每次修改代码都需要重新编译整个项目再加载的话，那每次可能都需要花费10秒左右甚至是几分钟的时间（电脑太慢的话），这样的开发效率是非常低的。

现在前端开发都支持热重载（Hot Reload），可以大大加快我们的开发效率。

- 热重载可以在无需重新编译代码、重新启动应用程序的情况下，看到修改后界面的效果

Flutter在开发阶段使用JIT编译模式（后面我会讲解什么是JIT模式），所以可以做到热重载来提高我们的开发效率

**下面我们体会一下热重载，后面有时间我们来分析热重载是如何实现的**

将下面红框中的内容改成Hello Flutter，保存一下应用程序

- 你会发现在不到1秒钟内，界面直接发生了刷新
- 并且没有应用程序没有进行任何的重新，效率非常高

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722125577837-d36e9860-dc65-4790-9c93-9d61bad013a0.png)

如果热重载不起作用，我们也可以点击右上角的 Hot Restart，并不需要重新运行项目

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722125646737-40748d31-34a6-4b12-80ff-d9becd2342d0.png)

### 2.5 工程目录分析

Flutter工程创建完毕会，会感觉比较复杂，我们来看下图：

```bash
.
├── android # Android项目目录
├── build # 存放的是各个平台对应的编译后的可执行文件，代码编译后才有的目录
├── ios # iOS项目目录
├── lib # 业务代码目录
│   └── main.dart # 程序启动文件
├── linux # Linux项目目录
├── macos # macOS项目目录
├── pubspec.yaml # 配置项目依赖：安装依赖插件、配置资源路径...
├── test # 编写测试代码目录
├── web # Web项目目录
└── windows # Windows项目目录
```

android、ios、linux、macos、web、windows 这几个目录存放的是对应平台的项目文件

里面的项目目录结构就是对应平台完整的项目目录结构，对应平台的开发工具可以打开并进行编译、修改等操作。

### 2.6 启动文件说明

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722126937048-5e0b5fb7-22c7-4788-9393-ed1922794da2.png)

#### 2.6.1. runApp和Widget

**runApp**是Flutter内部提供的一个函数，当我们启动一个Flutter应用程序时就是从调用这个函数开始的

```dart
runApp(传入一个Widget)
```

该函数让我们传入一个东西：**Widget**？

我们先说**Widget的翻译**：

- Widget在国内有很多的翻译；
- 做过Android、iOS等开发的人群，喜欢将它翻译成**控件**；
- 做过Vue、React等开发的人群，喜欢将它翻译成**组件**；
- 如果我们使用Google，Widget翻译过来应该是**小部件**；
- 没有说哪种翻译一定是对的，或者一定是错的，但是我个人更倾向于**小部件或者组件**；

**Widget**到底什么东西呢？

- 我们学习Flutter，从一开始就可以有一个基本的认识：**Flutter中万物皆Widget（万物皆可盘）**；
- 在iOS/Android/HarmonyOS开发中，我们的界面有很多种类的划分：应用（Application）、视图控制器（View Controller）、活动（Activity）、View（视图）、Button（按钮）等等；
- 但是在Flutter中，**这些东西都是不同的Widget而已**；
- 也就是我们整个应用程序中`所看到的内容`几乎都是Widget，甚至是`内边距的设置`，我们也需要使用一个叫`Padding的Widget`来做；

runApp函数让我们传入的就是一个Widget：

- 但是我们现在没有Widget，怎么办呢？
- 我们可以导入Flutter默认已经给我们提供的Material库，来使用其中的很多内置Widget；

#### 2.6.2. Material设计风格

**material是什么呢？**

- material是Google公司推行的一套`设计风格`，或者叫`设计语言`、`设计规范`等；
- 里面有非常多的设计规范，比如`颜色`、`文字的排版`、`响应动画与过度`、`填充`等等；
- 在Flutter中高度集成了`Material风格的Widget`；
- 在我们的应用中，我们可以直接使用这些Widget来创建我们的应用（后面会用到很多）；

### 2.7 页面结构说明

## ![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722127516137-adf03961-5f23-45f7-b3aa-7aca2e4335dd.png)  3. Flutter初体验

### 3.1 Flutter组件拆解

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722265937206-cb175a07-f991-4295-9d75-0a7bd4de5f3c.png)

每一个flutter项目的lib目录里面都有一个`main.dart`,  这个文件就是flutter的入口文件

```dart
void main(){
  runApp(MyApp());
}
```

1. main方法是dart的入口方法。
2. runApp方法是flutter的入口方法。
3. MyApp是自定义的一个组件。



**Step1:  简单布局**

```dart
import 'package:flutter/material.dart';

void main() {
  // 1. 启动项目, 并传入根组件实例对象
  runApp(const Center(
    child: Text(
      'Hello, Flutter',
      textDirection: TextDirection.ltr,
    ),
  ));
}
```



**Step2:  加点样式**

```dart
import 'package:flutter/material.dart';

void main() {
  // 1. 启动项目, 并传入根组件实例对象
  runApp(const Center(
    child: Text(
      'Hello, Flutter',
      textDirection: TextDirection.ltr,
      style: TextStyle(
          fontSize: 30.0, color: Colors.red, fontWeight: FontWeight.bold),
    ),
  ));
}
```



**Step3: 使用MaterialApp 和 Scaffold两个组件装饰App**

**MaterialApp**

在最外层包裹一个**MaterialApp**

- 这意味着整个应用我们都会采用MaterialApp风格的一些东西，方便我们对应用的设计，并且目前我们使用了其中两个属性；
- title：这个是定义在Android系统中打开多任务切换窗口时显示的标题；（暂时可以不写）
- home：是该应用启动时显示的页面，我们传入了一个Scaffold；



**Scaffold**是什么呢？

- 翻译过来是`脚手架`  / `骨架`，脚手架的作用就是搭建页面的基本结构；
- 所以我们给MaterialApp的home属性传入了一个Scaffold对象，作为启动显示的Widget；
- Scaffold也有一些属性，比如`appBar`和`body`；
- appBar是用于设计导航栏的，我们传入了一个`title属性`；
- body是页面的内容部分，我们传入了之前已经创建好的Center中包裹的一个Text的Widget；

```dart
import 'package:flutter/material.dart';

void main() {
  // 1. 启动项目, 并传入根组件实例对象
  runApp(MaterialApp(
    home: Scaffold(
      // 1.1 导航
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Hello Flutter'),
      ),
      // 1.2 主体部分
      body: const Center(
        child: Text(
          'Hello, Flutter',
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 30.0, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  ));
}
```



**Step4: 把内容单独抽离成一个组件**

在Flutter中自定义组件其实就是一个类，这个类需要继承StatelessWidget/StatefulWidget。



1. StatelessWidget 是无状态组件，状态不可变的widget
2. StatefulWidget 是有状态组件，持有的状态可以在widget生命周期改变

PS: 前期我们都继承StatelessWidget。后期给大家讲StatefulWidget的使用。

```dart
import 'package:flutter/material.dart';

void main() {
  // 1. 启动项目, 并传入根组件实例对象
  runApp(MaterialApp(
    home: Scaffold(
      // 1.1 导航
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Hello Flutter'),
      ),
      // 1.2 主体部分
      body: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hello, Flutter',
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 30.0, color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
```

### 3.2 Flutter组件

Flutter是以组件化的思想构建客户端页面的，类似于 vue 和 react，每个组件都有独立的结构、样式和交互

Flutter的组件分为两大类：**无状态组件** 和 **有状态组件**

- **StatelessWidget：** 没有状态改变的Widget，通常这种Widget仅仅是做一些展示工作而已；这个组件中只负责(只能)渲染和现实内容;eg:新闻页和详情(只读),订单,页面能传参,请求渲染数据
- **StatefulWidget：** 需要保存状态，并且可能出现状态改变的Widget；渲染后 内容,还需要更新状态,视图需要重新刷新,eg:可改页面 购物车,列表 

#### 3.2.1 无状态组件

无状态组件：**纯展示型组件**，一旦构建完成**状态不能改变**的组件

- 它们的数据通常是直接写死（放在Widget中的数据，必须被定义为final）；
- 从parent widget中传入的而且一旦传入就不可以修改；



**如何定义无状态组件?**

让自己创建的Widget继承自`StatelessWidget`的组件类即可,  StatelessWidget包含一个必须重写的方法：build方法；

提示：`build`方法是组件的生命周期方法，构建组件时会自动调用的（后面会讲组件的生命周期）

定义无状态组件:

```dart
// ignore_for_file: file_names, must_be_immutable, avoid_print

import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {
  MyApp2({super.key, this.hobby});

  final String name = '张三';
  int age = 19;

  String? hobby;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '无状态组件',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text('姓名: $name, 年龄: $age, 爱好: $hobby'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('+'),
        onPressed: () {
          age = age + 1;
          print(age);
        },
      ),
    );
  }
}
```

展示无状态组件 MyApp1:

```dart
import 'package:f_demo_one/components/02_%E6%97%A0%E7%8A%B6%E6%80%81%E7%BB%84%E4%BB%B6.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp2(
    hobby: '敲代码',
  )));
}
```

#### 3.2.2 有状态组件

在开发中，某些Widget情况下我们展示的数据并不是一直不变的, 

比如: Flutter默认程序中的计数器案例，点击了+号按钮后，显示的数字需要+1；

比如: 在开发中，我们会进行下拉刷新、上拉加载更多，这时数据也会发生变化；

而StatelessWidget通常用来展示那些数据固定不变的，如果数据会发生改变，我们要使用StatefulWidget；

**什么是有状态组件?**

有状态组件是可交互可展示的组件，一旦构建完成，组件的状态还会发生改变，并且可以在其生命周期中多次改变。

**如何定义有状态组件?**

定义继承自`StatefulWidget`的组件类即可



提示：

`createState`方法是组件的生命周期方法

 初始化组件时会自动调用的（后面会讲组件的生命周期）

```dart
// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';

class MyApp3 extends StatefulWidget {
  const MyApp3({super.key});

  @override
  State<MyApp3> createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  // 定义状态变量
  String name = '张三';
  int age = 30;
  String hobby = '敲代码';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '有状态组件',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text('姓名: $name, 年龄: $age, 爱好: $hobby'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('+'),
        onPressed: () {
          setState(() {
            age = age + 1;
            print(age);
          });
        },
      ),
    );
  }
}
void main() {
  // 1. 启动项目, 并传入根组件实例对象
  runApp(
    const MaterialApp(
      home: MyApp3()
    )
  );
}
```

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722436507133-336b01c1-1764-4892-ae01-eb49a759b372.png)

**如何刷新有状态组件?**



`StatefulWidget` 有状态，状态在 State 的子类中，通过调用 **setState()** 方法更新状态

```dart
import 'package:flutter/material.dart';

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  // 年龄状态
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('有状态组件'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text(
          '我叫朱丽叶, 今年$age岁',
          style: const TextStyle(color: Colors.red, fontSize: 20.0),
        ),
      ),
      // 右下角悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            age++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722437333143-9b79683d-03b4-47d1-979e-344ca8fd3aee.png)![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722437356912-11e3b868-9834-4df4-8d90-54a44a8c3f90.png)

#### 3.2.3 组件生命周期

`StatelessWidget` 为无状态组件，执行完 `build` 即渲染完毕，生命周期方法只有`build`，更新内容也只能通过重新创建实现。

`StatefulWidget`有状态的组件，有完整的生命周期，组件创建完毕之后，还可以继续更新自己的状态。

为了练习方便，设置项目忽略部分错误提示



```yaml
# 代码分析器（analyzer）
analyzer:
  # 错误分析
  errors:
    #camel_case_types: ignore
    # 忽略对使用 print 函数的警告
    avoid_print: ignore
    # 忽略文件命名不符合规范的警告
    file_names: ignore
    # 忽略变量应为不可变（immutable）的警告
    must_be_immutable: ignore
    # 忽略在 createState 方法中包含逻辑的警告
    no_logic_in_create_state: ignore
```



**有状态组件生命周期**

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722437569754-445df6ae-b698-4968-a9ba-4416134c80a1.png)

1. **初始化阶段**

- - `createState`：当`State`组件开始被创建时会自动调用，生命周期内只会执行一次
  - `**initState**`：当 `State` 被初始化时会自动调用，生命周期内只会执行一次

- - - 我们通常会在这个方法中执行一些数据初始化的操作，或者也可能会发送网络请求；
    - 注意：这个方法是重写父类的方法，必须调用super，因为父类中会进行一些其他操作

1. **更新阶段**

- - `didChangeDependencies`：当 `State` 依赖的数据改变时，即初始化时或者是外部传入的数据改变时自动调用的, 这个方法在两种情况下会调用:

- - - 情况一：调用initState会调用；
    - 情况二：从其他对象中依赖一些数据发生改变时，比如前面我们提到的InheritedWidget（这个后面会讲到）；

1. **构建阶段**

- - `**build**`：构建组件结构并返回渲染好的组件实例，生命周期内会被执行多次

- - - 手动调用setState方法，会根据最新的状态（数据）来重新调用build方法，构建对应的Widgets；

- - `didUpdateWidget`：该方法主要是组件重新构建时才会被调用的

- - - 比如：热重载 或者 父组件发生 `build` 时子组件的该方法就会被调用
    - 注意：该方法被调用后，本组件中的 `build` 方法一定也会再被调用

1. **销毁阶段**

- - `**deactivate**`：组件从节点中移除时会自动调用，可以监听组件是否即将被销毁
  - `dispose`：释放组件内存资源时会自动调用，可以监听组件是否被彻底销毁

```dart
import 'package:flutter/material.dart';

class MyApp3 extends StatefulWidget {
  const MyApp3({super.key});

  // 1. 创建组件时调用
  @override
  State<MyApp3> createState() {
    debugPrint('createState');
    return _MyApp3State();
  }
}

class _MyApp3State extends State<MyApp3> {
  // 年龄状态
  int age = 18;

  // 2. 组件被初始化时调用
  // 一般用于: 对组件变量赋值, 请求网络数据, 更新状态
  @override
  void initState() {
    debugPrint('initState');
    super.initState();
  }

  // 3. 状态组件的依赖项发生变化时调用
  // 只会被执行1次
  @override
  void didChangeDependencies() {
    debugPrint('didChangeDependencies');
    super.didChangeDependencies();
  }

  /// 5. 组件即将销毁时自动调用的
  @override
  void deactivate() {
    debugPrint('deactivate');
    super.deactivate();
  }

  /// 6. 组件销毁时自动调用的
  @override
  void dispose() {
    debugPrint('dispose');
    super.dispose();
  }

  // 4. 组件状态更新时自动调用
  // 会调用多次
  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('有状态组件'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text(
          '我叫朱丽叶, 今年$age岁',
          style: const TextStyle(color: Colors.red, fontSize: 20.0),
        ),
      ),
      // 右下角悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            age++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
```



- 父组件传值子组件

```typescript
import 'package:demo_three/components/03_%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp3(parentName: '不知火舞')));
}
```

- 子组件

```typescript
// ignore_for_file: file_names, no_logic_in_create_state, must_be_immutable

import 'package:flutter/material.dart';

class MyApp3 extends StatefulWidget {
  MyApp3({super.key, required this.parentName});

  String parentName;

  // 1. 创建组件时调用
  @override
  State<MyApp3> createState() {
    debugPrint('createState');
    return _MyApp3State();
  }
}

class _MyApp3State extends State<MyApp3> {
  // 年龄状态
  int age = 18;

  String? name;

  // 2. 组件被初始化时调用
  // 一般用于: 对组件变量赋值, 请求网络数据, 更新状态
  @override
  void initState() {
    debugPrint('initState');
    name = widget.parentName;
    super.initState();
  }

  // 3. 状态组件的依赖项发生变化时调用
  // 只会被执行1次
  @override
  void didChangeDependencies() {
    debugPrint('didChangeDependencies');
    super.didChangeDependencies();
  }

  /// 5. 组件即将销毁时自动调用的
  @override
  void deactivate() {
    debugPrint('deactivate');
    super.deactivate();
  }

  /// 6. 组件销毁时自动调用的
  @override
  void dispose() {
    debugPrint('dispose');
    super.dispose();
  }

  // 4. 组件状态更新时自动调用
  // 会调用多次
  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('有状态组件'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text(
          '我叫$name, 今年$age岁',
          style: const TextStyle(color: Colors.red, fontSize: 20.0),
        ),
      ),
      // 右下角悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            age++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### 3.3 Flutter常用组件

#### 3.3.1 Container组件

用于绘制矩形区域：可以设置区域宽高、内外间距、装饰效果、内容对齐方式等等

注意：如果设置了`decoration属性`，则背景色必须在`decoration属性`中设置

| **属性**                           | **描述**                                         |
| ---------------------------------- | ------------------------------------------------ |
| width                              | 宽度                                             |
| height                             | 高度                                             |
| color                              | 背景色                                           |
| margin                             | 外间距EdgeInsets.all / EdgeInsets.fromLTRB / ... |
| padding                            | 内间距                                           |
| decoration                         | BoxDecoration( color：设置矩形区域背景色         |
| border：设置矩形区域外边框         |                                                  |
| borderRadius：设置矩形区域边框圆角 |                                                  |
| image：设置矩形区域背景图          |                                                  |
| shape：设置矩形区域形状            |                                                  |
| ......)                            |                                                  |
| child                              | 指定子组件                                       |
| alignment                          | 内容对齐方式：Alignment.center 居中对齐          |

```dart
import 'package:flutter/material.dart';

class ContainerComp extends StatelessWidget {
  const ContainerComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container组件的使用'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        // 1. 设置背景颜色
        // 默认是占满整个页面
        // color: Colors.green,
        // 2. 设置宽和高
        width: 300.0,
        height: 500.0,
        // 3. 设置外边距
        // margin: const EdgeInsets.all(30),
        // margin: const EdgeInsets.fromLTRB(10, 20, 30, 40)
        margin: const EdgeInsets.only(left: 30, top: 30),
        // 4. 设置内边距
        padding: const EdgeInsets.all(30),
        // 7. 设置装饰效果
        decoration: BoxDecoration(
          // 7.0 一旦设置了decoration, 背景必须写在这里面
          color: Colors.green,
          // 7.1 设置边框
          border: Border.all(color: Colors.red, width: 6),
          // 7.2 设置圆角
          borderRadius: BorderRadius.circular(20)
        ),
        // 5. 指定子组件
        child: Container(
          color: Colors.orange,
          // 6. 设置内容对齐方式
          alignment: Alignment.center,
          child: const Text('喜欢IT, LikeIT'),
        ),
      ),
    );
  }
}
```

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722468860833-f724eb41-c34f-4659-992f-89773d82c75f.png)

#### 3.3.2 Text组件

用于展示文本信息：可以设置文字样式、文字对齐方式、文字最大行数、文字溢出显示效果等等

| **属性**                    | **描述**                                    |
| --------------------------- | ------------------------------------------- |
| style                       | color：文字颜色                             |
| backgroundColor：组件背景色 |                                             |
| fontSize：字号              |                                             |
| fontWeight：粗细            |                                             |
| fontStyle：倾斜             |                                             |
| ......                      |                                             |
| textAlign                   | 文字对齐方式：TextAlign.right 居右对齐      |
| maxLines                    | 文字最大行数                                |
| overflow                    | 超出部分显示方式，比如TextOverflow.ellipsis |

```dart
import 'package:flutter/material.dart';

class TextComp extends StatelessWidget {
  const TextComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text组件'), backgroundColor: Colors.red,),
      body: const Text(
        '《春宵》 苏轼 \n 春宵一刻值千金，花有清香月有阴。\n 歌管楼台声细细，秋千院落夜沉沉。',
        style: TextStyle(
          color: Colors.pink, 
          fontSize: 20, 
          fontStyle: FontStyle.italic
        ),
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis
      ),
    );
  }
}
```

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722469993132-f4f2454b-3060-4429-84bb-b113766e5bbe.png)

#### 3.3.3 Image组件

用于展示图片：可以展示网络图片、小图标、本地图片、内存图片

网络图片：`Image.network()`

资源图标：`Image.asset()`

文件系统图片：`Image.file()`

内存二进制图片：`Image.memory()`

| **属性**                 | **描述**                                                     |
| ------------------------ | ------------------------------------------------------------ |
| width                    | 宽度                                                         |
| height                   | 高度                                                         |
| fit (图片适应控件的方式) | 适应模式是在`BoxFit`中定义，它是一个枚举类型，有如下值：`fill`：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。`cover`：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。`contain`：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。`fitWidth`：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。`fitHeight`：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。`none`：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。 |

1. **展示网络图片**

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722473232507-ce98a37b-8721-4b0e-9051-1ab955d8a200.png)

```dart
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image组件'),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 400.0,
          color: Colors.red,
          // 展示网络图片
          child: Image.network(
            'https://yanxuan-item.nosdn.127.net/e529b6ab111ade9da9314867f98d360f.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
```



**2. 展示小图标**

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722473843345-230c69f7-73e0-495b-a1b0-6bb8743e5933.png)

① 在工程根目录下，新建静态资源文件目录 `/assets/`

- 需要区分1倍图、2倍图、3倍图，图标在加载时会根据客户端的像素比自动的识别对应倍数的图标
- 注意点：如果要使用新加的静态资源，需要重启来运行程序，不要使用热重载启动程序

[assets.zip](https://www.yuque.com/attachments/yuque/0/2025/zip/38706227/1749275583243-ff32edc5-bf70-4714-969e-5b1cef76bf96.zip)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722473517330-9c33b5de-5fd4-4c74-82cf-71b1493050d8.png)



② 在`pubspec.yaml` 文件中，配置静态资源加载路径

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722473552428-908f4436-7b28-4cb4-8e2b-a22ee307eaef.png)



```dart
import 'package:flutter/material.dart';

class ImageComp extends StatelessWidget {
  const ImageComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image组件'), backgroundColor: Colors.pink,),
      body: Center(
        child: Container(
            width: 300,
            height: 400,
            color: Colors.green,
            // 2. 本地图片
            child: Image.asset('qiche.png'),
          ),
      )
    );
  }
}
```

#### 3.3.4 布局组件

1. **线性布局 (**垂直布局 和 水平布局**)**

**垂直布局：**`**Column**`**组件**

```dart
class Column extends Flex {
  const Column({
    super.key,
    super.mainAxisAlignment, // 主轴对齐方式
    super.mainAxisSize, // 主轴大小
    super.crossAxisAlignment, // 侧轴对齐方式
    super.textDirection,
    super.verticalDirection, // 子级排序：支持正序和倒序
    super.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    super.children, // 水平布局的所有子级
  }) : super(
    direction: Axis.vertical,
  );
}
```

Demo素材:

https://yanxuan-item.nosdn.127.net/72e734dd1a4d35ce650afebdaa600b57.png

美妆效果嘎嘎不卡粉末面刷

¥99.90

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722476192429-aa2b6580-4476-4964-a136-4debaeb89fe6.png)

```dart
// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ColumnComp extends StatelessWidget {
  const ColumnComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column组件'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 400.0,
          color: Colors.cyan,
          child: Column(
            // 主轴对齐方式:
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // 侧轴对齐方式
            // crossAxisAlignment: CrossAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Image.network(
                'https://yanxuan-item.nosdn.127.net/72e734dd1a4d35ce650afebdaa600b57.png',
                width: 200,
              ),
              const SizedBox(height: 10),
              const Text('美妆效果嘎嘎不卡粉末面刷'),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('¥99.90'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
```



**水平布局：**`**Row**`**组件**

```dart
class Row extends Flex {
  const Row({
    super.key,
    super.mainAxisAlignment, // 主轴对齐方式
    super.mainAxisSize, // 主轴大小
    super.crossAxisAlignment, // 侧轴对齐方式
    super.textDirection,
    super.verticalDirection, // 子级排序：支持正序和倒序
    super.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    super.children, // 水平布局的所有子级
  }) : super(
    direction: Axis.vertical,
  );
}
```

Demo素材:

https://yanxuan-item.nosdn.127.net/afd6199278a5b8fd783bc4947960fabc.jpg

茶水分离杯耐热隔热玻璃杯

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722476798519-5a2336b8-744d-460b-9e4c-a93799a58e66.png)

```dart
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RowComp extends StatelessWidget {
  const RowComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row组件'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          height: 100,
          color: Colors.cyan,
          child: Row(
            // 1. 主轴对齐方式
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // 2. 侧轴底气方式
            // crossAxisAlignment: CrossAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.network(
                  'https://yanxuan-item.nosdn.127.net/afd6199278a5b8fd783bc4947960fabc.jpg',
                  width: 86),
              const Text('茶水分离杯耐热隔热玻璃杯'),
              const Icon(Icons.favorite)
            ],
          ),
        ),
      ),
    );
  }
}
```



1. **弹性布局** 

`Expanded` 组件是用于展开(扩展 ,放大)`Column`、`Row`和`Flex`的所有子级的组件

使用`Expanded`可以使`Column`、`Row`和`Flex`的所有**子级扩展以填充主轴中的可用空间**，从而实现弹性布局

```dart
class Expanded extends Flexible {
  /// Creates a widget that expands a child of a [Row], [Column], or [Flex]
  /// so that the child fills the available space along the flex widget's
  /// main axis.
  const Expanded({
    super.key,
    super.flex, // 子级的弹性系数
    required super.child, // 子级
  }) : super(fit: FlexFit.tight);
}
```

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722478383905-b73747f8-4d15-47e1-ab1e-3ac227c95b84.png)

```dart
import 'package:flutter/material.dart';

class ExpandedComp extends StatelessWidget {
  const ExpandedComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text('Expanded布局'), backgroundColor: Colors.red,),
     body: Center(
      child: Container(
        height: 100,
        color: Colors.cyan,
        child: Row(
          children: [
            // 占1/7
            Expanded(
              flex: 1,
              child: Container(
                height: 86,
                color: Colors.red,
              )
            ),
            // 占4/7
            Expanded(
                flex: 4,
                child: Container(
                height: 86,
                color: Colors.green,
              )
            ),
            // 占2/7
            Expanded(
              flex: 2,
              child: Container(
                height: 86,
                color: Colors.pink,
              )
            ),
          ],
        ),
      ),
     ),
    );
  }
}
```

Expanded组件拓展：使用`Expanded`组件可以解决文字超出区域溢出的问题

Demo素材:

https://yanxuan-item.nosdn.127.net/afd6199278a5b8fd783bc4947960fabc.jpg

茶水分离杯耐热隔热玻璃杯 茶水分离杯耐热隔热玻璃杯

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722479799255-9b13427f-6011-4428-97c4-6b833f4c6bd1.png)![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722480049645-ab3f9266-c2ec-416c-b778-5607c5f366d3.png)

```dart
import 'package:flutter/material.dart';

class ExpandedComp2 extends StatelessWidget {
  const ExpandedComp2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expanded扩展'), backgroundColor: Colors.pink,),
      body: Center(
        child: Container(
          height: 100,
          color: Colors.red,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.network(
                'https://yanxuan-item.nosdn.127.net/afd6199278a5b8fd783bc4947960fabc.jpg',
                width: 86,
              ),
              
              // 问题：文字超出了父组件的范围
              // const Text('茶水分离杯耐热隔热玻璃杯 茶水分离杯耐热隔热玻璃杯'),

              // 解决：使用Expanded弹性布局组件解决文字溢出的问题
              const Expanded(
                child: Text('茶水分离杯耐热隔热玻璃杯 茶水分离杯耐热隔热玻璃杯'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```



1. **层叠布局** 

层叠布局：相似于`CSS`中的绝对定位，子级根据距离父级四个角的位置来确定自身的位置，且子级是按照代码编写顺序堆叠起来的

层叠布局实现：`Stack` 和 `Positioned` 组件组合

`Stack`组件：可以让子级堆叠起来

`Positioned`组件：可以根据`Stack`组件的四个角来确定子部件的具体位置

```dart
class Stack extends MultiChildRenderObjectWidget {
  const Stack({
    super.key,
    this.alignment = AlignmentDirectional.topStart, // 没有定位的子组件或者子组件只进行了部分定位时的对齐方式
    this.textDirection,
    this.fit = StackFit.loose, // 确定没有定位的子组件如何适应Stack的大小
    this.clipBehavior = Clip.hardEdge, // 决定如何显示超出了Stack显示区域的子组件
    super.children,
  });
}
```

小demo:

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722486922456-6635af3c-5577-4139-89c4-907bcdb10a08.png)

```dart
import 'package:flutter/material.dart';

class StackComp extends StatelessWidget {
  const StackComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('堆叠容器'), backgroundColor: Colors.pink,),
      body: Center(
        child: Stack(
          // 超出部分处理
          // 1. 不裁剪超出部分
          clipBehavior: Clip.none,
          // 2. 组件对齐方式
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.cyan,
            ),
            // Image组件参照Container四个角定位
            Positioned(
              top: -105,
              child: Image.asset('assets/open_eyes.png')
            )
          ],
        ),
      ),
    );
  }
}
```



1. **综合小练习-订单商品信息卡片**

demo数据素材:

```dart
 {
    "createTime": "2024-08-15 21:49:48",
    "orderState": 2,
    "image": "https://yanxuan-item.nosdn.127.net/a09de222ed32efa8ffe359b1d5780574.jpg",
    "name": "茶水分离杯耐热隔热玻璃杯",
    "totalNum": 2,
    "curPrice": 119.5,
    "totalMoney": 119.5,
    "attrsText": "规格:白色240ml"
}
```

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722495710652-a96d4c6a-2edc-485b-9ce2-e4959bf063de.png)

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DemoComp extends StatelessWidget {
  const DemoComp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. 提供的数据
    const Map orderInfo = {
      'createTime': "2024-08-15 21:49:48",
      'orderState': "待发货",
      'image':
          "https://yanxuan-item.nosdn.127.net/a09de222ed32efa8ffe359b1d5780574.jpg",
      'name': "茶水分离杯耐热隔热玻璃杯茶水分离杯耐热隔热玻璃杯",
      'totalNum': 2,
      'curPrice': 119.5,
      'attrsText': "规格: 白色240ml"
    };

    return Scaffold(
        appBar:
            AppBar(title: const Text('案例-商品订单信息'), backgroundColor: Colors.red),
        body: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child:  Column(
            children: [
              // 1. 订单时间和订单状态
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   // 1.1 创建时间
                  Text(
                    orderInfo['createTime'],
                    style:
                        const TextStyle(color: Color.fromARGB(255, 70, 69, 69), fontSize: 13),
                  ),
                  // 1.2 订单状态
                  Text(orderInfo['orderState'], style: const TextStyle(color: Colors.orange),)
                ],
              ),
              // 2. 商品图片+名称+数量+规格+单价
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    // 2.1 左侧商品图片
                    Image.network('https://yanxuan-item.nosdn.127.net/a09de222ed32efa8ffe359b1d5780574.jpg', width: 100, height: 100, fit: BoxFit.cover,),
                    // 2.2 右侧: 名称+数量+规格+单价
                     Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 2.2.1 名称+数量
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // 名称
                                Expanded(child: Text(orderInfo['name'])),
                                // 数量
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('x ${orderInfo['totalNum']}'),
                                )
                              ],
                            ),
                            // 2.2.2 规格
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 249, 247, 247),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text(orderInfo['attrsText'], style: const TextStyle(color: Colors.grey),),
                              ),
                            ),
                            // 2.2.3 价格
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text('¥${orderInfo['curPrice']}'),
                            ),
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
              // 3. 合计
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                        '合计: ¥ ${orderInfo['curPrice'] * orderInfo['totalNum']}'),
                )
              ),
              // 4. 再次购买
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 41, 40, 40))
                    ),
                    child: const Text('再次购买', style: TextStyle(color: Color.fromARGB(255, 68, 68, 68)),),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
```

### 
