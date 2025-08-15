#字典 （存数据，把一个事物的所有相关的属性组织到一起）
person = {'name':"小明",'age':20,'sex':'男',"height":180}
#查
print(person['name'])
print(person['height'])
#print(person['email']) # 当查一个不存在key时，会报错
print(person.get("email")) #None 空（假值）
if person.get("email"):
    print(f"你的邮箱是{person.get('email')}")
else:
    print("没有邮箱")

print(person.get("address","武汉光谷"))

print(person.keys())
print(person.values())
print(person.items())
#循环 只取值
for i in person.values():
    print(i)
#循环 key和value都要
for key,value in person.items():
    print(key)
    print(value)

#增
person['phone'] = 1456457645
#改
person['phone'] = 32459894536
#删
del person['phone']

print(person)

