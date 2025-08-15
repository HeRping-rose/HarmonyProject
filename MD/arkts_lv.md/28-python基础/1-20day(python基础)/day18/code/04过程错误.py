import time
try:
    f= open('test.txt')
    try:
        line = f.readline()
        time.sleep(3)
        print(line)
    except:
        print("错误")

except Exception as res:
    print(res)
finally:
        f.close()
        print('关闭文件')