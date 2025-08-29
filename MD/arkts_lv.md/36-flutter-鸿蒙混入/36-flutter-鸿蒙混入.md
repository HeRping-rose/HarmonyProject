# 04-Flutter搭建鸿蒙开发环境

# 1. 下载flutter鸿蒙版本sdk

[官网文档](https://gitcode.com/openharmony-sig/flutter_flutter)

https://book.flutterchina.club/   flutter文档

[搭建harmony_Flutter环境文档](https://gitee.com/openharmony-sig/flutter_samples/blob/master/ohos/docs/03_environment/鸿蒙版Flutter环境搭建指导.md)

```
$ git clone https://gitcode.com/openharmony-tpc/flutter_flutter.git
```

mac 将其放在根目录下

windows将其放在d盘目录下

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743526349618-af477b83-b068-41d1-9f1d-63a02fcf4e91.png)![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743526334085-f3f2b678-e63e-4a7e-8730-0d2ce98345ee.png)



windows放在d盘

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743691076546-ef26867a-92b4-4abe-ae17-f5e735bf5c72.png)

# 2. 安装javaSDK配置环境变量

mac版本-17版本

[📎jdk-17.0.14_macos-aarch64_bin.tar.gz](https://www.yuque.com/attachments/yuque/0/2025/gz/38706227/1748394914255-92673d1d-5c19-4aab-8cfd-9a0ac4cc1de0.gz)

windows

[📎jdk-17.0.14_windows-x64_bin.rar](https://www.yuque.com/attachments/yuque/0/2025/rar/38706227/1748394914221-3f09578a-d2fa-45f7-83e4-be02f2d35062.rar)

```bash
java --version
```

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743758125633-4bd4e7fd-75ce-4d7b-8d01-9b1a8e02dc4d.png)

# 3. 配置flutter鸿蒙的sdk

## 3.1. mac版本

**检查环境变量的文件是哪个，mac有两个环境变量文件，你需要知道你的mac是哪个环境变量在生效**

.bash_profile

.zshrc

- 换出终端执行

```bash
echo $SHELL 
```

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743767221260-81ba4b0d-269d-4e8e-81ee-04f41a77471f.png)

环境变量文件都是隐藏文件，显示隐藏文件

shift + command + .

根目录上

- 将flutter环境和mac环境拷贝到空白处如上图

```bash
# Flutter 环境配置
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
export PATH="/Users/gaolingyu/flutter_flutter/bin:$PATH"

# OpenHarmony 开发环境配置
export TOOL_HOME=/Applications/DevEco-Studio.app/Contents # mac环境
export DEVECO_SDK_HOME=$TOOL_HOME/sdk # command-line-tools/sdk
export PATH=$TOOL_HOME/tools/ohpm/bin:$PATH # command-line-tools/ohpm/bin
export PATH=$TOOL_HOME/tools/hvigor/bin:$PATH # command-line-tools/hvigor/bin
export PATH=$TOOL_HOME/tools/node/bin:$PATH # command-line-tools/tool/node/bin
export HDC_HOME=$TOOL_HOME/sdk/default/openharmony/toolchains # hdc指令（可选）
```

输入完成，按esc，输入 :wq进行保存

- 执行命令使环境变量生效

```bash
$ source  ~/.zshrc
```

- 输入命令检查flutter和鸿蒙环境是否完好

```bash
$ flutter doctor -v
```

如图-flutter环境

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743526668958-e341cad1-6d01-471c-b66c-6d48c86508ff.png)

harmonyOS环境

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743526677524-84929e74-5192-4623-b7d4-cf3c454ed30b.png)

- 指向flutter的sdk目录

```bash
$ flutter config --ohos-sdk=/Users/$(whoami)/Library/OpenHarmony/Sdk
```

- 检查当前可用的设备

```bash
$ flutter devices # 检查当前可用的设备
```

## 3.2. windows版本

- 配置flutter的环境变量

在第一步下载sdk的目录的bin目录配置到环境变量， 如图



配置用户环境变量  替换之前的flutter/bin  或者将之前的bin下移  

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743692368341-23f8bf34-80de-44a1-8017-b8c212c53d84.png)

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743692401556-4c04c0f1-d63d-49e8-90f4-b9d6e00cdadb.png)

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743692420727-4f7c47a6-2a3e-47e5-94a6-99775c0c2888.png)

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743692439705-098bc8b6-8025-413a-a086-46d94a357a69.png)

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743692451528-b8233a40-e761-4825-82a2-37768558b1fc.png)

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743692493417-6476f665-8c29-4954-b560-e64408f53a8b.png)

- 配置完成后执行flutter 命令验证

```
$ flutter --version
```

![image.png](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743692647237-06c56e94-2763-4027-a468-73fe97ee24a2.png?x-oss-process=image%2Fformat%2Cwebp)

### 3.2.1. 配置harmonySDK  环境变量

保证node 18以上    没啥配置的

// 用户 path变量

D:\DevEcoStudio\DEStudio\sdk

- 配置ohpm 
- 配置hdc
- 配置hvigor
- 配置node

//  用户变量

