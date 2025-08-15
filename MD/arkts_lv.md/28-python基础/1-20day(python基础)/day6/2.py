import os
# 读取文件夹中的所有文件名
#print(os.listdir("./txt")) #['1.txt', '324.txt', '435.txt']
dir_url = "./txt"
for i in os.listdir(dir_url):
    # 读取文件，返回一个读文件的对象
   res = open(os.path.join(dir_url,i),mode="r")
    #读取内容
   print(res.read())

# 路径拼接
# print(os.path.join("txt","1.txt"))