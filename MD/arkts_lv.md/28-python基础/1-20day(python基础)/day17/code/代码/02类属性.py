class bank:
    #所有的实例对象都共用的（）
    # lixi = 0.05
    #如果还不希望对象去修改它
    __lixi = 0.05
    kaika = 5

    @classmethod
    def xiugai(cls,lixi):
        cls.__lixi = lixi
    @classmethod
    def show(cls):
        print(cls.__lixi)

mycart = bank()
print(bank.kaika)
print(mycart.kaika)

#修改 kaika属性
bank.kaika = 10
#mycart.kaika = 100 #实例对象去修改 类属性，是不可以的，该语法实际是在给对象添加一个新的属性叫 kaika
print(bank.kaika)
print(mycart.kaika)

bank.xiugai(0.5)
bank.show()