- 配置PUB_HOSTED_URL为[https://pub.flutter-io.cn](https://pub.flutter-io.cn")
- 配置FLUTTER_STORAGE_BASE_URL为https://storage.flutter-io.cn
- 配置DEVECO_SDK_HOME为C:\Program Files\Huawei\DevEco Studio\sdk



执行命令测试

```bash
$ flutter doctor -v 
```

 ![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1743693531950-6b27adf2-582e-4f77-b9f2-e94679de170e.png)

# 4. 创建flutter版本的鸿蒙项目

- 创建鸿蒙项目

```bash
$  # 创建工程
 flutter create --platforms ohos <projectName>
 
 //或者  用逗号隔开  添加其他端的项目
 flutter create --platforms ohos,ios,android,web,linux,macos,windows <projectName>
```

- 构建hap包  (可选)

构建出一个xxx.hap的实体文件,但是不是最终目的  而是与去鸿蒙的模拟器看效果

需要在鸿蒙模拟器中打开hap包才行

```bash
$ flutter build hap   #打包发布模式的hap包   发布到华为
```

- 执行打包命令

```bash
$ flutter build hap --debug #打包开发模式的hap包  本地调试
```

- ![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745222137770-2f4114b0-2cbd-42a2-be28-8a30ad067473.png)

`D:\HarmoneyProject\flutter_all\ohos\entry\build\default\outputs\default\entry-default-unsigned.hap`

打包报错 

`请通过DevEco Studio打开ohos工程后配置调试签名(File -> Project Structure -> Signing Configs 勾选Automatically generate signature)`



打开当前项目的ohos 在dev中打开  配置项目结构  配置签名勾选Automatically generate signature)  

先打开模拟器  再配置签名  应用



再次运行  

`flutter build hap`





1.将hap拖到模拟器上测试，windows测试能否使用   会报错

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745222207356-317b6f9e-0d73-4898-bee9-0de17f54c0f6.png)

##### 2.运行项目  (模拟器中运行鸿蒙项目)   模拟器中运行  (他会自动打包 并在模拟器中启动)

AndroidStudio 无法感知鸿蒙设备，而 DevEco Studio 没有 Flutter 插件，使用也无法直接运行 Flutter 项目，这就一根筋变两头堵了。可以通过命令行运行到鸿蒙设备上：

> flutter run --debug -d `<deviceId>`
>
> 不需要引号
>
>  flutter run --debug -d 127.0.0.1:5555



先查看  其中设备的 id 可以通过下面命令查找，如下所示 deviceId 是 23E0224127000257：

> flutter devices

查看在运行的设备

![image-20250828114858637](C:\Users\EDY\AppData\Roaming\Typora\typora-user-images\image-20250828114858637.png)













**在 Flutter 三端分离模式下完成纯血鸿蒙混入的过程中，虽然官方文档提供了一定的指导，但实际操作中可能会遇到一些坑。以下是我在适配过程中的一些经验总结，供各位开发者参考** **😄** **如果有帮助点个赞。**

在混入过程中是基于咸鱼团队 flutter_boost（这里不讨论和其他方案的差别） 和自定义 FlutterPlugin 实现的。

主要涉及内容：

环境搭建

- Flutter module 创建
- Futter 引入 flutter_boost
- Harmony 引入 flutter_boost
- Flutter 与鸿蒙侧通信
- Flutter 调用鸿蒙原生

## 1.1. 搭建支持鸿蒙的flutter环境

- 具体请参考https://www.yuque.com/jiangpeng-urbdz/gtdqoo/biogenlm7icuu2wg?singleDoc# 密码：lcry

## 1.2. Flutter module 创建

**DevEco Studio编辑器必须支持API15及以上版本，如果不是API15及以上版本，需要重新去鸿蒙官网下载并安装编辑器。**

**检查编辑器的API版本如下图所示：**

![img](https://cdn.nlark.com/yuque/0/2025/png/1852552/1750666510410-c543632f-f150-45d2-ab65-e7b4ebbe6c3f.png)

**如果以上API小于15版本，后续会出现以下报错：**

**.****../ohos/oh_modules/.ohpm/@ohos+flutter_ohos@...=/oh_modules/@ohos/flutter_ohos/src/main/ets/plugin/editing/TextInputPlugin.ets:...**

- module是一个模块-混入到鸿蒙项目中-har
- 之前的享加生活是个完整的项目-hap

```bash
$ flutter create -t module  fluter_order 
```

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1744800906708-0a95dcc5-1acd-45e4-9ef6-0281c4e0f852.png)

- 如何打包flutter项目

```bash
$ flutter build har --debug
```

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745226631938-d2856179-e290-40b2-8be5-7a1f6dcd6846.png)

## 1.3. Flutter 引入 flutter_boost

国内咸鱼团队实现的混入方案-可以实现flutter项目混入

- 鸿蒙
- 安卓
- ios

- 安装依赖

```dart
flutter_boost:
    git:
      url: "https://gitee.com/alibaba/flutter_boost.git"
      ref: "4.6.5"
```

**windows同学特别注意：** 

 因为flutter要求所有的依赖都必须在同一个磁盘下，所以需要手动克隆我们的git仓库到我们项目的同磁盘下，然后用相对目录去引入

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745238695204-f9b590af-e092-419a-b09d-1a3872f88eae.png)

- 再次执行命令会有三个包

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745227757708-ed148997-b90a-4e8a-8e90-5d3b6c1a38a1.png)

- 放置一个bag.png图片到assets/images

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745242115282-c2b2dd2c-851e-4820-8276-a2626e723a90.png)

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745242308921-e2bc6922-1432-4965-94a6-14cd304aa1d4.png)

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745242278741-4508fc94-cfff-4a9d-9bb1-bd6ec1a6a7d7.png)

- 在flutter中简单配置一个路由

