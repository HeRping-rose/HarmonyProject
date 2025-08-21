void main() {
  // 1. 定义字符串
  String name="张三";
  var age=18, height=1.75, weight=70;
  // 4. 字符串插值
  String info = "姓名：$name，年龄：$age，身高：${height * 100}cm，体重：$weight";
  print(info);

  // 2. 修改字符串
  name="李四";
  print(name);
  // 3. 字符串拼接
  String greeting = "你好，" + name;
  print(greeting);
  // 4. 字符串换行
  String multiline = "你好，$name\n欢迎来到Dart世界！";
  print(multiline);

  // 5. 多行字符串
  String multiline2 = """
  你好，$name
  欢迎来到Dart世界！
  """;
  print(multiline2);

  //字符串常用属性和方法
  String str = "  Hello, Dart! ";
  print(str.trim()); // 去除两端空格  修剪
  print(str.length); // 字符串长度
  print(str.length==0); // 是否为空
  print(str.isEmpty); // 是否为空
  print(str.isNotEmpty); // 是否不为空
  print(str.contains("Dart")); // 是否包含子串
  print(str.indexOf("Dart"));

  print(str.startsWith("H")); // 是否以H开头
  print(str.startsWith(" ")); // 是否以H开头
  print(str.endsWith("!")); // 是否以!结尾

  print(str.toUpperCase()); // 转为大写
  print(str.toLowerCase()); // 转为小写

  print(str.replaceAll("Dart", "Flutter")); // 替换子串
  print(str.split(", ")); // 按逗号分割字符串
  print(str.split(" ")); // 按空格分割字符串
  print(str.split("")); // 按空格分割字符串


  print(str.substring(2, 7)); // 截取子串

  print(str.indexOf("Dart")); // 查找子串位置
}
