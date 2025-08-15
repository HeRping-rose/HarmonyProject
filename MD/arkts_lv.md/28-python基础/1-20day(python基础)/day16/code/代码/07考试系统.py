class Tiku:
    def __init__(self,prompt,options,answer,score=2,type="单选"):
        self.prompt = prompt
        self.options=options
        self.answer = answer
        self.score = score
        self.type = type

    def duti(self):
        print(f'({self.type}){self.prompt}')

    def zuoda(self):
        myanswer = input("请作答：")
        if myanswer.lower() == str(self.answer).lower():
            print(f"回答正确!，加{self.score}分")
        else:
            print(f"回答错误,正确答案是：{self.answer}")

class Danxuan(Tiku):
    def __init__(self,prompt,options,answer):
        super(Danxuan, self).__init__(prompt,options,answer)

    def duti(self):
        print(f'({self.type}){self.prompt}')
        for index,item in enumerate(self.options):
            print(f'{index+1}.{item}')

    def zuoda(self):
        myanswer = int(input("请作答："))-1
        if myanswer == self.answer:
            print(f"回答正确!，加{self.score}分")
        else:
            print(f"回答错误,正确答案是：{self.options[self.answer]}")

class Duoxuan(Tiku):
    def __init__(self,prompt,options,answer):
        super(Duoxuan, self).__init__(prompt,options,answer)
    def duti(self):
        print(f'({self.type}){self.prompt}')
        for index,item in enumerate(self.options):
            print(f'{index+1}.{item}')
    def zuoda(self):
        myanswer = input("请作答：")
        myanswer = "".join(sorted(myanswer))
        answer = "".join(str(num+1) for num in self.answer)
        if myanswer == answer:
            print(f"回答正确!，加{self.score}分")
        else:
            print(f"回答错误,正确答案是：{','.join(self.options[index] for index in self.answer)}")


class Tiankong(Tiku):
    def __init__(self,prompt,answer):
        super(Tiankong, self).__init__(prompt,[],answer)

class Panduan(Tiku):
    def __init__(self,prompt,answer):
        super(Panduan, self).__init__(prompt,[],answer)

panduan1 = Panduan("地球是围绕太阳旋转的。",True)
panduan1.duti()
panduan1.zuoda()

# duoxuan1 = Duoxuan("以下哪些国家是欧洲的国家？",["法国", "德国", "意大利", "中国"],[0,1,2])
# duoxuan1.duti()
# duoxuan1.zuoda()
# danxuan1 = Danxuan("以下哪个国家不是欧洲的国家？",["法国", "德国", "意大利", "中国"],3)
# danxuan1.duti()
# danxuan1.zuoda()