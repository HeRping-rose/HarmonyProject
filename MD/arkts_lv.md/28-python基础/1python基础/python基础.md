# python基础

## 1.语法基础

~~~py
#1.基础操作
age = 20  		# 声明一个变量age 用来存储一个数字 20
1+1		        # 基础数学加法
print('Hello World!')   # 打印Hello World!
~~~

~~~py
#2.条件判断if
if 1 == 2: # 如果 if 跟随的条件为 假 那么不执行属于if 的语句,然后寻找 else
    print("假的")
else: # 寻找到 else 之后 执行属于else中的语句
    print("1==2是假的")
~~~

~~~py
#3.循环操作---for
for i in range(5):
    print(i)
~~~

~~~py
#3.循环操作---while
sum = 0
n = 99
while n > 0:
    sum = sum + n
    n = n - 1
print(sum)
~~~

~~~py
#4.break、continue、pass
#break语句可以跳出 for 和 while 的循环体
n = 1
while n <= 100:
    if n > 10:
        break
    print(n)
    n += 1
~~~

~~~js
#continue语句跳过当前循环，直接进行下一轮循环
n = 1
while n < 10:
    n = n + 1
    if n % 2 == 0:
        continue
    print(n)
~~~

~~~js
#pass是空语句，一般用做占位语句，不做任何事情
 for letter in 'Room':
    if letter == 'o':
        pass
        print('pass')
    print(letter)
~~~

~~~py
#5.数据类型---Number(数字)
#Python支持int, float, complex三种不同的数字类型
a = 3
b = 3.14
c = 3 + 4j
print(type(a), type(b), type(c))
~~~

~~~py
#5.数据类型---String（字符串）
#支持字符串拼接、截取等多种运算
a = "Hello"
b = "Python"
print("a + b 输出结果：", a + b)
#print("a[1:4] 输出结果：", a[1:4])
~~~

~~~py
#5.数据类型---List（列表）
#列表是写在方括号 [] 之间、用逗号分隔开的元素列表。
#列表索引值以 0 为开始值，-1 为从末尾的开始位置。
list = ['abcd', 786 , 2.23, 'runoob', 70.2]
print(list[1:3])

#tinylist = [123, 'runoob']
#print(list + tinylist)
~~~

~~~py
#5.数据类型---Tuple（元组）
#tuple与list类似，不同之处在于tuple的元素不能修改。tuple写在小括号里，元素之间用逗号隔开。
#元组的元素不可变，但可以包含可变对象，如list。
t1 = ('abcd', 786 , 2.23, 'runoob', 70.2)
t2 = (1, )
t3 = ('a', 'b', ['A', 'B'])
t3[2][0] = 'X'
print(t3)
~~~

~~~py
#5.数据类型---dict（字典）
#字典是无序的对象集合，使用键-值（key-value）存储，具有极快的查找速度。
#键(key)必须使用不可变类型。
#同一个字典中，键(key)必须是唯一的。
d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
print(d['Michael'])
~~~

~~~py
#5.数据类型---set（集合）
#set和dict类似，也是一组key的集合，但不存储value。由于key不能重复，所以，在set中，没有重复的key。
#set是无序的，重复元素在set中自动被过滤。
s = set([1, 1, 2, 2, 3, 3])
print(s)
~~~



## Python数据结构

数字、字符串、列表、元祖、字典

### 数字

Python Number 数据类型用于存储数值。

Python Number 数据类型用于存储数值，包括整型、长整型、浮点型、复数。

**（1）Python math 模块**：Python 中数学运算常用的函数基本都在 math 模块

~~~py
import math

print(math.ceil(4.1))   #返回数字的上入整数

print(math.floor(4.9))  #返回数字的下舍整数

print(math.fabs(-10))   #返回数字的绝对值

print(math.sqrt(9))     #返回数字的平方根

print(math.exp(1))      #返回e的x次幂
~~~

**（2）Python随机数**

首先import random，使用random()方法即可随机生成一个[0,1)范围内的实数

~~~py
import random
ran = random.random()
print(ran)
~~~

调用 random.random() 生成随机数时，每一次生成的数都是随机的。但是，当预先使用 random.seed(x) 设定好种子之后，其中的 x 可以是任意数字，此时使用 random() 生成的随机数将会是同一个。

