### 3.4  滚动组件

#### 3.4.1 ListView

`ListView` 是一个用于展示列表数据，并可以沿着垂直或者水平方向滚动的组件

```dart
  ListView({
    // 滚动方向1：纵向滚动(默认的)Axis.vertical  横向滚动Axis.horizontal
    super.scrollDirection, 
    // 滚动效果：禁用滚动(const NeverScrollableScrollPhysics(),) 
    super.physics,
    // 存储列表要展示的每一项元素
    children,
  })
```



**使用方式1：默认构造函数**

场景：适用于列表子组件比较少，而且子组件样式可能不一样的情况

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722497901944-502a001c-9fe6-459c-a8df-ea664ec719c3.png)

```dart
import 'package:flutter/material.dart';

class ListViewDemo1 extends StatelessWidget {
  const ListViewDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView的基础使用'), backgroundColor: Colors.red,),
      body: ListView(
        // 滚动效果：禁用滚动
        // physics: const NeverScrollableScrollPhysics(),
        // 滚动方向1：纵向滚动(默认的)
        scrollDirection: Axis.vertical,
        // 滚动方向2：横向滚动
        // scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 80,
            color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: const Text('鸿蒙大事件1'),
          ),
          Container(
            height: 90,
            color: Colors.pink,
            alignment: Alignment.centerLeft,
            child: const Text('鸿蒙大事件2'),
          ),
          Container(
            height: 100,
            color: Colors.teal,
            alignment: Alignment.centerLeft,
            child: const Text('鸿蒙大事件3'),
          ),
          Container(
            height: 110,
            color: Colors.green,
            alignment: Alignment.centerLeft,
            child: const Text('鸿蒙大事件4'),
          ),
          Container(
            height: 120,
            color: Colors.cyan,
            alignment: Alignment.centerLeft,
            child: const Text('鸿蒙大事件5'),
          ),
          Container(
            height: 130,
            color: Colors.orange,
            alignment: Alignment.centerLeft,
            child: const Text('鸿蒙大事件6'),
          ),
          Container(
            height: 140,
            color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: const Text('鸿蒙大事件7'),
          ),
          Container(
            height: 150,
            color: Colors.green,
            alignment: Alignment.centerLeft,
            child: const Text('鸿蒙大事件8'),
          ),
          Container(
            height: 160,
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: const Text('鸿蒙大事件9'),
          ),
        ],
      ),
    );
  }
}
```



 **使用方式2：**`**builder**`**构造函数**

场景：适用于列表子组件比较多，而且子组件样式都一样的情况

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722654952527-1cf1de57-6238-438f-a03f-f02d805d349c.png)

```dart
import 'package:flutter/material.dart';

class ListView2 extends StatelessWidget {
  const ListView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 导航条
      appBar: AppBar(
        title: const Text(
          '列表使用-方式2',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return  Container(
            height: 100,
            color: Colors.red[90],
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(
                      'https://yanxuan-item.nosdn.127.net/e529b6ab111ade9da9314867f98d360f.png', width: 90,),
                  const Expanded(
                    child: Text('海尔（Haier）波轮洗衣机全自动家用 10公斤大容量 直驱变频 一级能效 高效精华洗 以旧换新EB100B37Mate5', maxLines: 2, overflow: TextOverflow.ellipsis,)
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.access_time_filled),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
```



**使用方式2：**`**separated**`**构造函数**

场景：可以很容易的设置分割线，也适用于列表子组件比较多，而且子组件样式都一样的情况

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722656864356-ed866d44-c2c7-49d3-a1d9-7e5a8831acf8.png)

