#3以内数字累加和
# total = 0
# i = 1
# while i<4:
#     total+=i
#     i+=1
#
# print(total)
# total = 0
# for i in range(1,4):
#     total+=i
# print(total)
def sum(n):
    #边界条件
    if n==0:
        return n
    # 第一次调用：return 3 + sum(3-1)
    # sum(3-1)第二次调用：return 2 + sum(2-1)
    # sum(2-1)第三次调用：return 1 + sum(1-1)
    return n + sum(n-1)
    # 3 + 2 + 1 + 0
print(sum(3))
# 
# def sum2(n):
#     if n==0:
#         return n
#     if n%2==0:
#         return sum2(n-1)
#     return n+sum2(n-1)
#     # 3+1+0
# print(sum2(4))