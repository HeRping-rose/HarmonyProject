class Potato:
    def __init__(self):
        self.time = 0
        self.state = "生的"
        self.tiaoliao = []
    def cook(self,time):
        self.time+=time
        if 0<=self.time<2:
            self.state = "生的"
        elif 2<=self.time<10:
            self.state="半生不熟"
        elif 10<=self.time<15:
            self.state="熟了"
        elif self.time>=15:
            self.state = "糊了"
    def __str__(self):
        return f'土豆被烤{self.state}'
tudou = Potato()
tudou.cook(2)
tudou.cook(8)
print(tudou)