```dart
import 'package:flutter/material.dart';

class ListView3 extends StatelessWidget {
  const ListView3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 1. 导航条
        appBar: AppBar(
          title: const Text(
            '列表使用-方式3',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
               return Container(
                height: 100,
                color: Colors.red[90],
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.network(
                        'https://yanxuan-item.nosdn.127.net/e529b6ab111ade9da9314867f98d360f.png',
                        width: 90,
                      ),
                      const Expanded(
                          child: Text(
                        '海尔（Haier）波轮洗衣机全自动家用 10公斤大容量 直驱变频 一级能效 高效精华洗 以旧换新EB100B37Mate5',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.access_time_filled),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(left: 9, right: 8),
                height: 1,
                color: const Color.fromARGB(255, 210, 209, 209),
              );
            },
            itemCount: 30));
  }
}
```



**综合案例：订单商品信息卡片**

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722502208983-ef4b1f3a-6ffe-4b5e-8a73-78cea8e94556.png)

```dart
import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

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
      appBar: AppBar(
        title: const Text('ListView综合案例'),
        backgroundColor: Colors.pink,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(15),
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
                          style: const TextStyle(
                              color: Color.fromARGB(255, 70, 69, 69),
                              fontSize: 13),
                        ),
                        // 1.2 订单状态
                        Text(
                          orderInfo['orderState'],
                          style: const TextStyle(color: Colors.orange),
                        )
                      ],
                    ),
                    // 2. 商品图片+名称+数量+规格+单价
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          // 2.1 左侧商品图片
                          Image.network(
                            'https://yanxuan-item.nosdn.127.net/a09de222ed32efa8ffe359b1d5780574.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          // 2.2 右侧: 名称+数量+规格+单价
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 2.2.1 名称+数量
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 3, bottom: 3),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 249, 247, 247),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      orderInfo['attrsText'],
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                // 2.2.3 价格
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('¥${orderInfo['curPrice']}'),
                                ),
                              ],
                            ),
                          ))
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
                        )),
                    // 4. 再次购买
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 41, 40, 40))),
                          child: const Text(
                            '再次购买',
                            style: TextStyle(
                                color: Color.fromARGB(255, 68, 68, 68)),
                          ),
                        ),
                      ),
                    )
                  ],
                )
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 8,
              color: Colors.grey,
            );
          },
          itemCount: 10),
    );
  }
}
```

#### 3.4.2 GridView

`GridView` 是一个用于展示可滚动的网格布局的组件

1. **使用方式1：默认构造函数**

1.1 固定侧轴(水平)方向子元素的个数，无论如何旋转屏幕侧轴子元素个数永远不变

```dart
GridView(
   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 1.1 设置侧轴方向子元素个数，此时每行展示的子元素个数是固定的
        mainAxisSpacing: 10.0, // 1.2 主轴(垂直)方向子元素间距
        crossAxisSpacing: 5.0, // 1.3 侧轴(水平)方向子元素间距
        childAspectRatio: 4 / 3, // 1.4 子元素宽高比，默认宽高相同 1: 1
    ),
    children: const [
      // 子项们
    ],
)
```



案例代码:

```dart
import 'package:flutter/material.dart';

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView案例1'),
        backgroundColor: Colors.red,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // 侧轴方向子元素的个数
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 5,
          childAspectRatio: 4/3
        ),
        children:  [
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('内容1'),
          ),
           Container(
            color: Colors.pink,
            alignment: Alignment.center,
            child: const Text('内容2'),
          ),
           Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('内容3'),
          ),
           Container(
            color: Colors.yellow,
            alignment: Alignment.center,
            child: const Text('内容4'),
          ),
           Container(
            color: Colors.cyan,
            alignment: Alignment.center,
            child: const Text('内容5'),
          ),
           Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('内容6'),
          )
        ],
      ),
    );
  }
}
```



