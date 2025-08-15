# 1. 师父类
class Master(object):
    def __init__(self):
        self.kongfu = '[古法煎饼果子配方]'

    def make_cake(self):
        print(f'运用{self.kongfu}制作煎饼果子')


# 2. 徒弟类
class Prentice(Master):
    pass

tudi = Prentice()
print(tudi.kongfu)
tudi.make_cake()