void main() {
// 1.匿名函数赋值给变量，并调用
var fn = (String name, int age) {
  print("姓名：$name，年龄：$age");
};
fn("David", 40);


// 2.可以作为参数传递给其他函数去调用（回调函数）
  processInfo(fn);
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

