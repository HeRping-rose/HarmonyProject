# print("")

#函数声明
# def print(a):
#     pass
#函数调用
# print("xxx")
#
# def abc(a):
#     pass
# abc("xxx")

#函数：封装、复用
def sum(str,a,b,c,d):
    # str = "721492"
    total = 0
    for i in str:
        total+=int(i)
    print(total)

sum("721492",123,[234143,234],(1,34),{"XX":111})
# sum("12813",566)

#函数的返回值
def find(str):
    return int(str)*19.6775

a = find("8")

print("8的20倍是%d" % a)

score = "我的分数是980,234,45"
b = score.find("9") #5

print(score[b:])

#对象
# person = {name:"小明",age:20,height:"23",def cook(): anbemxxxx,def boll():}
# print(person.name)
# person.cook()
#
# person = {'name':"小明",age:20,height:"23"}
# person['name']

