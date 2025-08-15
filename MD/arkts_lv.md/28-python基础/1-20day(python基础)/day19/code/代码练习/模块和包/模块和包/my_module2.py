# 定义多个功能，把某个功能添加到__all__

def testA():
    print('testA')


def testB():
    print('testB')

__all__ = ['testA']

