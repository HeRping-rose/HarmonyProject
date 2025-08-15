users = [
    {"username":"小明","password":123,'money':1450},
    {"username":"李二狗","password":345,'money':1300},
    {"username":"小白","password":7867,'money':540}
]
#推导式 更新
a = [1,3,4,5,76,8]
print([i**2 for i in a])

# map() 更新
# print(map(处理函数,目标列表))
print(list(map(lambda i:i**2,a)))

def updatefn(i):
    i["money"]-=100
    i["id"] = 1
    return i

print(list(map(updatefn,users)))