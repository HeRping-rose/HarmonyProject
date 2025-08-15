users = [
    {"username":"小明","password":123,'money':1450},
    {"username":"李二狗","password":345,'money':1300},
    {"username":"小白","password":7867,'money':540}
]
a = [1,3,4,5,76,8]
#filter 过滤
print([i for i in a if i<10])
print(list(filter(lambda i:i<10,a)))

# def putuser(i):
#     return i['money']<1000
print(list(filter(lambda i:i["money"]<1000,users)))

# print() input()  str() int() bool() list() set() tuple() dict() ,  len() max() min() , map() reduce() filter()