```dart
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_order/pages/order/order_page.dart';

// 1. 创建一个自定义的Binding，继承和with的关系如下，里面什么都不用写
class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

void main() {
  // 2. 这里的CustomFlutterBinding调用务必不可缺少，用于控制Boost状态的resume和pause
  CustomFlutterBinding();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 3. 路由表
  Map<String, FlutterBoostRouteFactory> routerMap = {
    '/OrderDetail': (settings, isContainerPage, uniqueId) {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext ctx) {
          return const OrderPage();
        },
      );
    }
  };

  // 路由工厂函数
  Route<dynamic> routeFactory(
      RouteSettings settings, bool isContainerPage, String? uniqueId) {
    FlutterBoostRouteFactory? fn = routerMap[settings.name];
    if (fn == null) {
      throw FlutterError(
          'Route "${settings.toString()}" is not defined in routerMap.');
    }
    return fn(settings, isContainerPage, uniqueId)!;
  }

  @override
  Widget build(BuildContext context) {
    // flutter_boost 接管
    return FlutterBoostApp(
      routeFactory,
      // Flutter 侧直接预览需要，需要使用 Deveco Studio 导入 .ohos 项目进行自动签名预览至鸿蒙设备
      initialRoute: '/OrderDetail',
      appBuilder: (home) {
        return MaterialApp(
          builder: (context, child) => home,
        );
      },
    );
  }
}
```

- 订单页面

- 订单页面

```dart
import 'package:flutter/material.dart';
import 'components/order_tab_bar.dart';
import 'components/order_item.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['全部', '待付款', '待发货', '待收货', '待评价'];

   final List<Map<String, dynamic>> _orderList = [
    {
      'id': '1001',
      'createTime': '2024-01-15 18:03:24',
      'payType': 1,
      'orderState': 1,
      'payLatestTime': '2024-01-15 19:03:24',
      'postFee': 0,
      'payMoney': 25.00,
      'totalMoney': 25.00,
      'totalNum': 1,
      'skus': [
        {
          'id': 'sku001',
          'spuId': 'spu001',
          'name': 'DIOR 迪奥 LADY D-JOY 中号羊皮格纹女士手提包',
          'quantity': 1,
          'image': 'assets/images/bag.png',
          'realPay': 25.00,
          'curPrice': 25.00,
          'totalMoney': 25.00,
          'properties': [
            {
              'propertyMainName': '颜色',
              'propertyValueName': '黑色'
            },
            {
              'propertyMainName': '尺码',
              'propertyValueName': 'L'
            }
          ],
          'attrsText': '黑色 L'
        }
      ],
      'payChannel': 1,
      'countdown': 3600
    },
    {
      'id': '1002',
      'createTime': '2024-01-15 17:03:24',
      'payType': 1,
      'orderState': 2,
      'payLatestTime': '2024-01-15 18:03:24',
      'postFee': 0,
      'payMoney': 25.00,
      'totalMoney': 25.00,
      'totalNum': 1,
      'skus': [
        {
          'id': 'sku002',
          'spuId': 'spu001',
          'name': 'DIOR 迪奥 LADY D-JOY 中号羊皮格纹女士手提包',
          'quantity': 1,
          'image': 'assets/images/bag.png',
          'realPay': 25.00,
          'curPrice': 25.00,
          'totalMoney': 25.00,
          'properties': [
            {
              'propertyMainName': '颜色',
              'propertyValueName': '红色'
            },
            {
              'propertyMainName': '尺码',
              'propertyValueName': 'M'
            }
          ],
          'attrsText': '红色 M'
        }
      ],
      'payChannel': 1,
      'countdown': 3600
    }
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          OrderTabBar(
            tabs: _tabs,
            controller: _tabController,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _orderList.length,
              itemBuilder: (context, index) {
                return OrderItem(
                  orderInfo: _orderList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```

- 订单单项组件

```dart
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Map<String, dynamic> orderInfo;

  const OrderItem({
    super.key,
    required this.orderInfo,
  });

  Widget _buildActionButtons(int status) {
    // 假设状态码：1-待付款 2-待发货 3-待收货
    if (status == 1) {
      return Row(
        children: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF999999),
              side: const BorderSide(color: Color(0xFFDDDDDD)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: const Size(0, 32),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: const Text('取消订单'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF4141),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: const Size(0, 32),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: const Text('立即付款'),
          ),
        ],
      );
    } else if (status == 2) {
      return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF999999),
          side: const BorderSide(color: Color(0xFFDDDDDD)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          minimumSize: const Size(0, 32),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: const Text('再次购买'),
      );
    } else if (status == 3) {
      return Row(
        children: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF999999),
              side: const BorderSide(color: Color(0xFFDDDDDD)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: const Size(0, 32),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: const Text('再次购买'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF4141),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: const Size(0, 32),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: const Text('确定收货'),
          ),
        ],
      );
    }
    return const SizedBox();
  }

  String _getStatusText(int status) {
    switch (status) {
      case 1:
        return '待付款';
      case 2:
        return '待发货';
      case 3:
        return '待收货';
      default:
        return '未知状态';
    }
  }

  Widget getShowImage(String url) {
    if (url.startsWith("http:") || url.startsWith("https:")) {
      return Image.network(
        url,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      );
    }
    return Image.asset(
      url,
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    final firstSku = orderInfo['skus'][0];
    final properties = firstSku['properties'] as List;
    final specs =
        properties.map((prop) => '${prop['propertyValueName']}').join(' ');

    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // 订单信息头部
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderInfo['createTime'],
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF999999),
                ),
              ),
              Text(
                _getStatusText(orderInfo['orderState']),
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFFF4141),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 商品信息
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: getShowImage(firstSku["image"]),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstSku['name'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      specs,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF999999),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '¥${firstSku['curPrice'].toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'x${firstSku['quantity']}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Divider(
            height: 25,
            thickness: 0.5,
            color: Color(0xFFEEEEEE),
          ),

          // 订单金额
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                '实付款：',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF999999),
                ),
              ),
              Text(
                '¥${orderInfo["payMoney"].toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),

          // 操作按钮
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildActionButtons(orderInfo['orderState']),
            ],
          ),
        ],
      ),
    );
  }
}
```

