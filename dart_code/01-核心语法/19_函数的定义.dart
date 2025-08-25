void main() {
  showMessage();
  int result = add(10, 20);
  print('10 + 20 = $result');
  String result2 = add2('Hello, ', 'World!');
  print(result2);
  print(add3(10, 20));
  print(flagFn(add3(10, 20)));
  print(add4(10, 20));
  
}

// 1. 定义函数：无参数无返回值函数
void showMessage() {
  print('月薪过万');
}

// 2. 定义函数：有参数有返回值函数
// 需求：定义函数，计算任意两个整数的和，并返回计算结果
int add(int a, int b) {
  return a + b;
}

// 3. 函数的特点：
// ● 函数都有返回值，如果没有明确的指定返回值，那么默认返回null
// ● 返回值类型和参数类型是可以省略的
String add2(String a, String b) {
  return a + b;
}

List<int> add3(int a, int b) {
  return [a + b, a - b, a * b, a ~/ b];
}

bool flagFn(List<int> a){
  return a.every((i) => i > 10);
}



Map<String, int> add4(int a, int b) {
  return {
    "sum": a + b,
    "sub": a - b,
    "mul": a * b,
    "div": a ~/ b
  };
}

