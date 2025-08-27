import 'package:flutter/material.dart';
import 'package:zhihuishangcheng/pages/home/index.dart';
import 'package:zhihuishangcheng/pages/category/index.dart';
import 'package:zhihuishangcheng/pages/cart/index.dart';
import 'package:zhihuishangcheng/pages/mine/index.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      //indexpage暂时不配置appbar (后面子页个性化)
      child: Scaffold(
        // body: Container(child: Text("首页")),
        //安全区组件  在安全区组件的内容 都会在安全区域内,
        //自动根据不同设备处理顶部/底部的键盘等的内边距padding
        body: SafeArea(
          //IndexedStack内置组件,根据设定的那个indexd显示对应的子组件
          //stack堆叠组件 ,现在4个子集叠加在一起.只会显示一个,具体显示更具indexd显示
          //这个组件中的4个子集,在切换时不是创建/销毁 ,只是切换层级(在上方显示或者被叠在下方)
          child: IndexedStack(
            index: activeIndex,
            children: const [
              HomePage(),
              CategoryPage(),
              CartPage(),
              MinePage(),
            ],
          ),
        ),
        //配置底部导航栏菜单
        bottomNavigationBar: BottomNavigationBar(
          items: botNavItems(),
          type: BottomNavigationBarType.fixed,
          //fixed 固定  //.shifting: ,,  默认是  :多于3个子项不显示label.选中的项会变大
          currentIndex: activeIndex, //当前选中项
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            //点击事件  点击子项会触发事件   参数默认是index 返回index
            print(index);
            activeIndex = index;
          },
        ),
      ),
    );
  }
}

//底部导航栏菜单项
List<BottomNavigationBarItem> botNavItems() {
  return [
    BottomNavigationBarItem(
      icon: Image.asset("tabbar/home.png", width: 32, height: 32),
      label: "首页",
      activeIcon: Image.asset(
        "tabbar/home-active.png",
        width: 32,
        height: 32,
        color: Colors.blue,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset("tabbar/cate.png", width: 32, height: 32),
      label: "分类",
      activeIcon: Image.asset(
        "tabbar/cate-active.png",
        width: 32,
        height: 32,
        color: Colors.blue,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset("tabbar/cart.png", width: 32, height: 32),
      label: "购物车",
      activeIcon: Image.asset(
        "tabbar/cart-active.png",
        width: 32,
        height: 32,
        color: Colors.blue,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset("tabbar/user.png", width: 32, height: 32),
      label: "我的",
      activeIcon: Image.asset(
        "tabbar/user-active.png",
        width: 32,
        height: 32,
        color: Colors.blue,
      ),
    ),
  ];
}
