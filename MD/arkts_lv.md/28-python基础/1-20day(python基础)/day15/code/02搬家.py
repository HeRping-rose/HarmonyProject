class jiaju:
    def __init__(self,name,tiji):
        self.name = name
        self.tiji = tiji

guizi = jiaju("柜子",40)
yizhi = jiaju("椅子",10)

class fangzi:
    def __init__(self,address,tiji):
        self.address = address
        self.tiji = tiji
        self.shengyu = tiji
        self.liebiao = []

    def fangjiaju(self,target):

        self.liebiao.append(target.name)

    def __str__(self):
        return f'房子在{self.address},有{self.liebiao}等家具'

house = fangzi("银座1001",100)
house.fangjiaju(guizi)
house.fangjiaju(yizhi)
print(house)