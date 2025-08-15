#变量作用域
#在全局作用中声明的变量可以作用于全局和函数中
# b = 10
# def xx():
#     #在函数中声明的变量，只能作用于函数的内部，在函数外部访问不到
#     a = 100
#     print(a)
#     #在函数中声明一个变量b
#     b = 200
#     #打印b,先看在当前作用域中有没有b，如果有获取，如果没有才向上一级作用域中查找
#     print(b)
#
# xx()
# #print(a)
# print(b)

#关键字参数 (清除了参数的顺序需求)
def xx(a=1,b=1,c=1):
    print(a+b+c)

xx(b=100,c=5,a=10)
xx()
xx(b=9)

#不定长参数
#args ->arguments 是用于接收所有形参的元组
def sum2(*args):
    total = 0
    for i in args:
        total+=i
    print(total)
sum2(1,2)
sum2(1,4,56,5,7,7,65,567,7,5678,5678,58,568,58,5678)

def sum3(name,*args):
    total = 0
    for i in args:
        total+=i
    print(f"{name}的总分:{total}")
sum3("小明",100,67,34)

def return_num():
    return 100, 200

num1, num2 = return_num()
print(num1)  # 100
print(num2)  # 200







