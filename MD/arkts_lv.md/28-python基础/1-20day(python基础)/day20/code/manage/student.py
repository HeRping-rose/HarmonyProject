# 学员信息包含：姓名、性别、手机号；
# 添加__str__魔法方法，方便查看学员对象信息
class Student:
    def __init__(self,name,gender,phone):
        self.name = name
        self.gender = gender
        self.phone = phone
    def __str__(self):
        return f"该学生是:{self.name},性别是:{self.gender},电话是:{self.phone}"


# s = Student("小明","男",123123123)
# print(s.__dict__)
# def sum(a,b):
#     print(a+b)
#
# print(eval("[1,2,3,4]"))
