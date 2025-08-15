#追加写入
f = open("1.txt","a")
f.write("小明")
f.close()

#复制
f = open("1.txt","r")
res = f.read()
f.close()

f2 = open("2.txt","w")
f2.write(res)
f2.close()

#一行行读取
f3 = open("log.txt","r",encoding="utf-8")
res = f3.readlines()
for i in res:
    print(i)

f3.close()