void main() {   //与js中的对象 和 py中的字典dict一致
// 1. 存储商品分类的编号 和 名称
Map categories = {
  1: '居家',
  2: '美食',
  3: '服饰',
  4: '电子产品',
};


// 2. 对字典数据进行查改增删
// 2.1 查询：字典[key]
print(categories[1]); // 查询编号为1的分类

// 2.2 修改：字典[key] = 新值
categories[1] = '居家生活';
print(categories[1]);

// 2.3 新增：字典[新key] = 新值
// 注意：key必须是当前字典中不存在的key，如果key已存在就是修改
categories[5] = '图书';
print(categories[5]);
// 2.4 删除：remove(key)
// 注意：如果key不存在，不会报错，也不会执行删除操作
categories.remove(5);
print(categories[5]);

// 3. 遍历字典
for (var key in categories.keys) {
  print('编号: $key, 分类: ${categories[key]}');
}

//取出键值

for (var value in categories.values) {
  print('分类: $value');
}

//取键
for (var key in categories.keys) {
  print('编号: $key');
}
List key= categories.keys.toList();
List value= categories.values.toList();
print(key);
print(value);

}