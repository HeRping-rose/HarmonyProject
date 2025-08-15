li = [23,2,5,6,32,78,0,3,24,8,789,9]
# print(li[::-1])
# print(li.count(23))
# li.append(1)
# li.extend([12,6,56,5])
# li.insert(0,100)
# li.insert(1,100)
# del li[1]
# li.pop(1)
# li.remove(24)
# li[0] = 100
# li.reverse()
li.sort()
li.sort(reverse=True)
print(li)

arr = ["小明","小白","小狗"] # arr = X000101 内存地址
arr2 = arr #把arr所知道的x000101这个址告诉给了arr2，arr2知道的也是同样的一地址
#arr2 = arr.copy()
arr.pop() # 把仓库中的货搬出一个
print(arr)
print(arr2) #请问，arr2再去这个仓库看时，货是不是有变少

#更新(列表中的每一项)
arr = [123,4000,300,65]
#推导式
print([i*0.5 for i in arr])
print([str(i) for i in arr])
#过滤(满足条件的那些项)
print([i for i in arr if i%2==0])