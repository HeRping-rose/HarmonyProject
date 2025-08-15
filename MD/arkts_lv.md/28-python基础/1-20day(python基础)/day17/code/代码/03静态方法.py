class Peron:
    def __init__(self):
        self.name = "小明"

    def showname(self):
        print(self.name)

    @staticmethod
    def sum(a,b):
        print(a+b)

p = Peron()
Peron.sum(1,2)
p.sum(3,4)

a = {"aa":lambda x:x+1}
print(a['aa'](1))

b = [lambda x:x+2]
print(b[0](2))

c = lambda x:x+3
print(c(4))