~~~py
print ("------- 设置种子 seed -------")
random.seed(10)
print ("Random number with seed 10 : ", random.random())

# 生成同一个随机数
random.seed(10)
print ("Random number with seed 10 : ", random.random())
------- 设置种子 seed -------
Random number with seed 10 :  0.5714025946899135
Random number with seed 10 :  0.5714025946899135
~~~

randint()生成一个随机整数

~~~py
ran = random.randint(1,20)
print(ran)
~~~



### 字符串

字符串连接：+

~~~py
a = "Hello "
b = "World "
print(a + b) #Hello World 
~~~

重复输出字符串：*

~~~py
print(a * 3)
#Hello Hello Hello 
~~~

通过索引获取字符串中字符[]

~~~py
print(a[0])  #h
~~~

字符串截取[:] 牢记：左闭右开

~~~py
print(a[1:4])  #ell
~~~

判断字符串中是否包含给定的字符: in, not in

~~~py
print('e' in a)
print('e' not in a)
#True
#False
~~~

join():以字符作为分隔符，将字符串中所有的元素合并为一个新的字符串

~~~py
new_str = '-'.join('Hello')
print(new_str)
#H-e-l-l-o
~~~

三引号让程序员从引号和特殊字符串的泥潭里面解脱出来，自始至终保持一小块字符串的格式是所谓的WYSIWYG（**所见即所得**）格式的。

~~~py
print('''I'm going to the movies''')

html = '''
<HTML><HEAD><TITLE>
Friends CGI Demo</TITLE></HEAD>
<BODY><H3>ERROR</H3>
<B>%s</B><P>
<FORM><INPUT TYPE=button VALUE=Back
ONCLICK="window.history.back()"></FORM>
</BODY></HTML>
'''
print(html)
~~~



### 列表

作用：类似其他语言中的数组

声明一个列表，并通过下标或索引获取元素

~~~py
#声明一个列表
names = ['jack','tom','tonney','superman','jay']

#通过下标或索引获取元素
print(names[0])
print(names[1])
jack
tom
#获取最后一个元素
print(names[-1])
print(names[len(names)-1])
jay
jay

#获取第一个元素
print(names[-5])
jack

#遍历列表，获取元素
for name in names:
    print(name)
jack
tom
tonney
superman
jay

#查询names里面有没有superman
for name in names:
    if name == 'superman':
        print('有超人')
        break
else:
    print('有超人')
#有超人

#更简单的方法,来查询names里有没有superman
if 'superman' in names:
    print('有超人')
else:
    print('有超人')
~~~

列表元素添加

~~~py
#声明一个空列表
girls = []

#append(),末尾追加
girls.append('杨超越')
print(girls)
['杨超越']


#extend(),一次添加多个。把一个列表添加到另一个列表 ，列表合并。
models = ['刘雯','奚梦瑶']
girls.extend(models)
#girls = girls + models
print(girls)
['杨超越', '刘雯', '奚梦瑶']

#insert():指定位置添加
girls.insert(1,'虞书欣')
print(girls)
['杨超越', '虞书欣', '刘雯', '奚梦瑶']
~~~

列表元素修改,通过下标找到元素，然后用=赋值

~~~py
fruits = ['apple','pear','香蕉','pineapple','草莓']
print(fruits)

fruits[-1] = 'strawberry'
print(fruits)
['apple', 'pear', '香蕉', 'pineapple', '草莓']
['apple', 'pear', '香蕉', 'pineapple', 'strawberry']


'''
将fruits列表中的‘香蕉’替换为‘banana’
'''
#这样不行
for fruit in fruits:
    if '香蕉' in fruit:
        fruit = 'banana'
print(fruits)

for i in range(len(fruits)):
    if '香蕉' in fruits[i]:
        fruits[i] = 'banana'
        break
print(fruits)
['apple', 'pear', '香蕉', 'pineapple', 'strawberry']
['apple', 'pear', 'banana', 'pineapple', 'strawberry']
~~~

列表元素删除

~~~py
words = ['cat','hello','pen','pencil','ruler']
del words[1]
print(words)
['cat', 'pen', 'pencil', 'ruler']

