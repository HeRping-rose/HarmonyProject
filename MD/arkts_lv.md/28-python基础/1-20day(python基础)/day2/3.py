# age = int(input("输入年龄:"))
# height = int(input("输入身高:"))
# money = int(input("输入存款:"))

# if 18<=age<=26:
#     print("满意")
# else:
#     print("不满意")

# if 18<=age<=26 and 172<=height<190:
#     print("满意")
# else:
#     print("不满意")

# if 172<=height<190 and (18<=age<26 or money>100000):
#     print("满意")
# else:
#     print("不满意")

# num = int(input("一个数:"))
# 条件表达式： 可以放任何的东西，它都会默认帮我们把条件转成布尔值，布尔值为真，条件成立  假：0 "" null
# if num%2:
#     print("奇数")
# else:
#     print("偶数")

#任何整数都可以被1整除
# if num%1:
#     print("不是整数")
# else:
#     print("是整数")

#三元运算符   条件成立返回值  if 条件表达式 else 条件不成立返回值
# result = "奇数" if num%2 else "偶数"
# print(f"这回你得到了一个：{result}")

#
money = 100.00
options = int(input("1.查询余额 2.存款 3.取款 4.退出"))
if options == 1:
    print(f"你的余额：{money}")
elif options == 2:
    inset = int(input("请输入你要存入的金额："))
    money+=inset
    print(f"你的余额：{money}")
elif options == 3:
    inset = int(input("请输入你要取出的金额："))
    if inset>money:
        print("余额不足")
    else:
        money-=inset
        print(f"你的余额：{money}")
else:
    print("退出")
























