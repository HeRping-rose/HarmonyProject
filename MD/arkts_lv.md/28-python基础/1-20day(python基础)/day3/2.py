# 196 -> "196"    1+9+6= 15   1+5 = 6
# 6
#133456345387567
num = int(input("输入数字:"))
while num>9:
    total=0
    for i in str(num):
        total+=int(i)

    num = total

print(num)