words = ['cat','hello','pen','pencil','ruler']
words.remove('cat')
print(words)
['hello', 'pen', 'pencil', 'ruler']

words = ['cat','hello','pen','pencil','ruler']
words.pop(1)
print(words)
['cat', 'pen', 'pencil', 'ruler']
~~~

列表切片

- 在Python中处理列表的部分元素，称之为切片。
- 创建切片，可指定要使用的第一个元素和最后一个元素的索引。注意：左闭右开
- 将截取的结果再次存放在一个列表中，所以还是返回列表

~~~py
animals = ['cat','dog','tiger','snake','mouse','bird']

print(animals[2:5])
print(animals[-1:])
print(animals[-3:-1])
print(animals[-5:-1:2])
print(animals[::2])

['tiger', 'snake', 'mouse']
['bird']
['snake', 'mouse']
['dog', 'snake']
['cat', 'tiger', 'mouse']
~~~

列表排序

~~~py
'''
生成10个不同的随机整数，并存至列表中
'''
import  random

random_list = []
for i in range(10):
    ran = random.randint(1,20)
    if ran not in  random_list:
        random_list.append(ran)
print(random_list)
[16, 19, 1, 7, 15, 9, 6, 2, 17]

上述代码存在什么问题吗？

import  random

random_list = []
i = 0
while i < 10:
    ran = random.randint(1,20)
    if ran not in  random_list:
        random_list.append(ran)
        i+=1
print(random_list)
[16, 11, 3, 8, 12, 2, 14, 5, 20, 13]

#默认升序
new_list = sorted(random_list)
print(new_list)

#降序
new_list = sorted(random_list,reverse =True)
print(new_list)
[2, 3, 5, 8, 11, 12, 13, 14, 16, 20]
[20, 16, 14, 13, 12, 11, 8, 5, 3, 2]
~~~



### 元组

与列表类似，元祖中的内容不可修改

~~~py
tuple1 = ()
print(type(tuple1))
<class 'tuple'>

tuple2 = ('hello')
print(type(tuple2))
<class 'str'>

注意：元组中只有一个元素时，需要在后面加逗号！

tuple3 = ('hello',)
print(type(tuple3))
<class 'tuple'>

元组不能修改，所以不存在往元组里加入元素。
那作为容器的元组，如何存放元素？

import random
random_list = []
for i in range(10):
    ran = random.randint(1,20)
    random_list.append(ran)
print(random_list)

random_tuple = tuple(random_list)
print(random_tuple)

元组访问
print(random_tuple)
print(random_tuple[0])
print(random_tuple[-1])
print(random_tuple[1:-3])
print(random_tuple[::-1])
(14, 10, 9, 15, 6, 10, 12, 5, 15, 8)
14
8
(10, 9, 15, 6, 10, 12)
(8, 15, 5, 12, 10, 6, 15, 9, 10, 14)

元组的修改：
t1 = (1,2,3)+(4,5)
print(t1)
(1, 2, 3, 4, 5)

t2 = (1,2) * 2
print(t2)
(1, 2, 1, 2)

print(max(random_tuple))
print(min(random_tuple))
print(sum(random_tuple))
print(len(random_tuple))
15
5
104
10
print(random_tuple.count())  #统计元组的个数
#统计元组中4的个数
print(random_tuple.count(4)) #0

#元组中4所对应的下标，如果不存在，则会报错
print(random_tuple.index(4))

#判断元组中是否存在1这个元素
print(4 in random_tuple)

#返回元组中4所对应的下标,不会报错
if(4 in random_tuple):
    print(random_tuple.index(4))
    
元组的拆包与装包
#定义一个元组
t3 = (1,2,3)

#将元组赋值给变量a,b,c
a,b,c = t3

#打印a,b,c
print(a,b,c)

#当元组中元素个数与变量个数不一致时

#定义一个元组，包含5个元素
t4 = (1,2,3,4,5)
#将t4[0],t4[1]分别赋值给a,b;其余的元素装包后赋值给c
a,b,*c = t4

print(a,b,c)
print(c)
print(*c)
~~~



### 字典

~~~py
#定义一个空字典

dict1 = {}

