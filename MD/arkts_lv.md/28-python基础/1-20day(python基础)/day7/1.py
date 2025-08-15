#推导式
# 1.  for i in range(10) 循环0-9这个范围，每一次循环出来的值赋值给i
# 2. i for i in range(10) 把每一次循环出来的值，取出
# 3. [ i for i in range(10) ] 把取出的i，都装到一个列表中

print([i for i in range(10)]) # 立即执行循环并给得到结果，装到一个列表中
print(i for i in range(10)) #generator生成器，它不会立即执行，只会在循环取值时才执行

#更新(每一项)
li = [345,253,485,506,456]
print([int(i/100)*100 for i in li])
print([int(str(i)[-1]) for i in li])
print("".join([str(int(i)**2) for i in str(9119)]))
# 9119 -> 9*9 1*1  -> 811181
users = [
    {"username":"小明","password":123,'money':0},
    {"username":"李二狗","password":345,'money':1300},
    {"username":"小白","password":7867,'money':540}
]
print([i["username"] for i in users])

print([{"username":"*"+i["username"][1:],"money":i["money"]*1.1} for i in users])
print([list(i.values()) for i in users])
#[ ["小明",123，100],["小明",123，100],["小明",123，100] ]
# 不适合推导式的情况
for i in users:
    i["money"]-=100
print(users)

for index,i in enumerate(users):
    i["id"]=index+1
print(users)