- tabbar组件

- tabbar组件

```dart
import 'package:flutter/material.dart';

class OrderTabBar extends StatelessWidget {
  final List<String> tabs;
  final TabController controller;

  const OrderTabBar({
    super.key,
    required this.tabs,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: controller,
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
        labelColor: const Color(0xFF333333),
        unselectedLabelColor: const Color(0xFF999999),
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: const Color(0xFF333333),
        isScrollable: true,
        padding: EdgeInsets.zero,
        tabAlignment: TabAlignment.start,
      ),
    );
  }
}
```

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745250846126-5bcc9034-2c09-42f6-b954-3dc3f02fa5df.png)



注意执行flutter build har 会重新生成.ohos文件夹，生成的时候不要用DevEco打开这个项目，否则会提示文件占用

## 1.4. 鸿蒙项目导入Flutter_boost

- 使用原来的惠多美V2项目

- 在flutter中打包har

```bash
$ flutter clean && flutter pub get && flutter build har 
```

坑点： 每次打包都得清理重新安装依赖重新打包-所以以上三个命令执行

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1744802359925-feb63f35-7635-4042-a9d0-69192a33d91b.png)

- 在鸿蒙中引入har的依赖

flutter.har 和 flutter_boost是一个不再变动的包，所以放到根目录的libs目录下，flutter_module.har因为随时在修改，所以直接应用原目录

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1744802725945-efcb0f8b-177e-4abb-977a-5f36c87fc308.png)

在根目录的配置文件中添加对于三个包的依赖

```dart
{
  "modelVersion": "5.0.3",
  "description": "Please describe the basic information.",
  "dependencies": {
    "@hadss/hmrouter": "^1.0.0-rc.11",
    "@hadss/hmrouter-transitions": "^1.0.0-rc.10",
    "@pura/harmony-dialog": "^1.1.4",
    "@ohos/flutter_ohos": "file:./libs/flutter.har",
    "flutter_boost": "file:./libs/flutter_boost.har",
    "@ohos/flutter_module": "file:../flutter_harmony_order/.ohos/har/flutter_module.har"
  },
  "devDependencies": {
    "@ohos/hypium": "1.0.21",
    "@ohos/hamock": "1.0.0"
  },
  "overrides": {
    "@ohos/flutter_ohos": "file:./libs/flutter.har",
    "flutter_boost": "file:./libs/flutter_boost.har"
  }
}
```

## 1.5. 在鸿蒙项目中初始化flutter_boost

- 在ability中进行初始化

