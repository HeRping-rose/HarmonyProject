## 6. flutter案例练习

### 6.1 搭建基础架子

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722739010305-2275b6ff-24ea-4a8a-b19c-b7affdbd5b26.png)

- 配置路由

```dart
//lib/main.dart

import 'package:flutter/material.dart';
import 'package:smart_shop/pages/tab_bar_page.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context)=>const TabBarPage()
    },
  ));
}
```

- 新建 tab_bar_page.dart

```dart
//lib/pages/tab_bar_page.dart
import 'package:flutter/material.dart';
import 'package:smart_shop/pages/cart/index.dart';
import 'package:smart_shop/pages/category/index.dart';
import 'package:smart_shop/pages/home/index.dart';
import 'package:smart_shop/pages/mine/index.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  // 记录当前索引
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: const [
            HomePage(),
            CategoryPage(),
            CartPage(),
            MinePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList(),
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> barItemList() {
    List<BottomNavigationBarItem> items = [];
    items.add(
      BottomNavigationBarItem(
        icon: Image.asset(
          'tabbar/home.png',
          width: 32,
          height: 32,
        ),
        activeIcon: Image.asset(
          'tabbar/home-active.png',
          width: 32,
          height: 32,
        ),
        label: '首页',
      ),
    );
    items.add(
      BottomNavigationBarItem(
        icon: Image.asset(
          'tabbar/cate.png',
          width: 32,
          height: 32,
        ),
        activeIcon: Image.asset(
          'tabbar/cate-active.png',
          width: 32,
          height: 32,
        ),
        label: '分类',
      ),
    );
    items.add(
      BottomNavigationBarItem(
        icon: Image.asset(
          'tabbar/cart.png',
          width: 32,
          height: 32,
        ),
        activeIcon: Image.asset(
          'tabbar/cart-active.png',
          width: 32,
          height: 32,
        ),
        label: '购物车',
      ),
    );
    items.add(
      BottomNavigationBarItem(
        icon: Image.asset(
          'tabbar/user.png',
          width: 32,
          height: 32,
        ),
        activeIcon: Image.asset(
          'tabbar/user-active.png',
          width: 32,
          height: 32,
        ),
        label: '我的',
      ),
    );
    return items;
  }
}
```

- 新建四个 tabBar 页面

- - pages/home/index.dart
  - pages/category/index.dart
  - pages/cart/index.dart

- - pages/mine/index.dart

```dart
//lib/pages/home/index.dart

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Text('HomePage');
  }
}
```

### 6.2 首页功能实现

#### 6.2.1  实现首页标题 + 搜索框组件

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722754153622-ef3a388c-c14e-42a4-bbec-5ffc04a997fb.png)

- 新建搜索框组件，项目通用组件放到 `components` 文件夹中。

```dart
//lib/components/shop_search_bar.dart

import 'package:flutter/material.dart';

class ShopSearchBar extends StatelessWidget {
  const ShopSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 235, 232, 232),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        padding: const EdgeInsets.only(left: 5),
        child: const Row(
          children: [
            Icon(Icons.search, color: Colors.grey,),
            Padding(
              padding: EdgeInsets.only(left: 5), child:  Text(
                '搜索你要找的商品',
                style: TextStyle(color: Colors.grey),
              )
            )
          ],
        ),
      ),
    );
  }
}
```

- 在首页中使用 搜索框 组件

```dart
//lib/pages/home/index.dart

import 'package:flutter/material.dart';
import 'package:smart_shop/components/shop_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(   // 骨架
      appBar: AppBar(  // 顶部导航栏
        title: const Text(
          '智慧商城', // 标题
          style: TextStyle(color: Colors.white), // 标题文字颜色
        ),
        backgroundColor: Colors.red, // 标题背景色
        centerTitle: true,  // 标题居中
      ),
      body: ListView(      // 滚动容器
        children: const [
          ShopSearchBar(), // 搜索框组件
          Text('首页'),
        ],
      ),
    );
  }
}
```

#### 6.2.2 获取首页数据

接口地址:  http://smart-shop.itheima.net/index.php?s=/api/page/detail

- 终端安装 Dio:

```bash
flutter pub add dio
```

- 检查 pubspec.yaml 配置文件

```dart
//pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  dio:
    ^5.7.0
```

- 首页请求接口数据:

