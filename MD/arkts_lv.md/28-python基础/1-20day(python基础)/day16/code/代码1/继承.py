class Master:
    def __init__(self):
        self.kongfu = '[古法煎饼果子配方]'
    def make_cake(self):
        print(f'运用{self.kongfu}制作煎饼果子')

class School:
    def __init__(self):
        self.kongfu = '[学校煎饼果子配方]'
    def make_cake(self):
        print(f'运用{self.kongfu}制作煎饼果子')

class Prentice(School,Master):
    def __init__(self):
        self.kongfu = '[独创煎饼果子配方]'
    def make_cake(self):
        print(f'运用{self.kongfu}制作煎饼果子')
    #同名会覆盖，如果还要用父类的方法
    def make_master_cake(self):
        # Master.__init__(self)
        # Master.make_cake(self)
        super().__init__()
        super().make_cake()
class sun(Prentice):
    pass


tudi = Prentice()
# tudi.make_master_cake()
# print(tudi.kongfu)
# tudi.make_cake()
# print(Prentice.__mro__)
s = sun()
s.make_cake()
s.make_master_cake()
