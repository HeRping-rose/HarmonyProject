#张三
#定义一个工具模块
def sum(a,b):
    return a+b

def zero(num):
    return "0"+str(num) if num<10 else str(num)

__all__ = ['zero']

#如果要测试功能的代码，写在以下的条件中
#在导出时，不会导出以下代码
if __name__ == "__main__":
    print(sum(1,24353))