```dart
//lib/pages/home/index.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. 定义字典存储接口数据
  Map resData = {};

  @override
  void initState() {
    // 3. 生命中周期调用
    getResData();
    super.initState();
  }

  // 2. 获取接口数据
  void getResData() async {
    Dio dio = Dio();
    Response res = await dio
        .get('http://smart-shop.itheima.net/index.php?s=/api/page/detail');
    setState(() {
      resData = res.data['data']['pageData'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // ...省略
  }
}
```

#### 6.2.3  flutter 配置本地解决 web 端跨域

 默认情况下, flutter 运行 web 端加载网络资源会报跨域提示错误。

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722758062542-7fdbb4ea-7f05-4f5c-b761-6fc3d630fc02.png)

解决方案：

1. **开发环境：**在 flutter/packages/flutter_tools/lib/src/web/chrome.dart 如下图位置添加 `'--disable-web-security',`
2. **生产环境：**针对本地dev环境解决方案，若要发布生产需要**后端配合**添加响应头实现 'Access-Control-Allow-Origin', '*'

- 开发环境可通过修改 flutter 本地配置解决。

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722758131001-021c5ca5-016c-4c01-ac62-6f8283784a00.png)

- 删除如下图两个文件，之后执行`flutter doctor` , 重新编译flutter_tools,  然后重新启动项目

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722758197668-d1b66b97-962c-48d5-a99f-f8fa4d72eb67.png)

#### 6.2.3  首页轮播图

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722760265541-edf87150-ce7b-4ad7-a2f2-51e9ace78572.png)

1. **安装插件**

插件使用github: https://github.com/serenader2014/flutter_carousel_slider/tree/master

```dart
//pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  dio:
    ^5.5.0
  carousel_slider: 
    ^5.1.1
```



```dart
//home_banner.dart

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key, required this.bannerList});

  // 定义列表接收父组件传值
  final List bannerList;

  @override
  Widget build(BuildContext context) {
    if (bannerList.isNotEmpty) {
      return CarouselSlider(
          items: bannerList
              .map((item) => GestureDetector(
                    // 点击操作 
                    onTap: () {
                      if (kDebugMode) {
                        print('点击了, id:${item['imgName']}');
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: Image.network(
                        item['imgUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
              .toList(),
          // 常用配置
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            height: 150,
          ));
    } else {
      return Container();
    }
  }
}

```

```dart
//home/index.dart

body: ListView(
  children: [
    const HomeSearchBar(),
    HomeBanner(bannerList: bannerList)
  ],
),
```



#### 6.2.4  首页金刚区导航

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722763020536-a8cb6750-015d-4805-861f-e121e7660174.png)



```dart
//home_nav.dart

import 'package:flutter/material.dart';

class HomeNav extends StatelessWidget {
   const HomeNav({super.key, required this.navList});

  // 定义列表接收父组件传值
  final List navList;

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, 
        mainAxisSpacing: 0, 
        crossAxisSpacing: 0, 
        childAspectRatio: 1, 
      ),
      itemCount: navList.length,
      // 处理listview嵌套报错
      shrinkWrap: true,
      // 构造子元素
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                Expanded(child: Image.network(
                  navList[index]['imgUrl'],
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                )),
                Expanded(child: Text(navList[index]['text'], style: const TextStyle(fontSize: 13),))
              ],
            ),
          ),
        );
      },
    );
  }
}

```

```dart
//home/index.dart

body: ListView(
    children: [
      const HomeSearchBar(),
      HomeBanner(bannerList: bannerList),
      HomeNav(navList: navList)
    ],
),
```



#### 6.2.5 首页广告位和猜你喜欢

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722764107645-56ad6a17-6e67-40df-b095-912cae725186.png)

```dart
//home/index.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/pages/home/components/home_banner.dart';
import 'package:smart_shop/pages/home/components/home_nav.dart';
import 'package:smart_shop/pages/home/components/home_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. 定义字典存储接口数据
  Map resData = {};
  List bannerList = [];
  List navList = [];
  List adList = [];

  @override
  void initState() {
    getResData();
    super.initState();
  }

  // 2. 获取接口数据
  void getResData() async {
    Dio dio = Dio();
    Response res = await dio
        .get('http://smart-shop.itheima.net/index.php?s=/api/page/detail');
    setState(() {
      // 2.1 完整数据
      resData = res.data['data']['pageData'];
      // 2.2 轮播图数据
      bannerList = resData['items'][1]['data'];
      // 2.3 导航组数据
      navList = resData['items'][3]['data'];
      // 2.4 广告图片数据
      adList = resData['items'][4]['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '智慧商城',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const HomeSearchBar(),
          HomeBanner(bannerList: bannerList),
          HomeNav(navList: navList),
          // 广告位
          adList.isNotEmpty ? Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Image.network('${adList[0]['imgUrl']}'),
          ) : Container(),
          // 富文本-猜你喜欢
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
              alignment: Alignment.center,
              child: const Text('—— 猜你喜欢 ——'),
            ),
          ),
        ],
      ),
    );
  }
}
```

