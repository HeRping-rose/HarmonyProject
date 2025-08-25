void main() {
  //声明一个变量myfn 他的数据类型是函数
  //然后fn所存的内存地址 赋值给了myfn变量  那么现在myfn变量就可以调用myfn所存的内存地址的函数了
  void Function(String, int) myfn = printInfo;
  myfn("David", 40);

  processInfo(printInfo);
  printInfo("David", 40);
  printInfo("Eva", 35);
  printInfo("Charlie", 28);

  //匿名函数传入
  processInfo((name, age) {
    print("姓名：$name，年龄：$age");
  });

}

// 1. 函数可以作为对象赋值给其他变量
void printInfo(String name, int age) {
  print("姓名：$name，年龄：$age");
}



// 2. 函数可以作为参数传递给其他函数
void processInfo(void Function(String, int) fn) {
  fn("Charlie", 28);
}
