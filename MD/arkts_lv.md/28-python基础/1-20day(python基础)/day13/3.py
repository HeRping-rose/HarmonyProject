import os
#文件备份
name = input('请输入您要备份的文件名：')
datalen = os.path.getsize("data.txt")/3
f = open("data.txt","r",encoding="utf-8")
f2 = open(name,'a')
txt = ""
while True:
    one = f.read(10)
    txt+=one
    print(f"{len(txt)/datalen*100:.2f}")
    if len(one) == 0:
        break
    f2.write(one)

f.close()

