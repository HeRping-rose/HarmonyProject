#类->对象
#类名接的这个括号是用来继承的()，如果这个类没有继承任何的父类，这个括号，可以不用写
class Person:
    #如果我们希望在生成一个对象时，先给对象添加上一些属性，写在__inti__初始化属性
    #在类的内部，由于实际的对象还没有生成，如果要给对象添加属性，在类中用self来代表实例对象
    def __init__(self,name,age,phone):
        self.name = name
        self.age = age
        self.phone = 76845654

    def eat(self,n):
        print(self.age+n)

#通过类生成出来的每个对象都是独立的，它们之间不会有任何的干扰
xiaoming = Person("xiaoming",20,145576657)
# xiaoming = {name:"xiaoming",age:20,phone:234234,eat:lambda x:x，email:xx,adddres}
laobai = Person("laobai",65,76845654)
# laobai = {name:"laobai",age:65,phone:76845654,eat:lambda x:x}

#对象操作
#1.查、调用
print(xiaoming.age) #通过对象。属性名
#print(xiaoming.abc) #如果一个对象上没有这个属性，会报错
xiaoming.eat(10) #如果要调用对象上的（函数）方法，要用属性名接（）才是调用

#2.增 给对象上不存在的属性赋值，就是在给这个对象添加这个新的属性
xiaoming.email = "xxxx@345.com"
xiaoming.address = "dfgjldfgljdfg"
print(xiaoming.email)
# print(laobai.email)
#3.改  给对象上已经存在的属性赋值，那么就是在修改这个属性的值（）
# 一个对象上每一个属性、方法，都是唯一的，不可能存在多个一样的属性或方法
xiaoming.email = "345345@345.com"
print(xiaoming.email)

#4.删除 删除整个对象，或删除对象上的属性或方法
del laobai #将老白这个对象删除了，再访问老白会报错
del xiaoming.name
print(xiaoming.name)

