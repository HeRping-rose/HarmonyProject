#变量
age = 20
age = "abc"
print(age)

#全局方法
# print() 打印到环境中
# type()数据类型的检测
# len() 查看长度
# str() 转字符串
# int() 转整数
# float() 转小数
#input() 输入变量

#数据类型的检测
# print(type(age))

#if语句
# light = int(input("输入灯的颜色： 1.红灯 2.绿灯 3.黄灯"))
# if light == 1:
#     print("停")
# elif light == 2:
#     print("行")
# else:
#     print("小心")

#for语句
# 计算奇数的个数 和 偶数的和 -》 [3,768]
# nums = [3,4,5,6,87,6,64,7,768,3,2]
# count = 0
# total = 0
# for i in nums:
#     if i%2:
#         count+=1
#     else:
#         total+=i
# print([count,total])


#字符串方法
# s = "helllo"
# l = [2,4,5,6,8]
#
# #索引
# s[0]
# l[1]
# # 切片
# s[2:5]
# #长度
# len(l)
# #count()
# print(s.count("l"))
# print(l.count("5"))
#字符串的方法
# print(s.split("e"))
# print([i for i in s])
# print("+".join([str(i) for i in l]))
# print(s.upper())
# print(s.lower())
#列表方法
l = [23,56,7,78,89]
l.append(100)
l.extend([23,4,6,7,23])
l.insert(0,1)
l.pop(1)
l.remove(6)
l.reverse()
l.sort(reverse=True)
x = l.copy()
print(l)











