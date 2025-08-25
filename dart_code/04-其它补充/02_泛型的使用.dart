void main() {
  // 1. 使用泛型限定List中元素的类型<>
  List<String> stringList = [];
  stringList.add('小何');
  // 1.1 让列表中的元素只能是字符串类型

  // 1.2 让列表中的元素只能是数字类型

  // 2. 使用泛型限定Map中键和值的类型
  Map<String, dynamic> stringIntMap = { 'age': '18', 'height': 180,  };
  print(stringIntMap['age']); 
  // 2.1 键和值都可以是任意类型

  // 2.2 键和值都只能是字符串类型

  // 2.3 键字符串类型, 值是任意类型


  // 
  T sum<T extends dynamic>(T a, T b){
    
    //实现a+b
    return a + b as T;
  }
  print(sum(1.8, 2.0 )) ;
  print(sum('1.8', 'fasdfa' )) ;


}
