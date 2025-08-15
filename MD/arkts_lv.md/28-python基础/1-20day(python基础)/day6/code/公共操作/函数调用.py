
def testB():
    print('---testB start----')
    print("这里是testB的函数执行代码....")
    print('----testB end---')

def testA():
    print('---testA start---')
    testB()
    print('----testA end----')

testA()
