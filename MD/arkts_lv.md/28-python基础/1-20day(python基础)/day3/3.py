user = []
while True:
    options = int(input("1.登录 2.注册 3.退出"))
    if options == 1:
        username = input("输入用户名:")
        pwd = input("输入密码:")
        for i in user:
            if i[0] == username and i[1] == pwd:
                print("登录成功")
                break
        else:
            #如果循环完整结束了，会走else, 循环没有完整结束时不会触发else
            print("用户名或密码错误")
    elif options == 2:
        username = input("输入用户名:")
        pwd = input("输入密码:")
        user.append([username,pwd])
        print("注册成功")
    else:
        print("退出")
        break