```arkts
import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AppStorageV2, router, window } from '@kit.ArkUI';
import {
  AppCart,
  authCart,
  GlobalVariable,
  hdmDialogHelper,
  HDMDialogHelper,
  HDMLog,
  PAGE_PATH,
  screenManager,
  storeManager
} from 'basic';
import { HMLifecycleState, HMRouterMgr } from '@hadss/hmrouter';
import { DialogHelper } from '@pura/harmony-dialog'
import { rpc } from '@kit.IPCKit';
import { emitter } from '@kit.BasicServicesKit';
import { FlutterManager } from '@ohos/flutter_ohos';
import {
  FlutterBoostDelegate,
  FlutterBoostRouteOptions,
  FlutterBoost,
  FlutterBoostSetupOptionsBuilder
} from 'flutter_boost';
import { GeneratedPluginRegistrant } from '@ohos/flutter_module';

const DOMAIN = 0x0000;

class Params implements rpc.Parcelable {
  marshalling(dataOut: rpc.MessageSequence): boolean {
    return true
  }

  unmarshalling(dataIn: rpc.MessageSequence): boolean {
    return true
  }
}

export default class PhoneAbility extends UIAbility implements FlutterBoostDelegate {
  pushNativeRoute(options: FlutterBoostRouteOptions,
    onPageResult?: ((pageName: string, result: Record<string, Object>) => void) | undefined): void {

  }

  pushFlutterRoute(options: FlutterBoostRouteOptions,
    onPageResult?: ((pageName: string, result: Record<string, Object>) => void) | undefined): void {

  }

  popRoute(options: FlutterBoostRouteOptions): boolean {
    router.back()
    return true
  }

  toPage: string = ""

  // 要去的地址
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    FlutterManager.getInstance().pushUIAbility(this);
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
    HMRouterMgr.init({
      context: this.context
    })
    // 初始化第三方的上下文
    DialogHelper.setDefaultConfig((config) => {
      config.uiAbilityContext = this.context
    })
    storeManager.init(this.context) // 初始化上下文

    // 初始化上下文
    hdmDialogHelper.init(this.context)
    // AlertDialog.show({ message: (want.parameters!["count"] as number).toString() })
    this.registerEvent() // 注册监听卡片通知的事件

    this.toPage = want.parameters!["toPage"] as string // 冷启动 窗口还未绘制
    // 此时不能跳转 窗口还未创建

  }

  // 接收formId
  registerEvent() {
    // postCartAction 调用call方法会进入callee的回调函数
    this.callee.on("receiveFormId", (indata: rpc.MessageSequence) => {
      const obj = JSON.parse(indata.readString()) as object
      HDMLog.info(obj["formId"])
      storeManager.addFormId(obj["formId"])
      // 把formId存到了首选项 就应该推一下数据
      // 添加卡片的时候就把数据推送过去
      // const appCart = AppStorageV2.connect(AppCart, () => new AppCart())!
      // authCart.pushCartCountToForm(appCart.count)
      emitter.emit(GlobalVariable.PUSH_CARD_IMAGE)

      return new Params()
    })

  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    const toPage = want.parameters!["toPage"] as string // 冷启动 窗口还未绘制
    if (toPage) {
      // 判断当前页面是否存在这个地址
      // 就要当前最顶层页面是推荐页面
      this.toNavigationPage(toPage)

    }
  }

  // 跳转页面
  toNavigationPage(pageName: string) {
    const list = HMRouterMgr.getPathStack(PAGE_PATH.MAIN_PAGE_ID)?.getAllPathName()
    if (list?.pop() !== pageName) {
      HMRouterMgr.push({
        pageUrl: pageName
      })
    }
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  registerFlutterHybrid(windowStage: window.WindowStage) {
    FlutterManager.getInstance().pushWindowStage(this, windowStage);
    // Initial FlutterBoost
    const optionsBuilder: FlutterBoostSetupOptionsBuilder = new FlutterBoostSetupOptionsBuilder()
    FlutterBoost.getInstance().setup(this, this.context, (engine) => {
      GeneratedPluginRegistrant.registerWith(engine)
    }, optionsBuilder.build())

  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    this.registerFlutterHybrid(windowStage)
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    screenManager.ctx = this.context
    screenManager.registerWindowSizeChange() // 注册屏幕变化
    screenManager.full() // 实现沉浸式全屏
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
      // 此时可以跳
      if (this.toPage) {
        setTimeout(() => {
          this.toNavigationPage(this.toPage)
          this.toPage = "" // 跳完之后任务完成 值设置为空
        }, 0)
      }

    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    screenManager.unRegisterWindowSizeChange() // 取消注册
    FlutterManager.getInstance().popWindowStage(this);
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
```

## 1.6. 搭建订单页面

这里建page

```arkts
import { FlutterEntry, FlutterPage, FlutterView } from '@ohos/flutter_ohos';
import { FlutterBoost, FlutterBoostEntry } from 'flutter_boost';
import { router } from '@kit.ArkUI';
import { HDMNavBar } from 'basic';

@Entry
@Component
struct OrderList {
  private flutterEntry?: FlutterEntry;
  private flutterView?: FlutterView

  aboutToAppear() {
    this.flutterEntry = new FlutterBoostEntry(getContext(this), router.getParams())
    this.flutterEntry?.aboutToAppear()
    this.flutterView = this.flutterEntry?.getFlutterView()
  }

  aboutToDisappear() {
    this.flutterEntry?.aboutToDisappear()
  }

  onPageShow() {
    this.flutterEntry?.onPageShow()
  }

  onPageHide() {
    this.flutterEntry?.onPageHide()
  }

  onBackPress(): boolean | void {
    FlutterBoost.getInstance()
      .getPlugin()?.onBackPressed();
    return true;
  }

  build() {
    Column() {
      HDMNavBar({
        title: '订单详情',
        onLeftClick: () => {
          router.back()
        }
      })
      FlutterPage({ viewId: this.flutterView?.getId() })
        .width('100%')
        .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
```

- 点击我全部订单跳转到该页面

```arkts
 router.pushUrl({
                        url: GlobalVariable.MINE_MODULE_PAGE + "OrderList",
                        params: { uri: '/OrderDetail', }

                      })
```

- 定义跨包跳转静态常量

- 定义跨包跳转静态常量

```arkts
export class GlobalVariable {
  static readonly BASE_URL: string = "https://meikou-api.itheima.net" // 网络请求基础地址
  // code成功标识
  static readonly SUCCESS_CODE: string = "1" // 成功标识
  static readonly TIME_OUT: number = 60000 // 超时时间
  static readonly TIP_MESSAGE: string = "sound.mp3"
  static readonly SWITCH_TAB: string = "switch_tab" // 切换tab的名称
  static readonly STORAGE_NAME: string = "hdm_store" // 首选项仓库名称
  static readonly FORM_ID_KEY: string = "form_id_key" // 存储formId的key
  static readonly PUSH_CARD_IMAGE: string = "push_card_img" // 存储formId的key
  static readonly BUNDLE_NAME: string = "com.itcast.mk_shop"
  static readonly MINE_MODULE_PAGE: string = `@bundle:${GlobalVariable.BUNDLE_NAME}/mine/ets/pages/`
}
```

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745290504152-7770c313-e216-4275-a2f2-3d8479bc7431.png)

# 2. flutter封装Dio请求

- 安装dio

```dart
$ flutter pub add dio
```

- 封装dio请求工具

