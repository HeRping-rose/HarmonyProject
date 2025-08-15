score = [60,67,23,89,100,56,98,68,86]
# print(a)
# all() 当所有的值都为True时，才返回True
# any() 当所有值中有任意某一个为true时，就返回true
# if all([i>=60 for i in score]):
#     print("全班都及格了")
# else:
#     print("有人不及格")

if all(i>=60 for i in score):
    print("全班都及格了")
else:
    print("有人不及格")

if any(i==100 for i in score):
    print("有人得满分")
else:
    print("没有满分")