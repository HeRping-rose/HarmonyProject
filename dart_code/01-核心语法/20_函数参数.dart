void main() {
  personFn('Alice', 30);
  personFn('Bob', 25, height: 175);//命名的形式传入
}

//{int ? height}   可选参数  |{int ? height=185}   默认参数
void personFn(String name, int age,{int ? height}) {
  print('Name: $name, Age: $age'+(height != null ? ', Height: $height' : ''));
  // if (height != null) {
  //   print('Height: $height');
  // }
}
