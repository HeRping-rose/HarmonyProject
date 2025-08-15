class Person:
    def __init__(self,name):
        self.name = name

    def jihe(self,all_dog):
        for dog in all_dog:
            dog.dog_jihe()
    def work(self,dog,mission):
        dog.dog_work(mission)

class Dog:
    def __init__(self):
        name = ""
    def dog_jihe(self):
        pass
    def dog_work(self):
        pass

class gongchenggou(Dog):
    def __init__(self):
        super(gongchenggou, self).__init__()
        self.name = "小厉"

    def dog_jihe(self):
        print(f'莱德需要{self.name}')
    def dog_work(self,mission):
        print(f"{self.name}往前冲")
        print(f'{self.name}需要去：{mission}')


class feitiangou(Dog):
    def __init__(self):
        super(feitiangou, self).__init__()
        self.name = "天天"

    def dog_jihe(self):
        print(f'莱德需要{self.name}')

    def dog_work(self, mission):
        print(f"狗狗要飞上天了")
        print(f'{self.name}需要去：{mission}')

xiaoli = gongchenggou()
tiantian = feitiangou()

#莱德指挥
laide = Person("莱德")
laide.jihe([xiaoli,tiantian])

laide.work(tiantian,"查看情况")

laide.work(xiaoli,"移开障碍物")