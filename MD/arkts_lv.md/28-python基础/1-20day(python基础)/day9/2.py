#变量作用域
#在全局作用中声明的变量可以作用于全局和函数中
b = 10
def xx():
    a = 100
    print(a)
    #引入全局的b
    global b
    #把全局中的b修改成200
    b = 200
    print(b)

xx()

print(b)
