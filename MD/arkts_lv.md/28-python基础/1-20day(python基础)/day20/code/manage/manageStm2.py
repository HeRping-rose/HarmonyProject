from student import Student
class Manage:
    def __init__(self):
        self.studentList = []

    def run(self):
        while True:
            self.tishi()
            myinput = int(input("请选择:"))
            if myinput == 1:
                self.addStudent()
            elif myinput == 2:
                self.delStudent()
            elif myinput == 3:
                self.updateStudent()
            elif myinput == 4:
                self.selectStudent()
            elif myinput == 5:
                self.showStudent()
            elif myinput==6:
                self.saveStudent()
            elif myinput==7:
                print("系统退出")
                break
            else:
                print("输入错误")
    @staticmethod
    def tishi():
        print("请选择如下功能：")
        print("1:添加学员")
        print("2:删除学员")
        print("3:修改学员信息")
        print("4:查询学员信息")
        print("5:显示所有学员信息")
        print("6:保存学员信息")
        print("7:退出系统")

    def addStudent(self):
        name = input("输入姓名:")
        gender = input("输入性别:")
        phone = input("输入电话:")

        student = Student(name,gender,phone)
        self.studentList.append(student)

        # print(self.studentList)

    def delStudent(self):
        name = input("输入要删除的学生姓名:")
        for student in self.studentList:
            if name == student.name:
                self.studentList.remove(student)
                break
        print(self.studentList)
    def updateStudent(self):
        name = input("输入姓名:")
        phone = input("输入要修改的电话:")
        for student in self.studentList:
            if name == student.name:
                student.phone = phone
                break
    def selectStudent(self):
        name = input("输入姓名:")
        for student in self.studentList:
            if name == student.name:
                print(f"该学生是:{student.name},性别是:{student.gender},电话是:{student.phone}")
                break

m = Manage()
m.run()