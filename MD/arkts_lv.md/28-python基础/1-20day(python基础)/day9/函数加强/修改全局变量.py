a = 100


def testA():
    print(a)


def testB():
    # global 关键字声明a是全局变量
    global a
    a = 200
    print(a)

testA()  # 100
testB()  # 200
print(f'全局变量a = {a}')