```dart
import 'package:dio/dio.dart';

class RequestDio {
  final _dio = Dio(); // 声明dio实例对象
  // 构造函数
  RequestDio() {
    // 设置dio基础地址
    // 超时时间
    _dio
      ..options.baseUrl = "https://meikou-api.itheima.net"
      ..options.receiveTimeout = const Duration(seconds: 20)
      ..options.sendTimeout = const Duration(seconds: 20);

    // 添加拦截器
    // 请求拦截器
    // 响应拦截器
    // 错误拦截器
    _dioAddInterceptors();
  }
  // 添加拦截器
  _dioAddInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
      // todo 注入token
      handler.next(request);
    }, onResponse: (response, handler) {
      // 响应拦截器
      handler.next(response);
    }));
  }

  // 接口文档

  // 获取方法
  Future get(String url, {Map<String, dynamic>? params}) async {
    final result = await _dio.get(url, queryParameters: params);
    // 需要对数据进行二次处理
    return _handleResponse(result);
  }

  // 上传接口
  Future upload(String url, {FormData? data}) async {
    final result = await _dio.post(url, data: data);
    // 需要对数据进行二次处理
    return _handleResponse(result);
  }

  Future post(String url, {Map<String, dynamic>? data}) async {
    final result = await _dio.post(url, data: data);
    // 需要对数据进行二次处理
    return _handleResponse(result);
  }

  Future delete(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) async {
    final result = await _dio.delete(url, queryParameters: params, data: data);
    // 需要对数据进行二次处理
    return _handleResponse(result);
  }

  Future put(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) async {
    final result = await _dio.put(url, queryParameters: params, data: data);
    // 需要对数据进行二次处理
    return _handleResponse(result);
  }

  // 处理解构数据
  _handleResponse(Response<dynamic> result) {
    if (result.data["code"] == '1') {
      // 如果等于1 说明请求成功
      return result.data["result"];
    }
    throw Exception(result.data["msg"]);
  }
}

RequestDio requestDio = RequestDio();
```

- 封装获取订单api

```dart
// 获取订单列表的方法

import 'package:flutter_order_hybrid/utils/RequestDio.dart';

getOrderListAPI(Map<String, dynamic> params) =>
    requestDio.get("/member/order", params: params);
```

# 3. flutter调用鸿蒙端方法

- 弹出消息
- 获取token

- 鸿蒙侧提供sdk方法-定义plugin

```arkts
// 导出一个对象
// 给flutter添加插件的时候 需要new一个对象
import { FlutterPlugin, FlutterPluginBinding } from "@ohos/flutter_ohos";
import { HDMLog } from ".";

// 获取token
// 弹出消息
export class CommonPlugin implements FlutterPlugin {
  getUniqueClassName(): string {
    return "CommonPlugin" // 返回一个唯一类名
  }

  // 挂载的时候执行
  onAttachedToEngine(binding: FlutterPluginBinding): void {
    HDMLog.info("挂载")
  }

  // 卸载的时候执行
  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    HDMLog.info("卸载")
  }
}
```

和前端定义的sdk

```arkts
// 导出一个对象
// 给flutter添加插件的时候 需要new一个对象
import { FlutterPlugin, FlutterPluginBinding, MethodCall, MethodChannel, MethodResult } from "@ohos/flutter_ohos";
import { auth, HDMLog } from ".";
import { promptAction } from "@kit.ArkUI";

// 获取token
// 弹出消息
export class CommonPlugin implements FlutterPlugin {
  private channel: MethodChannel | null = null

  getUniqueClassName(): string {
    return "CommonPlugin" // 返回一个唯一类名
  }

  // 挂载的时候执行
  onAttachedToEngine(binding: FlutterPluginBinding): void {
    // 开始监听 flutter调用的方法了
    this.channel = new MethodChannel(binding.getBinaryMessenger(), "hdm_project") // 实例化一个电话
    this.channel.setMethodCallHandler({
      onMethodCall: (call: MethodCall, result: MethodResult) => {
        // 传递过来的信息是说明 在call里面
        // 给对方回传result中
        switch (call.method) {
          case "showMessage":
            this.showMessage(call)
            break;
          case "getToken":
            this.getToken(result);
            break;
        }

      }
    })

  }

  showMessage(call: MethodCall) {
    promptAction.showToast({ message: call.args })

  }

  getToken(result: MethodResult) {
    result.success(auth.getUser().token)
  }

  // 卸载的时候执行
  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    this.channel?.setMethodCallHandler(null); // 把电话的监听内容清空
  }
}
```

- 在鸿蒙侧的插件处进行注册

```arkts
registerFlutterHybrid(windowStage: window.WindowStage) {
    FlutterManager.getInstance().pushWindowStage(this, windowStage);
    // Initial FlutterBoost
    const optionsBuilder: FlutterBoostSetupOptionsBuilder = new FlutterBoostSetupOptionsBuilder()
    FlutterBoost.getInstance().setup(this, this.context, (engine) => {
      GeneratedPluginRegistrant.registerWith(engine)
      engine.getPlugins()?.add(new CommonPlugin())
    }, optionsBuilder.build())

  }
```

- 在flutter处调用

```dart
final _platforms = const MethodChannel("hdm_project"); // 实例化的平台对象 电话
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _getToken();
  }

  _getToken() async {
    String token = await _platforms.invokeMethod("getToken");
    if (token.isNotEmpty) {
      TokenManager.token = token;
      // 获取数据
      // dio调用接口
    }
  }
```

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745246765785-e9c00566-98f2-4ed8-bde3-9dfc66ac399f.png)

# 4. 封装获取token的方法,Flutter注入token

- 鸿蒙端封装

- 鸿蒙端封装

