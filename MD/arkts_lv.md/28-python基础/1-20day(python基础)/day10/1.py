info = []
def print_info():
    print('-' * 20)
    print('欢迎登录学员管理系统')
    print('1: 添加学员')
    print('2: 删除学员')
    print('3: 修改学员信息')
    print('4: 查询学员信息')
    print('5: 显示所有学员信息')
    print('6: 退出系统')
    print('-' * 20)
while True:
    # 1. 显示功能界面
    print_info()
    # 2. 用户选择功能
    user_num = input('请选择您需要的功能序号：')
    # 3. 根据用户选择，执行不同的功能
    if user_num == '1':
        add_info()
    elif user_num == '2':
        print('删除学员')
    elif user_num == '3':
        print('修改学员信息')
    elif user_num == '4':
        print('查询学员信息')
    elif user_num == '5':
        print('显示所有学员信息')
    elif user_num == '6':
        print('退出系统')
    else:
        print('输入错误，请重新输入!!!')
