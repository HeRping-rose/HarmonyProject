#可以做一个汪汪队
# 当莱德 调用出发时， 传入小厉 ，结果会开挖掘器。 传入天天，结果会开飞机

class Dog(object):
    def work(self):  # 父类提供统一的方法，哪怕是空方法
        print('指哪打哪...')


class ArmyDog(Dog):  # 继承Dog类
    def work(self):  # 子类重写父类同名方法
        print('追击敌人...')


class DrugDog(Dog):
    def work(self):
        print('追查毒品...')


class Person(object):
    def work_with_dog(self, dog):  # 传入不同的对象，执行不同的代码，即不同的work函数
        dog.work()


ad = ArmyDog()
dd = DrugDog()

daqiu = Person()
daqiu.work_with_dog(ad)
daqiu.work_with_dog(dd)