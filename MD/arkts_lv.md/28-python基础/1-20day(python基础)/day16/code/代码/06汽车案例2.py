class CarFacory:
    def __init__(self,price=500000,model='s级'):
        self.brand = "奔驰"
        self.price = price
        self.model = model
        self.color = []
        self.width = 5
        self.height = 1.2

    def start(self):
        print("启动")
    def go(self):
        print("加速")
    def stop(self):
        print("减速")

#子类
class Jiaoche(CarFacory):
    def __init__(self,price,model):
        #拿到所有父类的属性和方法
        super(Jiaoche, self).__init__(price,model)
        # self.price = price
        # self.model = model

cji = Jiaoche(300000,'c级')
eji = Jiaoche(400000,'e级')
print(eji.price)
print(cji.price)