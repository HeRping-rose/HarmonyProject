class Master:
    def __init__(self):
        self.kongfu = '[古法煎饼果子配方]'
        self.__bufen = "留一手"

    def __make_cake(self):
        print(f'运用{self.kongfu}制作煎饼果子')

class Prentice(Master):
    def __init__(self):
        #在子类中super就代表了父类
        #__init__()把父类的 init方法执行了
        # 就是把父类中所有的属性和方法都导入到子类中来
        super(Prentice, self).__init__()
        self.name = "小明"
        #重写父类上的属性
        self.kongfu = '[自创法煎饼果子配方]'
tudi = Prentice()
tudi.make_cake()
print(tudi.kongfu)