#1000
num = 1
try:
    print(num/0)
    #f = open('./1.txt','r')
except (NameError,ZeroDivisionError) as res:
    print(res)
