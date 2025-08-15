import random

class CaptchaGenerator:
    def __init__(self, length=4):
        self.length = length

    def generate_captcha(self):
        """生成指定长度的验证码"""
        captcha = ""
        for _ in range(self.length):
            captcha += str(random.randint(0, 9))
        return captcha

    def validate(self):
        a = input("请输入验证码")
        print(a)
        pass
# 使用示例
captcha_generator = CaptchaGenerator()
print(captcha_generator.generate_captcha())
# print(captcha_generator.generate_captcha())
# print(captcha_generator.generate_captcha())

captcha_generator.validate()
#qX80
#tA2w