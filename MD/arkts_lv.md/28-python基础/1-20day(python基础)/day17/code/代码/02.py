class Dog(object):
    tooth = 10
    def __init__(self):
        pass
    def fn(self):
        print(self.tooth)

wangcai = Dog()
xiaohei = Dog()

# xiaohei.tooth = 99
Dog.tooth = 99
print(Dog.tooth)  # 10
print(wangcai.tooth)  # 10
print(xiaohei.tooth)  # 10
wangcai.fn()