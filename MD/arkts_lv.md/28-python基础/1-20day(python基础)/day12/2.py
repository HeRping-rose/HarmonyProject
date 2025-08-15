from functools import reduce
users = [
    {"username":"小明","password":123,'money':1450},
    {"username":"李二狗","password":345,'money':1300},
    {"username":"小白","password":7867,'money':540}
]
a = [1,3,4,5,76,8]
# reduce() 减少：就是把一个大列表减少成某一个值，如：把所有的值相加得到一个值
print(reduce(lambda a,b:a+b,a))
print(sum(a))


print(reduce(lambda a,b:a+b,list(map(lambda i:i['money'],users))) )
