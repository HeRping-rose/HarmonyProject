# 1. 师父类
class Master(object):
    def __init__(self):
        self.kongfu = '[古法煎饼果子配方]'

    def make_cake(self):
        print(f'运用{self.kongfu}制作煎饼果子')

class School(object):
    def __init__(self):
        self.kongfu = '[学校法煎饼果子配方]'

    def make_cake(self):
        print(f'运用{self.kongfu}制作煎饼果子')

# 2. 徒弟类
class Prentice(School,Master):
    def __init__(self):
        self.kongfu = '[自创煎饼果子配方]'

    def make_cake(self):
        print(f'运用{self.kongfu}制作煎饼果子')

    def master_make_cake(self):
        Master.__init__(self)
        Master.make_cake(self)


tudi = Prentice()
print(tudi.kongfu)
tudi.make_cake()
tudi.master_make_cake()