```arkts
import { FlutterPlugin, FlutterPluginBinding, MethodCall, MethodChannel, MethodResult } from '@ohos/flutter_ohos';
import { PersistenceV2, promptAction } from '@kit.ArkUI';
import { AppUser } from '../viewmodels';
import { auth } from '.';

export class CommonPlugin implements FlutterPlugin {
  private channel?: MethodChannel;

  getUniqueClassName(): string {
    return "CommonPlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.channel = new MethodChannel(binding.getBinaryMessenger(), 'hdm_project')
    this.channel.setMethodCallHandler({
      onMethodCall: (call, result) => {
        switch (call.method) {
          case "showMessage":
            this.showMessage(call, result)
            break;
          case "getToken":
            this.getToken(result)
            break;
          default:
            result.notImplemented()
            break;
        }
      }
    })
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    this.channel?.setMethodCallHandler(null);
  }

  showMessage(call: MethodCall, result: MethodResult) {
    promptAction.showToast({ message: call.args })
  }

  getToken(result: MethodResult) {
    result.success(auth.getUser().token)
  }
}
```

- flutter端定义静态class接收

```dart
class TokenManager {
  static String token = "";
}
```

- flutter端获取

```dart
 @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _getToken();
  }

  _getToken() async {
    TokenManager.token = await _platform.invokeMethod("getToken");
    _platform.invokeMethod("showMessage", TokenManager.token);
  }
```

- 在dio中注入token

```dart
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_harmony_order/utils/auth.dart';

class RequestDio {
  // 有个地方可以设置dio的基础地址
  final Dio _dio = Dio();
  RequestDio() {
    // 针对dio的基础地址进行设置
    // _dio.options.baseUrl = GlobalVariable.BASE_URL; // 设置基础地址
    // _dio.options.receiveTimeout =
    //     const Duration(seconds: GlobalVariable.NET_WORK_TIME); // 接收时间
    // _dio.options.sendTimeout =
    //     const Duration(seconds: GlobalVariable.NET_WORK_TIME); // 发送超时时间
    _dio
      ..options.baseUrl = ""
      ..options.connectTimeout = const Duration(seconds: 20)
      ..options.receiveTimeout = const Duration(seconds: 20);

    // axios 和 rcp的拦截器
    // 添加请求和响应拦截器
    _registerInterceptors(); // 注册拦截器
  }
  _registerInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
          // 请求拦截器
          onRequest: (request, handler) {

        // 在这里注入token
        request.headers["Authorization"] = "Bearer ${TokenManager.token}";

        // request里面是请求参数
        handler.next(request);
      }, onResponse: (response, handler) {
        // response是响应结果
        // http业务状态码 200 -300 之间是成功的
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          handler.next(response); // 处理数据  这里可以处理错误
        } else {
          // 加401判断
          handler.reject(DioException(requestOptions: response.requestOptions));
        }
      },
          // 错误拦截器
          onError: (exception, handler) async {
        handler.next(exception); // 抛出错误
      }),
    );
  }

  // 换取token

  // 获取方法
  Future get(String url, {Map<String, dynamic>? params}) async {
    final result = await _dio.get(url, queryParameters: params);
    // 需要对数据进行二次处理
    return _handleResponse(result);
  }

  // 上传接口
  Future upload(String url, {FormData? data}) async {
    final result = await _dio.post(url, data: data);
    // 需要对数据进行二次处理
    return _handleResponse(result);
  }

  Future post(String url, {Map<String, dynamic>? data}) async {
    final result = await _dio.post(url, data: data);
    // 需要对数据进行二次处理
    return _handleResponse(result);
  }

  Future delete(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) async {
    final result = await _dio.delete(url, queryParameters: params, data: data);
    // 需要对数据进行二次处理
    return _handleResponse(result);
  }

  Future put(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) async {
    final result = await _dio.put(url, queryParameters: params, data: data);
    // 需要对数据进行二次处理
    return _handleResponse(result);
  }

  // 处理返回数据结构
  _handleResponse(Response<dynamic> result) {
    if (result.data["code"] == "1") {
      // 此时说明请求成功 返回正确的数据
      return result.data["data"];
    }

    // 提示个消息 使用第三方插件的toast弹出
    throw Exception(result.data["message"]);
  }
}

final requestDio = RequestDio();
```

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745248110395-ad8b1139-0437-4707-9f21-e3ee966aa230.png)



# 5. Flutter获取订单列表

能够跑到鸿蒙上的同学-token通过通信获取

不能跑到鸿蒙上的同学-flutter的token写死-flutter- run -模拟器

![img](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745250787858-1f76c8d6-8781-433d-9068-e3664a2f0e23.png)

在获取完token之后获取数据

```dart
final _platforms = const MethodChannel("hdm_project"); // 实例化的平台对象 电话
  List<Map<String, dynamic>> _orderList = []; // 订单列表
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _getToken();
  }

  _getToken() async {
    String token = await _platforms.invokeMethod("getToken");
    if (token.isNotEmpty) {
      TokenManager.token = token;
      // 获取数据
      _getOrderList();
      // dio调用接口
    }
  }

  Map<String, dynamic> params = {"page": 1, "pageSize": 10, "orderState": 0};
  _getOrderList() async {
    try {
      final res = await getOrderListAPI(params);
      _orderList = List<Map<String, dynamic>>.from(res["items"]);
      setState(() {});
    } catch (e) {
      _platforms.invokeMethod("showMessage", e.toString());
    }
  }
```



# 6. 实现上拉加载

```dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_harmony_order/api/order.dart';
import 'package:flutter_harmony_order/utils/auth.dart';
import 'components/order_tab_bar.dart';
import 'components/order_item.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['全部', '待付款', '待发货', '待收货', '待评价'];
  final _platform = const MethodChannel('hdm_project');
  final ScrollController _scrollController = ScrollController();

  // 订单状态，1为待付款、2为待发货、3为待收货、4为待评价、5为已完成、6为已取消，未传该参数或0为全部
  Map<String, dynamic> params = {"orderState": 0, "page": 1, "pageSize": 10};
  List<Map<String, dynamic>> _orderList = [];
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);
    _scrollController.addListener(_handleScroll);
    _getToken();
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        params["orderState"] = _tabController.index;
        params["page"] = 1;
        _orderList = [];
        _hasMore = true;
      });
      _getOrderList();
    }
  }

  void _handleScroll() {
    if (!_isLoading &&
        _hasMore &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 50) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    params["page"] = (params["page"] as int) + 1;
    try {
      final res = await getOrderListAPI(params);
      final newItems = List<Map<String, dynamic>>.from(res["items"]);

      setState(() {
        _orderList.addAll(newItems);
        _isLoading = false;
        _hasMore = newItems.isNotEmpty;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        params["page"] = (params["page"] as int) - 1;
      });
      _platform.invokeMethod("showMessage", e.toString());
    }
  }

  _getToken() async {
    TokenManager.token = await _platform.invokeMethod("getToken");
    if (!TokenManager.token.isEmpty) {
      _getOrderList();
    }
  }

  // 获取订单列表
  _getOrderList() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final res = await getOrderListAPI(params);
      final newItems = List<Map<String, dynamic>>.from(res["items"]);

      setState(() {
        _orderList = newItems;
        _isLoading = false;
        _hasMore = newItems.isNotEmpty;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _platform.invokeMethod("showMessage", e.toString());
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          OrderTabBar(
            tabs: _tabs,
            controller: _tabController,
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _orderList.length + 1,
              itemBuilder: (context, index) {
                if (index == _orderList.length) {
                  return _buildLoadingIndicator();
                }
                return OrderItem(
                  orderInfo: _orderList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    if (!_hasMore) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            '没有更多数据了',
            style: TextStyle(
              color: Color(0xFF999999),
              fontSize: 12,
            ),
          ),
        ),
      );
    }

    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(Color(0xFF333333)),
            ),
          ),
        ),
      );
    }

    return const SizedBox();
  }
}
```

# 7. 实现下拉刷新

![image.png](https://cdn.nlark.com/yuque/0/2025/png/8435673/1745251844240-2f48deb9-bfa1-4e02-a894-7f05775be93a.png?x-oss-process=image%2Fformat%2Cwebp)



```
//lib/pages/order/order_page.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_harmony_order/api/order.dart';
import 'package:flutter_harmony_order/utils/auth.dart';
import 'components/order_tab_bar.dart';
import 'components/order_item.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['全部', '待付款', '待发货', '待收货', '待评价'];
  final _platform = const MethodChannel('hdm_project');
  final ScrollController _scrollController = ScrollController();

  // 订单状态，1为待付款、2为待发货、3为待收货、4为待评价、5为已完成、6为已取消，未传该参数或0为全部
  Map<String, dynamic> params = {"orderState": 0, "page": 1, "pageSize": 10};
  List<Map<String, dynamic>> _orderList = [];
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);
    _scrollController.addListener(_handleScroll);
    _getToken();
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        params["orderState"] = _tabController.index;
        params["page"] = 1;
        _orderList = [];
        _hasMore = true;
      });
      _getOrderList();
    }
  }

  void _handleScroll() {
    if (!_isLoading &&
        _hasMore &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 50) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    params["page"] = (params["page"] as int) + 1;
    try {
      final res = await getOrderListAPI(params);
      final newItems = List<Map<String, dynamic>>.from(res["items"]);

      setState(() {
        _orderList.addAll(newItems);
        _isLoading = false;
        _hasMore = newItems.isNotEmpty;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        params["page"] = (params["page"] as int) - 1;
      });
      _platform.invokeMethod("showMessage", e.toString());
    }
  }

  Future<void> _onRefresh() async {
    setState(() {
      params["page"] = 1;
      _hasMore = true;
    });
    await _getOrderList();
    _platform.invokeMethod("showMessage", "刷新成功");
  }

  _getToken() async {
    TokenManager.token = await _platform.invokeMethod("getToken");
    if (!TokenManager.token.isEmpty) {
      _getOrderList();
    }
  }

  // 获取订单列表
  Future<void> _getOrderList() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final res = await getOrderListAPI(params);
      final newItems = List<Map<String, dynamic>>.from(res["items"]);

      setState(() {
        _orderList = newItems;
        _isLoading = false;
        _hasMore = newItems.isNotEmpty;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _platform.invokeMethod("showMessage", e.toString());
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          OrderTabBar(
            tabs: _tabs,
            controller: _tabController,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              color: const Color(0xFF333333),
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _orderList.length + 1,
                itemBuilder: (context, index) {
                  if (index == _orderList.length) {
                    return _buildLoadingIndicator();
                  }
                  return OrderItem(
                    orderInfo: _orderList[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    if (!_hasMore) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            '没有更多数据了',
            style: TextStyle(
              color: Color(0xFF999999),
              fontSize: 12,
            ),
          ),
        ),
      );
    }

    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(Color(0xFF333333)),
            ),
          ),
        ),
      );
    }

    return const SizedBox();
  }
}

```

