dict1 = {'name': 'Tom', 'age': 20, 'gender': '男'}
# 查找name的值
# print(dict1.get('name'))  # Tom
#
# # get()方法
# # 获取不存在的值并传入
# print(dict1.get('id',220))
# # 获取不存在的键省略参数
# print(dict1)

#  keys()
dict2 = {'name': 'Tom', 'age': 20, 'gender': '男'}
# 打印字典的值
print(type(dict2.keys()))  # dict_keys(['name', 'age', 'gender'])
print(dict2.values())  # dict_keys(['name', 'age', 'gender'])

print(dict1.items())

# 打印字典的值视图对象

#打印字典的键视图对象


# 循环打印字典键值对 视图对象