a=100
def testA():
    print(a)

def testB():
    a=200
    print(a)


testA()
testB()
print(f'全局变量a = {a}')