dict2 = {'name':'杨超越','weight':45,'age':25}
print(dict2['name'])

#list可以转成字典，但前提是列表中元素都要成对出现
dict3 = dict([('name','杨超越'),('weight',45)])
print(dict3)

dict4 = {}
dict4['name'] = '虞书欣'
dict4['weight'] = 43
print(dict4)

dict4['weight'] = 44
print(dict4)

#字典里的函数 
#items()   dict_items([('杨超越', 165), ('虞书欣', 166), ('上官喜爱', 164)])
#keys()
# values()
dict5 = {'杨超越':165,'虞书欣':166,'上官喜爱':164}
print(dict5.items())
for key,value in dict5.items():
    if value > 165:
        print(key)
        
        
#values() 取出字典中所有的值,保存到列表中
results = dict5.values()
print(results)

#求小姐姐的平均身高
heights = dict5.values()
print(heights)
total = sum(heights)
avg = total/len(heights)
print(avg)

#print(dict5['赵小棠'])       

print(dict5.get('赵小棠'))
print(dict5.get('赵小棠',170)) #如果能够取到值，则返回字典中的值，否则返回默认值170

dict6 = {'杨超越':165,'虞书欣':166,'上官喜爱':164}
del dict6['杨超越']
print(dict6)

result = dict6.pop('虞书欣')
print(result)
print(dict6)

~~~

## Python面向对象

~~~py
class Animal:
    # 构造函数 self ~ this
    def __init__(self,name):
        self.name = name 
    def eat(self):
        print(self.name+"要吃东西")
    def drink(self):
        print(self.name+"要喝水")

cat = Animal('小苗')
print(cat.name)
cat.eat()
cat.drink()

class Dog(Animal):
    def __init__(self,name):
        Animal.__init__(self,name)
        self.cate = "狗"
    def jump(self):
        print(self.name+"跳")
    def eat(self):
        print(self.name+"吃饭")

dog = Dog("小黑")

print(dog.name)
print(dog.cate)
dog.jump()
dog.eat()

~~~

## Python JSON

JSON(JavaScript Object Notation) 是一种轻量级的数据交换格式，易于人阅读和编写。

json.dumps 用于将 Python 对象编码成 JSON 字符串。

~~~py
import json
data = [ { 'b' : 2, 'd' : 4, 'a' : 1, 'c' : 3, 'e' : 5 } ]
json = json.dumps(data)
print(json)

import json
jsonData = '{"a":1,"b":2,"c":3,"d":4,"e":5}'
text = json.loads(jsonData)  #将string转换为dict
print(text)
~~~

## Python异常处理

~~~py
#异常处理
try:
    fh = open("work/2.txt","a")
    fh.write("hello")
except IOError:
    print('Error:没有找到文件')
else:
    print('写入成功')
    fh.close()
finally:
    print("关闭文件")
    fh.close()
~~~

## 常见Linux命令

~~~n
!ls /home
!ls ./
!pwd
cp ：复制文件或目录
!cp test.txt ./test_copy.txt
mv:移动文件与目录，或修改文件与目录的名称
!mv /home/aistudio/work/test_copy.txt /home/aistudio/data/
rm :移除文件或目录
!rm /home/aistudio/data/test_copy.txt

常见的压缩文件后缀名有.tar.gz，.gz，和.zip，下面来看看在Linux上它们分别的解压和压缩命令。
#会将文件压缩为文件 test.txt.gz，原来的文件则没有了，解压缩也一样
!gzip /home/aistudio/work/test.txt
!gzip -d /home/aistudio/test.gz
!tar -zcvf /home/aistudio/work/test.tar.gz /home/aistudio/work/test.txt
!tar -zxvf /home/aistudio/work/test.tar.gz
zip和unzip
!zip -r /home/aistudio/work/test.zip /home/aistudio/work/test.txt
!unzip  /home/aistudio/work/test.zip 
~~~

## 案例

BeautifulSoup 是一个可以从HTML或XML文件中提取数据的Python库。

BeautifulSoup支持Python标准库中的HTML解析器,还支持一些第三方的解析器,其中一个是 lxml。

requests是python实现的简单易用的HTTP库，requests.get(url)可以发送一个http get请求，返回服务器响应内容。

