num = 10
for i in range(1,10,2):
    print(i)
#
#带索引 循环
a = [1,3,45,6]
for index,item in enumerate(a):
    print(f"{index}-{item}")

#多个列表一起循环
b = [5,76,8,88]
for i,j in zip(a,b):
    print(f"{i}-{j}")

# a = [1,3,45,1]
# b = (1,43,45,65)
# c = {21,43,5,6,4}
#d = {"name":"小明","age":20} #dict字典  转 对象 json