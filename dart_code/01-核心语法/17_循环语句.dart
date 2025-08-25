void main() {
  // 1. while循环
  // 重复打印10次 '月薪过万'
  var i = 0;
  while (i < 10) {
    print('月薪过万');
    i++;
  }

  // 2. for循环
  // 重复打印5次 '李白姓白'
  for (var j = 0; j < 5; j++) {
    print('李白姓白');
  }

  // 3. 使用循环遍历列表
  // 3.1 遍历列表：for循环
  List categories = ['居家', '美食', '服饰'];
  for (var i = 0; i < categories.length; i++) {
    print(categories[i]);
  }

  // 3.2 遍历列表：for ... in 也可以使用关键词break
  for (var category in categories) {
    print(category);
  }

  // 4. 终止循环
  // 4.1 break：中断整个循环
  // 吃到第三个苹果发现了虫子，剩下的苹果没胃口都不吃了
  for (var i = 1; i <= 5; i++) {
    if (i == 3) {
      print('发现虫子，剩下的苹果不吃了');
      break;
    }
    print('吃第 $i 个苹果');
  }

  // 4.2 continue：跳过本次循环直接进入下一次循环
  // 吃到第三个桃子发现了虫子，第三个桃子不吃了，剩下的桃子接着吃
  for (var i = 1; i <= 5; i++) {
    if (i == 3) {
      print('发现虫子，第三个桃子不吃了');
      continue;
    }
    print('吃第 $i 个桃子');
  }
}
