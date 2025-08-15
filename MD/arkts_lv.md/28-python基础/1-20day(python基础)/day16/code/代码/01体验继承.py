class fu:
    def __init__(self):
        self.money = 10000

    def kongfu(self):
        print("太极")


class zi(fu):
    pass

zhangsan = zi()
print(zhangsan.money)
zhangsan.kongfu()