#以输入的形式创建一个变量, input()全局方法，它的返回值都是一个字符串
n = input("请输入一个操作数:")
n2 = input("请输入另个操作数:")
#如何去检查数据类型 type()
#print(type(n))  # <class 'str'>  这是一个对象，是由str类所实例化出来的对象，那么就是一个字符串对象

#数据类型的转换   int()  float()  str()
print(int(n)+int(n2))



# print()  input()  type()