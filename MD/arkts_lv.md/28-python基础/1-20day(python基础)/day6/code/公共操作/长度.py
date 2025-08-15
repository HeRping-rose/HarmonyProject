# 1. 字符串
str1 = 'abcdefg'
print(len(str1))


# 2. 列表
list1 = [10, 20, 30, 40]
print(len(list1))

# 3. 元组
t1 = (10, 20, 30, 40, 50)
print(len(t1))  # 5

# 4. 集合
s1 = {10, 20, 30}
print(len(s1))  # 3

# 5. 字典
dict1 = {'name': 'Rose', 'age': 18,'sex':'nan'}
print(len(dict1))  # 2



# 封装ATM机功能选项 -- 定义函数
def select_func():
    print('--请选择功能---')
    print('查询余额')
    print('存款')
    print('取款')
    print('----选择功能---')
# 密码正确登录成功
print('密码正确登录成功')
# 打印功能界面
select_func()
# 查询余额完毕
print('查询余额完毕')
# 取钱
print('取了200块')
# 打印功能界面
select_func()
# 退出
print('退出')