*#!pip install beautifulsoup4 -t /home/aistudio/pachong1/* *#!pip install lxml -t /home/aistudio/pachong1/*

~~~py
import json
import re
import requests
import datetime
from bs4 import BeautifulSoup
import os

#获取当天的日期，并进行格式化，用于后面文件命名，格式：20230626
today = datetime.date.today().strftime('%Y%m%d')

##爬取百度百科数据，返回html
def crawl_data():
    #把爬虫模拟成正常
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',
        'Accept-Encoding':'gzip,deflate',
        'Accept-Language':'zh-CN,zh;q=0.9',
        'Connection':'keep-alive'
    }
    #定义要爬取的路径
    url='https://movie.douban.com/cinema/nowplaying/chengdu/'


    try:
        response = requests.get(url,headers=headers)
        response.encoding = 'UTF-8'
        soup = BeautifulSoup(response.text,"lxml")
        # table = soup.find("div",id="tbl_wrap")
        # tables = soup.find_all('table',{'class':'table-view log-set-param'})
        table = soup.select("#nowplaying .lists")

        # print(table)
        return table
    except Exception as e:
        print(e)
        
#对爬取的页面数据进行解析，并保存为JSON文件
def parse_data(table):
    bs = BeautifulSoup(str(table),'lxml')
    all_lis = bs.find_all('li',{"class":"list-item"})
    # print(all_lis)
    
    datas = []
    for li in all_lis:
        data = {}
        data['actors'] = li.get('data-actors')
        data['director'] = li.get('data-director')
        data['duration'] = li.get('data-duration')
        data['region'] = li.get('data-region')
        data['release'] = li.get('data-release')
        data['score'] = li.get('data-score')
        data['title'] = li.get('data-title')
        data['votecount'] = li.get('data-votecount')
        data['pic'] = li.find('img').get('src')
        
        datas.append(data)
    #f.write(json.dumps(a, indent=4))
    # json.dump(a,f,indent=4)   # 和上面的效果一样
    with open('work/' + today + '.json', 'w', encoding='UTF-8') as f:
        json.dump(datas, f, ensure_ascii=False)
        # f.write(json.dumps(datas,ensure_ascii=False))
    # print(datas)

#爬取图片
def crawl_pic():
    with open('work/'+today+'.json','r',encoding='UTF-8') as file:
        array = json.loads(file.read())
    
    headers = { 
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36' 
    }

    for item in array:
        title = item['title']
        pic = item['pic']

        # path = 'work/'+'pics/'+title+'/'
        path = 'work/pics/'

        if not os.path.exists(path):
            os.makedirs(path)
        
        #枚举 为了取索引 在前 值在后
        # for i,url in enumerate()
        try:
            onepic = requests.get(pic,timeout=15)
            picname = title+'.jpg'

            with open(path+picname,'wb') as f:
                f.write(onepic.content)
        except Exception as e:
            print('失败'+title)
            print(e)

def show_pic(path):
    pic_num = 0
    for (dirpath,dirnames,filenames) in os.walk(path):
        for filename in filenames:
            pic_num+=1
            print('路径：%s' % (os.path.join(dirpath,filename)))
    print("共"+str(pic_num))

if __name__ == '__main__':    
    # table = crawl_data()
    # parse_data(table)
    # crawl_pic()
    show_pic('/home/aistudio/work/pics')
~~~



## Numpy库

NumPy是使用Python进行科学计算的基础软件包。

~~~py
import numpy as np 
arr = np.array([[1,2,3],[3,4,5]])
print(arr)
arr2 = np.array(((1,32),(34,2)))
print(arr2)

#元素未知，但可占位
#zeros 指定长度，元素都是0
zero = np.zeros((2,3),dtype='int64')
print(zero)
#ones  指定长度，元素都是1
one = np.ones((2,4),dtype='int64')
print(one)
empt = np.empty((2,4))
print(empt)
#empty  随机
#range 范围 生成
ran = np.arange(10,40,3)
print(ran)