#### 6.2.6 首页商品列表

![image.png](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722765625276-f8d4ba14-739c-43c4-a009-326f7c40a092.png?x-oss-process=image%2Fformat%2Cwebp)



```dart
//home_shop_list.dart

import 'package:flutter/material.dart';

class HomeShopList extends StatelessWidget {
  const HomeShopList({super.key, required this.goodsList});

  final List goodsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Map item = goodsList[index];
          return Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            height: 120,
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(
                    '${item['goods_image']}',
                    width: 100, height: 120, fit: BoxFit.contain,
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${item['goods_name']}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text("已售${item['goods_sales']}件", style: const TextStyle(color: Color.fromARGB(255, 107, 98, 98)),),
                          Expanded(child: 
                          Row(
                            children: [
                              Text("¥${item['goods_price_min']}", style: const TextStyle(color: Colors.red),),
                               Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                              "¥${item['line_price_min']}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 107, 98, 98), decoration: TextDecoration.lineThrough),
                            ),
                               )
                            ],
                          )
                         )
                        ],
                      )
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 10,
            color: const Color.fromARGB(255, 239, 232, 232),
          );
        },
        itemCount: goodsList.length);
  }
}
```

```dart
//home/index.dart

HomeShopList(goodsList: goodsList)
```


## 5. 路由操作

作用：用于实现页面之间的跳转并可以传值

需求：订单列表页(`OrderList`) 跳转到 订单详情页(`OrderDetail`)

![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722605863304-01971c58-51e5-442a-b873-377da3cc83a7.png)![img](https://cdn.nlark.com/yuque/0/2024/png/38706227/1722605894029-d0bae5d8-b768-4803-b418-b801f2b7e683.png)

### 5.1 实现方式1：Navigator

订单列表页(`OrderList`) ：注册点击事件，点击时跳转到 订单详情页(`OrderDetail`)

`GestureDetector`组件用于点击手势事件，比如，屏幕点击手势事件

```dart
GestureDetector(
  // 点击事件执行函数
  onTap: () {
    // 路由跳转方式1：Navigator
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return const OrderDetail();
      },
    ));
  },
  child: Container(
    // 子组件
  ),
);
```



订单详情页(`OrderDetail`) ：注册点击事件，点击时返回到 订单列表页(`OrderDetail`)

```dart
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('订单详情'),
      ),
      body: Center(
        child: TextButton(
          child: const Text(
            '点击返回订单列表页',
            style: TextStyle(fontSize: 24.0),
          ),
          onPressed: () {
            // 路由返回上一级页面
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
```

### 5.2 实现方式2：命名路由

**1. 定义命名路由：**`**main.dart**`

```dart
return MaterialApp(
  // home: const OrderList(),
  
  // 定义命名路由
  routes: {
    '/': (context) => const OrderList(), // 订单列表页（第一屏展示的页面）
    '/details': (context) => const OrderDetail(), // 订单详情页
  },
);
```



**2. 订单列表页(**`**OrderList**`**) ：注册点击事件，点击时跳转到 订单详情页(**`**OrderDetail**`**)**

`GestureDetector`组件用于点击手势事件，比如，屏幕点击手势事件

```dart
GestureDetector(
  // 点击事件执行函数
  onTap: () {
    // 路由跳转方式2：命名路由，根据路由映射关系跳转页面
    Navigator.pushNamed(context, '/details');
  },
  child: Container(
    // 子元素
  ),
);
```



**3. 订单详情页(**`**OrderDetail**`**) ：注册点击事件，点击时返回到 订单列表页(**`**OrderDetail**`**)**

```dart
TextButton(
  child: const Text(
    '点击返回订单列表页',
    style: TextStyle(fontSize: 24.0),
  ),
  onPressed: () {
    // 路由返回上一级页面
    Navigator.pop(context);
  },
)
```