```json
 List navList = [
    {
      "imgUrl":
          "https://smart-shop.itheima.net/uploads/10001/20230320/58a7c1f62df4cb1eb47fe83ff0e566e6.png",
      "imgName": "icon-1.png",
      "link": {
        "id": "c37c2ee",
        "title": "分类页",
        "type": "PAGE",
        "param": {"path": "pages/category/index", "url": "pages/category/index"}
      },
      "text": "新品首发"
    },
    {
      "imgUrl":
          "https://smart-shop.itheima.net/uploads/10001/20230320/49c64dbbf449e9e8abfca314f92814bd.png",
      "imgName": "icon-2.jpg",
      "link": {
        "id": "c37c2ee",
        "title": "分类页",
        "type": "PAGE",
        "param": {"path": "pages/category/index", "url": "pages/category/index"}
      },
      "text": "居家生活"
    },
    {
      "imgUrl":
          "https://smart-shop.itheima.net/uploads/10001/20230320/8573fbc5e87e8a88827e905fca284604.png",
      "imgName": "icon-1.png",
      "link": null,
      "text": "服饰鞋包"
    },
    {
      "imgUrl":
          "https://smart-shop.itheima.net/uploads/10001/20230320/f01c5fc360f55c6053beec34913bc699.png",
      "imgName": "icon-1.png",
      "link": null,
      "text": "美食酒水"
    },
    {
      "imgUrl":
          "https://smart-shop.itheima.net/uploads/10001/20230320/b106e9bd9e0c8c779e7d77a84e92ed93.png",
      "imgName": "icon-1.png",
      "link": null,
      "text": "个护清洁"
    },
    {
      "imgUrl":
          "https://smart-shop.itheima.net/uploads/10001/20230320/fd3a573889671b924d89859f521c30c9.png",
      "imgName": "icon-1.png",
      "link": null,
      "text": "母婴亲子"
    },
    {
      "imgUrl":
          "https://smart-shop.itheima.net/uploads/10001/20230320/8f979924a4fd3b5f406b62a6b405ea32.png",
      "imgName": "icon-1.png",
      "link": null,
      "text": "运动旅行"
    },
    {
      "imgUrl":
          "https://smart-shop.itheima.net/uploads/10001/20230320/f7657720f79ea9f769c40608f369130e.png",
      "imgName": "icon-1.png",
      "link": null,
      "text": "数码家电"
    },
    {
      "imgUrl":
          "https://smart-shop.itheima.net/uploads/10001/20230320/36f09e32efc53e1e695210ca92c54ed8.png",
      "imgName": "icon-1.png",
      "link": null,
      "text": "宠物生活"
    },
    {
      "imgUrl":
          "https://smart-shop.itheima.net/uploads/10001/20230320/0cccdb31952fbf3bc0026efbe260e40e.png",
      "imgName": "icon-1.png",
      "link": null,
      "text": "每日抄底"
    }
  ];
```



1.2 设置侧轴方向子元素宽度，此时每行展示的子元素个数是变化的

```dart
import 'package:flutter/material.dart';

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView案例1'),
        backgroundColor: Colors.red,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //  设置侧轴方向子元素宽度，，此时每行展示的子元素个数是变化的
          maxCrossAxisExtent: 100,
          mainAxisSpacing: 10,
          crossAxisSpacing: 5,
          childAspectRatio: 4/3
        ),
        children:  [
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('内容1'),
          ),
           Container(
            color: Colors.pink,
            alignment: Alignment.center,
            child: const Text('内容2'),
          ),
           Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('内容3'),
          ),
           Container(
            color: Colors.yellow,
            alignment: Alignment.center,
            child: const Text('内容4'),
          ),
           Container(
            color: Colors.cyan,
            alignment: Alignment.center,
            child: const Text('内容5'),
          ),
           Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('内容6'),
          )
        ],
      ),
    );
  }
}
```



**2. 使用方式2：builder构造函数**

固定侧轴(水平)方向子元素的个数，无论如何旋转屏幕侧轴子元素个数永远不变

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722511457882-a5c6ad67-9c53-4644-a6e5-b22b76739dd4.png)

