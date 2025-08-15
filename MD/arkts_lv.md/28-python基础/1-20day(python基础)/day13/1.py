#文件内容操作  （文本或json）

#1.打开文件
# open(name="1.txt",mode="w")
# f是一个可以操作文件的对象，在这个对象上提供了 具体的 读或写的方法
f = open("1.txt","w")
# 2.文件写入
f.write("你好")
# 3. 关闭文件
f.close()

f2 = open("1.txt","r")
print(f2.read())
f2.close()