import math
import random


class YZM:
    def __init__(self,len):
        self.len = len

    def generate(self):
        txt = "1234567890qwertyiopafghjklxcvbmQWERTYUIOOPASDFGHJKLZXCVBNM"
        code = ""
        for i in range(self.len):
            index = random.randint(0,len(txt)-1)
            code += txt[index]
        return code

    def validate(self):
        code = self.generate()
        print(code)
        mycode = input("清输入验证码")
        if code.lower() == mycode.lower():
            print("通过")
        else:
            print("不通过")
yzm = YZM(4)
yzm.validate()