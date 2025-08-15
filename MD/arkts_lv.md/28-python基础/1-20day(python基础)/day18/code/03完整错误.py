num = 1
try:
    print(num)
except Exception as res:
    print(res)
else:
    print("没有错误")
finally:
    print("无论有没有错误，都会执行")