1、SyntaxError：语法错误

　　当Python解释器发现程序中有语法错误时，会抛出SyntaxError异常。例如：

　　pirnt 'hello world'

　　在Python3.X版本中，print应该加括号，正确的写法是：

　　print('hello world')

　　如果写成print'hello world'，运行程序时就会抛出SyntaxError异常。

　　2、NameError：变量名错误

　　当Python遇到未定义的变量时，会抛出NameError异常。例如：

　　a = 1

　　print(b)

　　由于变量b未被定义，所以会抛出NameError异常。

　　3、TypeError：类型错误

　　当尝试使用不支持的操作类型时，会抛出TypeError异常。例如：

　　a = 'hello'

　　b = 5

　　print(a + b)

　　由于字符串和整数不能直接相加，所以会抛出TypeError异常。

　　4、ZeroDivisionError：除数为零错误

　　当尝试除以零时，会抛出ZeroDivisionError异常。例如：

　　a = 5/0

　　由于除以零是非法的操作，所以会抛出ZeroDivisionError异常。

　　5、indexError：索引错误

　　当尝试访问列表或元组中不存在的元素时，会抛出indexError异常。例如：

　　a = [1,2,3,]

　　print(a[3])

　　由于a中只有三个元素，访问索引3将会抛出indexError异常。

　　6、KeyError：字典键错误

　　当尝试访问字典中不存在的键时，会抛出KeyError异常。例如：

　　a = {'name':'Tom','age':20}

　　print(a[''gender])

　　由于a中不存在键'gender'，所以会抛出KeyError异常。

　　7、ValueError：值错误

　　当函数参数类型正确但是参数值错误时，会抛出ValueError异常。例如：

　　a = int('abc')

　　由于'abc'不能被转换为整数类型，所以会抛出ValueError异常。