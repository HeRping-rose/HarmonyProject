a = [1,3,4,5]
# b = a  #把a的内存地址告诉给了b

# b = a[:] #浅拷贝
b = a.copy() #浅拷贝

b.append(100)
a.insert(0,99)

print(a)
print(b)