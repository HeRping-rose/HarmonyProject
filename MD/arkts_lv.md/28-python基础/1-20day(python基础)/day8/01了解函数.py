#函数就是在把一系列代码封装起来，来完成【一个】特定的任务，并且，可以在任何时候反复使（调）用。

def xiyiji(dfgerter,asfrasdf):
    print(["chengyi", "外套", "裤子"])
    print(f"放{dfgerter}水")
    print("放衣服")
    print("加洗衣液")
    print("洗")
    if asfrasdf == True:
        print("烘干")
    print("晾晒")

#调用
xiyiji("10L",True)
xiyiji("2L",False)

def sum(a):
    total = 0
    for i in a:
        total += i
    print(total)

sum([1,2,45,54,2,4,6,23])
sum([1,23,3])

#返回值
def jisuan():
    a = 100
    b = 200
    return a+b

bianliang = jisuan()
print(bianliang)

def split(fuhao):
    str = "sdf=1111"
    #....
    return ["sdf","1111"]

shou = split("=")
print(shou)

#普通函数
def one(x):
    return x*2
o = one(10)
print(o)
#匿名函数
two = lambda x:x*2
p = two(10)
print(p)

#链式调用
def lianshi():
    return [lambda x:x*2,145]

lianshi()[0](10)/5
list = [1,lambda x:[1,2,lambda x:x]]
list[1](10)[2](2)

str ="https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&tn=baidu&wd=define&oq=lambda%25E5%2587%25BD%25E6%2595%25B0python&rsv_pq=98c10efe000b9eca&rsv_t=1900X0tKReTv1MQJa%2B50CNJq%2BMjdUDAapgWgjPeo%2B0%2B9lAyHwe9uRNM5o%2FE&rqlang=cn&rsv_enter=1&rsv_dl=tb&rsv_btype=t&inputT=7551&rsv_sug3=27&rsv_sug1=39&rsv_sug7=100&rsv_sug2=0&rsv_sug4=7551"

# li = str.split("?")
# li[1]
li = str.split("?")[1].split("&")
print(li)
print(str)

b = [1,3]
b.pop()
print(b)
