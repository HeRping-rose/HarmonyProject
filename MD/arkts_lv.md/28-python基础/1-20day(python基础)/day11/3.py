#lambda 表达式  (简化代码)

def fn1():
    return 200

#声明一个变量，把一个匿名函数赋值给了fn2,
#虽然这个函数没有名字，但赋值fn2，这里的fn2就代表了函数名
fn2 = lambda :200

print(fn2())
#普通函数
def sum(a,b):
    return a+b

print(sum(1,2))
#lambda
sum2 = lambda a,b:a+b
print(sum2(1,2))