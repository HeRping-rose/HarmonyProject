class Animal:
    #记录所有实例的个数
    __count = 0
    def __init__(self):
        name = ""
        # Animal.__count+=1
        type(self).__count+=1

    @classmethod
    def showCount(cls):
        print(cls.__count)

    @staticmethod
    def showTime():
        print("所有动物的开饭时间是：xx:xx:xxx")

class Dog(Animal):
    def __init__(self):
        super(Dog, self).__init__()
        name = ""

class Cat(Animal):
    def __init__(self):
        super(Cat, self).__init__()
        name = ""

gou = Dog()
mao = Cat()
Animal.showCount()
Animal.showTime()