```dart
import 'package:flutter/material.dart';

class GridView2 extends StatelessWidget {
  const GridView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView组件'),
      ),
      body: GridView.builder(
        // 主轴(垂直)默认为垂直方向，此属性用于固定侧轴(水平)方向子元素的个数
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 1.1 设置侧轴方向子元素个数，此时每行展示的子元素个数是固定的
          mainAxisSpacing: 10.0, // 1.2 主轴(垂直)方向子元素间距
          crossAxisSpacing: 5.0, // 1.3 侧轴(水平)方向子元素间距
          childAspectRatio: 4 / 3, // 1.4 子元素宽高比，默认宽高相同 1: 1
        ),
        // 子元素数量
        itemCount: 30,
        // 构造子元素
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Text('内容 $index'),
          );
        },
      ),
    );
  }
}
```



1. **使用方式3：extent构造函数**

固定侧轴(水平)方向子元素的最大宽度，无论如何旋转屏幕侧轴子元素宽度永远不变

```dart
import 'package:flutter/material.dart';

class GridView3 extends StatelessWidget {
  const GridView3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView组件'),
      ),
      body: GridView.extent(
        // 主轴(垂直)默认为垂直方向，此属性用于固定侧轴(水平)方向子元素的最大宽度
        maxCrossAxisExtent: 100.0, // 设置侧轴方向子元素宽度，，此时每行展示的子元素个数是变化的
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 4 / 3,
        children: [
          Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text('内容1'),
          ),
          Container(
            color: Colors.orange,
            alignment: Alignment.center,
            child: const Text('内容2'),
          ),
          Container(
            color: Colors.yellow,
            alignment: Alignment.center,
            child: const Text('内容3'),
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('内容4'),
          ),
          Container(
            color: Colors.cyan,
            alignment: Alignment.center,
            child: const Text('内容5'),
          ),
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('内容6'),
          ),
          Container(
            color: Colors.purple,
            alignment: Alignment.center,
            child: const Text('内容6'),
          ),
        ],
      ),
    );
  }
}
```

#### 3.4.3 CustomScrollView

场景：将多种滚动组件组合到一个可滚动的页面中

比如：将`ListView` 和 `GridView`组合到一个页面中，且可以整体滚动



```dart
import 'package:flutter/material.dart';

class CustomScrollViewWidget extends StatelessWidget {
  const CustomScrollViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomScrollView组件'),
      ),
      body: CustomScrollView(
        slivers: [
          // 1. 上部分：展示网格布局
          SliverGrid.builder(
            // 主轴(垂直)默认为垂直方向，此属性用于固定侧轴(水平)方向子元素的个数
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 1.1 设置侧轴方向子元素个数，此时每行展示的子元素个数是固定的
              mainAxisSpacing: 5.0, // 1.2 主轴(垂直)方向子元素间距
              crossAxisSpacing: 5.0, // 1.3 侧轴(水平)方向子元素间距
              childAspectRatio: 4 / 3, // 1.4 子元素宽高比，默认宽高相同 1: 1
            ),
            // 子元素数量
            itemCount: 6,
            // 构造子元素
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.pink,
                alignment: Alignment.center,
                child: Text('所引 $index'),
              );
            },
          ),
          // 3. 上下两部分的间距
          const SliverPadding(padding: EdgeInsets.only(bottom: 5)),
          // 2. 下部分：展示列表布局 (delegate类似于ListView的builder构造方法)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    height: 120.0,
                    color: Colors.orange,
                    alignment: Alignment.centerLeft,
                    child: Text('内容 $index'),
                  ),
                );
              },
              // 子元素个数
              childCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
```

##  4. 网络请求

### 4.1 dio插件 - 基本使用

dio插件是一个强大的Dart Http客户端

它支持拦截器，全局配置，FormData，请求取消，文件上传下载，监听进度，超时等等

dio插件文档：https://pub.dev/packages/dio



使用步骤：

1. dio插件安装
2. 准备请求地址
3. 创建http client
4. 发送网络请求，得到响应



**dio插件安装：**`**pubspec.yaml**`

```shell
flutter pub add dio
dependencies:
  # 网络请求插件
  dio: ^5.7.0
```

