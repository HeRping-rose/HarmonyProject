#过滤（满足条件的那些项）
num = [12,45,56,34,345,45,56,567]
print([i for i in num if i>100])
print([i for i in num if i%2])
users = [
    {"username":"小明","password":123,'money':200},
    {"username":"李二狗","password":345,'money':1300},
    {"username":"小白","password":7867,'money':540}
]
print([i for i in users if i["money"]>1000])
print([i for i in users if i["username"][0] == "小" and len(str(i["password"]))>3 ])

nums = [
    [1,2,4,56],
    [1,3,4,6],
    [6,56,7,87]
]
print([j*10 for i in nums for j in i if j>50])
#字典推导式
num2 = [12,45,56,34,345,45,56,567]
print({index:i for index,i in enumerate(num2)})
counts = {'MBP': 268, 'HP': 125, 'DELL': 201, 'Lenovo': 199, 'acer': 99}
print({key:value for key,value in counts.items() if value>200})