# 1. int类型
a = 1
b = a

# print(b)
# print(id(a))
# print(id(b))

a = 2
print(b)  # 1,说明int类型为不可变类型

# print(id(a))
# print(id(b))

aa = [10, 20]
bb = aa

print(id(aa))  # 2325297783432
print(id(bb))  # 2325297783432


aa.append(30)
print(aa)
print(bb)  # [10, 20, 30], 列表为可变类型
#
print(id(aa))  # 2325297783432
print(id(bb))  # 2325297783432