终端执行: flutter pub get



**参考代码：**

```dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioDemo extends StatefulWidget {
  const DioDemo({super.key});

  @override
  State<DioDemo> createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  @override
  void initState() {
    // 获取订单列表数据
    loadData();
    super.initState();
  }

  // 演示dio插件的基本使用
  void loadData() async {
    // 1. 准备请求地址
    String path = 'https://mock.boxuegu.com/mock/1172/orders';

    // 2. 创建http client
    Dio dio = Dio();

    // 3. 发送网络请求，得到响应
    Response response = await dio.get(path);
    // 4. 提取订单列表数据
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio插件'),
      ),
      body: Container(),
    );
  }
}
```

**运行结果:**

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722517293596-41e2c5aa-7b99-4191-b7cd-2bb297cb277f.png)



### 4.2 综合案例 - 动态渲染订单列表页

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722518569797-6342aef4-2010-4db1-abed-dbc2c330f696.png)

```dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioDemo extends StatefulWidget {
  const DioDemo({super.key});

  @override
  State<DioDemo> createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  /// 记录订单列表数据
  List _orderList = [];

  @override
  void initState() {
    // 获取订单列表数据
    loadData();
    super.initState();
  }

  // 演示dio插件的基本使用
  void loadData() async {
    // 1. 创建http client
    Dio dio = Dio();

    // 2. 发送网络请求，得到响应
    Response response = await dio.get('https://mock.boxuegu.com/mock/1172/orders');
    
    // 3. 刷新订单列表数据
    setState(() {
      _orderList = response.data;
    });
  }

  /// 生成订单状态的方法
  String getOrderState(int state) {
    switch (state) {
      case 1:
        return '待付款';
      case 2:
        return '待发货';
      case 3:
        return '待收货';
      case 4:
        return '待评价';
      default:
        return '其他';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('订单列表页'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          // 读取当前item需要的数据
          Map orderInfo = _orderList[index];

          return Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: Column(
              children: [
                // 1. 订单创建时间+订单状态
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 创建时间
                    Text(
                      orderInfo['createTime'],
                      style: const TextStyle(color: Color(0xFF666666), fontSize: 13),
                    ),
                    // 状态
                    Text(
                      getOrderState(orderInfo['orderState']),
                      style: const TextStyle(color: Color(0xFFFF9240), fontSize: 13),
                    ),
                  ],
                ),
                // 2. 商品图片+名称+数量+规格+单价
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      // 图片
                      Image.network(
                        orderInfo['image'],
                        width: 86.0,
                        height: 86.0,
                      ),
                      // 名称+数量+规格+单价
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            // 保证名称+数量+规格+单价居左对齐
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 名称+数量
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // 名称
                                  Expanded(
                                    child: Text(
                                      orderInfo['name'],
                                      style: const TextStyle(color: Color(0xFF262626), fontSize: 14),
                                    ),
                                  ),
                                  // 数量
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'x ${orderInfo['totalNum']}',
                                      style: const TextStyle(color: Color(0xFF262626), fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              // 规格
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF1F1F1),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                                  child: Text(
                                    orderInfo['attrsText'],
                                    style: const TextStyle(color: Color(0xFF888888), fontSize: 12.0),
                                  ),
                                ),
                              ),
                              // 单价
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(
                                  '¥${orderInfo['curPrice']}',
                                  style: const TextStyle(color: Color(0xFF262626), fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 3. 合计
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '合计：¥${orderInfo['curPrice'] * orderInfo['totalNum']}',
                      style: const TextStyle(color: Color(0xFF262626), fontSize: 14.0),
                    ),
                  ),
                ),
                // 4. 再次购买
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF666666), width: 0.5),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: const Text(
                        '再次购买',
                        style: TextStyle(color: Color(0xFF666666), fontSize: 14.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(height: 8.0, color: const Color(0xFFF7F7F8));
        },
        itemCount: _orderList.length,
      ),
    );
  }
}
```

