void main() {
  // 列表相当于js中的数组
  // 1. 定义数字列表
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);
  print(numbers[0]);
  print(numbers.length);
  //第一个 最后一个 反转 是否为空
  print(numbers.first); // 第一个元素
  print(numbers.last); // 最后一个元素
  print(numbers.reversed); // 反转
  print(numbers.isEmpty); // 是否为空

  // 2. 定义分类列表
  List<String> categories = ['居家', '美食', '服饰'];

  // 3. 存储任意类型的数据
  List<dynamic> items = [1, '苹果', 3.14, true];
  print(items);

  // 4. 使用列表：查改增删
  // List categories = ['居家', '美食', '服饰'];
  print(categories);
  // 4.1 查询列表长度
  print(categories.length);

  // 4.2 查询指定的元素
  print(categories[0]); // 查询第一个元素

  // 4.3 修改：列表[索引] = 新值
  categories[0] = '居家生活';
  print(categories[0]);

  // 4.4 新增：列表.add(新元素)、列表.addAll(新列表)
  categories.add('电子产品');
  categories.addAll(['图书', '运动']);
  print(categories);

  // 4.5 指定位置添加：列表.insert(索引, 内容');
  categories.insert(1, '母婴');
  print(categories);

  // 4.6 删除：使用元素删除、使用索引删除
  categories.remove('母婴');  //删除一项  返回
  categories.removeAt(1);
  //删除最后一个
  categories.removeLast();

  //根据条件删除
  categories.removeWhere((category) => category.startsWith('图'));
  print(categories);

  // 4.7 遍历列表：读取出列表中每一个元素
  for (var category in categories) {
    print(category);
  }
  //map where any every  sort
  var upperCategories = categories.map((category) => category.toUpperCase());
  print(upperCategories);

  var filteredCategories = categories.where((category) => category.contains('家'));
  print(filteredCategories);

  //sort
  categories.sort( (a, b) => a.length.compareTo(b.length));
  print(categories);

  //打乱列表顺序
  categories.shuffle();
  print(categories);
  //sublist 生成一个子列表
  var subCategories = categories.sublist(1, 3); // 获取索引1到3的子列表
  print(subCategories);

  //generate 生成一个列表
  var generatedCategories = List.generate(5, (index) => '分类${index + 1}');
  print(generatedCategories);
  //foreach
  generatedCategories.forEach((category) {
    print(category);
  });

}
