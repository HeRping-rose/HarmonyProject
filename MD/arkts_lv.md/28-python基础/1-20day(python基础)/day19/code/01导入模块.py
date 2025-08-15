#导入（python自带的）模块
#如果在这个模块中，有很多有方法，我们都有可能使用，那么我们就导入整个模块
# import random
# print(random.randint(0,5))
# print(random.random())

#找到random模块，只导入它提供的randint方法
# from random import randint,random
# #在使用时，直接使用方法名
# print(randint(1,2))
# print(random())

# import math
# print(math.sqrt(25))
# print(math.ceil(1.6))
# print(int(1.6))

# * 代表匹配任意（所有）的方法 (导入所有的方法)
# 不建议使用这样方式，非常消耗内存
from math import *
print(sqrt(4))