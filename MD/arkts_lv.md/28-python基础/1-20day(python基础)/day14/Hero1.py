#英雄联盟
#英雄角色：
zhuangbei = [
    {'name':"无尽",'power':80,'magic':0,'money':1},
    {'name': "帽子", 'power': 0, 'magic': 120, 'money': 1}
]
class Hero:
    def __init__(self,name,blood):
        self.name = name
        self.blood = blood
        self.level = 1
        self.exp = 0
        self.money = 300
        self.qskill = 0
        self.power = 50
        self.magic = 50

    def A(self,target):
        target.blood -= self.power
        if target.blood>0:
            print(f"{self.name}平A了小兵,小兵剩余血量：{target.blood}")
        else:
            self.exp+=target.exp
            self.money = target.money
            del target
            print(f"{self.name}用平A了消灭小兵")
            self.levelUp()
    def levelUp(self):
        if self.exp%100==0 and self.exp!=0:
            self.level += 1
            self.blood *= 1.1
            self.power *= 1.2
            print(f"{self.name}升级了")
            self.getskill()
    def getskill(self):
        options = input("输入要升级的技能：q w e r")
        if options == "q":
            self.qskill+=1
            print(f"{self.name}升级了Q技能")
        elif options == "w":
            self.wskill += 1
    def Q(self,target):
        if self.qskill:
            target.blood -= self.power+(self.qskill*20)
            print(f"{self.name}使用了Q技能,小兵剩余血量：{target.blood}")
        else:
            print(f"{self.name}未升级Q技能")

    def P(self):
        print("购买装备-----------")
        for index,i in enumerate(zhuangbei):
            print(f"{index+1}.{i['name']}")
        inp = int(input("输入装备：1 2"))
        self.power+=zhuangbei[inp-1]["power"]


