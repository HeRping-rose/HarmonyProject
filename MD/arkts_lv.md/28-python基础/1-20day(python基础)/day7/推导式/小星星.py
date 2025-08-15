i=0
num=int(input("输入行数"))
while i<num:
    if i< 5:
        print(i*"*")
    else:
        print((num-i)*"*")

    i+=1