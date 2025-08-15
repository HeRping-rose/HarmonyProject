#书店管理系统

#管理员类
class Admin:
    #属性： 管理员列表/字典 []  例： [{admin:"张三",pwd:124,state:0},{admin:"李四",pwd:435,state:1}]
                        # {"张三":{'pwd':123,'state':0}}
    #方法
    #注册
    def reg(self):
        #输入用户名
        #输入密码
        #加入到管理员列表
        pass
    #登录
    def login(self):
        #输入用户名和密码
        #循环与管理员列表中的管理员做匹配，如果有匹配到的，登录成功，（登录状态修改）

    #退出
    def logout(self):
        #输入用户名
        #登录状态修改为0


#图书类
class Book:
    #属性： 名字、作者、价格
    #打印信息

#书店类
class BookShop:
    #属性：图书列表

    #方法
    #添加图书
    def addBook(self):
        pass
    #修改
    def updateBook(self):
        pass
    #删除
    def delBook(self):
        pass

    #打印书店信息
