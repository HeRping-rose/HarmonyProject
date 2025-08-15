s = "我们班有小明和小白还有小新!,其中小新是班长!"
# if "小白" in s:
#     print("在")
# else:
#     print("不在")

# print(s.count("小新"))
# print(s.replace("小新","二狗"))
# l = [2,23,45,3,34,34,45]
# print(l.count(34))
# mystr = "hello world and it and itstudy and Python"
# print(mystr.split(' '))

txt = input("输入一段话：") # My Name It Is Xa...
res = []
# print(txt.split(" "))  #['my', 'nAme']
for i in txt.split(" "):
    res.append(i[0].upper()+i[1:].lower())
#print(res) #['Today', 'It', 'Is', 'Twosday']
print(" ".join(res))