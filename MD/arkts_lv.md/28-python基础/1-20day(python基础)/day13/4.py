# f = open("1.txt","r",encoding="utf-8")

with open("1.txt","r") as f:
    print(f.read())

with open("abc.txt","w") as f:
    print(f.write("1243234"))