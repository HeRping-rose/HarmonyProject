class Goods:
    def __init__(self,name,price,store):
        self.name = name
        self.price = price
        self.store = store
    def __str__(self):
        return f'这是{self.name},价格是{self.price}元,当前库存有{self.store}件'

apple = Goods("苹果",10,40)
cookie = Goods("饼干",5,10)

class Shopcar:
    def __init__(self):
        #{"苹果":{count:1,subtotal:xxx}}
        self.goodslist = {}
    #加入商品到购入车
    def addCar(self,target,count):
        if target.name in self.goodslist:
            self.goodslist[target.name]["数量"] += count
        else:
            self.goodslist[target.name] = {"数量": count}

       #删除商品
    def delgoods(self,target,count):
        if target.name in self.goodslist:
            if self.goodslist[target.name]["数量"] >= count:
                self.goodslist[target.name]["数量"] -= count
                if self.goodslist[target.name]["数量"]==0:
                    del self.goodslist[target.name]
            else:
                print("删除太多了")
        else:
            print(f"购物车没有{target.name}")
    def __str__(self):
        return f"{self.goodslist}"

mycar = Shopcar()
mycar.addCar(apple,5)
mycar.addCar(apple,15)

mycar.delgoods(apple,20)
print(mycar)
print(apple)
