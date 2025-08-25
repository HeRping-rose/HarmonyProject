void main() {
  // 1. 捕获异常：try catch
  try {
    String str = 'hello';
    if (str != 'hello') {
      throw Exception('字符串不相等');
    }
    print('字符串相等');
  } catch (e) {
    print(e);
  }

  // 2. 手动抛出异常：判断字符串是否相等，如果不相等手动抛出异常
  String str2 = 'world';
  if (str2 != 'hello') {
    throw Exception('字符串不相等');
  }
}
