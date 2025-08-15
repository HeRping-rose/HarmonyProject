a= 10
b=20
# 1. 定义中间变量

c = 0

# 2. 将a的数据存储到c
c = a
# 3. 将b的数据20赋值到a，此时a = 20
a = b
# 4. 将之前c的数据10赋值到b，此时b = 10
b = c


print(a)
print(b)

a, b = 1, 2
a, b = b, a

print(a)  # 2
print(b)