import numpy as np 
ar = np.array([[1,23],[45,2],[2,45]])
#数组维度
print(ar.ndim)
#数组形状
print(ar.shape)
#元素个数
print(ar.size)
#数组类型
print(ar.dtype)
#数组 arange一个参数是上限，下限0,步长1 reshape重构形状
arr2 = np.arange(6).reshape([3,2])
print(arr2)
print(arr2[1])
print(arr2[1][1])
print(arr2[1,1])
print(arr2[1,:])
arr3 = np.array([[2,3,54],[25,4,5]],dtype=np.int64).reshape([3,2])
print(arr3)

矩阵的基础运算
arr1 = np.array([[1,2,3],[4,5,6]])
arr2 = np.ones([2,3],dtype=np.int64)

print(arr1 + arr2)
print(arr1 - arr2)
print(arr1 * arr2)
print(arr1 / arr2)
print(arr1 ** 2)
[[2 3 4]
 [5 6 7]]
[[0 1 2]
 [3 4 5]]
[[1 2 3]
 [4 5 6]]
[[1. 2. 3.]
 [4. 5. 6.]]
[[ 1  4  9]
 [16 25 36]]

矩阵乘法：
arr3 = np.array([[1,2,3],[4,5,6]])
arr4 = np.ones([3,2],dtype=np.int64)
print(arr3)
print(arr4)
print(np.dot(arr3,arr4))
[[1 2 3]
 [4 5 6]]
[[1 1]
 [1 1]
 [1 1]]
[[ 6  6]
 [15 15]]

矩阵的其他计算：
print(arr3)
print(np.sum(arr3,axis=1)) #axis=1,每一行求和 axie=0,每一列求和
print(np.max(arr3))
print(np.min(arr3))
print(np.mean(arr3))
print(np.argmax(arr3))
print(np.argmin(arr3))
[[1 2 3]
 [4 5 6]]
[ 6 15]
6
1
3.5
5
0
#转置
arr3_tran = arr3.transpose()
print(arr3_tran)
[[1 4]
 [2 5]
 [3 6]]
#压平
print(arr3.flatten())
[1 2 3 4 5 6]  




~~~

### 2.数组的索引与切片

~~~py
arr5 = np.arange(0,6).reshape([2,3])
#[0,1,2,3,4,5]  [[0,1,2],[3,4,5]
print(arr5)
print(arr5[1])
print(arr5[1][2])
print(arr5[1,2])

print(arr5[1,:]) #[3,4,5]
print(arr5[:,1])#[1,4]
print(arr5[1,0:2])#[3,4]
print(arr6[1::2])  #从第二个开始，取整个数组且步长为2
print(arr6[：：-1]) #倒序取整个数组
~~~

### 修改列表元素

切片赋值的办法实现：

~~~py
arr = [3,4,7,10,13,15,17,20,23,25]
arr[0:2] = [22,55]
print(arr) #[22 55  7 10 13 15 17 20 23 25]

~~~

### 插入新元素

~~~py
arr = [3,4,7,10,13,15,17,20,23,25]
#arr[:0] = ['abc']
~~~

### 倒序

~~~py
arr = np.arange(27).reshape((3,3,3))
print(arr[1,::-1])  #一维倒序
print(arr[1,0,::-1]) #二维倒序
print(arr[::-1]) #0维倒序

print(arr[::-1,::-1]) #0;1维倒序
print(arr[::-1,::-1,::-1]) #0;1;2维倒序
~~~

### 浅拷贝

~~~py
arr2 = arr1[:]
import copy
arr2 = copy.copy(arr1)
~~~

### 深拷贝

~~~py
arr2 = copy.deepcopy(arr1)
#arr2 is arr1  False
~~~



## pandas库

pandas是python第三方库，提供高性能易用数据类型和分析工具。

pandas基于numpy实现，常与numpy和matplotlib一同使用

Pandas 的主要数据结构是 Series一维数据与 DataFrame 二维数据，这两种数据结构足以处理金融、统计、社会科学、工程等领域里的大多数典型用例。

### 数据结构

| 维数 | 名称      | 描述                               |
| ---- | --------- | ---------------------------------- |
| 1    | Series    | 带标签的一维同构数组               |
| 2    | DataFrame | 带标签的，大小可变的，二维异构表格 |



Pandas 里，绝大多数方法都不改变原始的输入数据，而是复制数据，生成新的对象。 一般来说，原始输入数据**不变**更稳妥