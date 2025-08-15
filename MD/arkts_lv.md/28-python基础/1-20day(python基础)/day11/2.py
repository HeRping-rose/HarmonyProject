kfc = ["汉堡","可乐","鸡翅","蛋挞","薯条","甜筒","鸡肉卷"]
# for i in range(len(kfc)):
#     for j in range(i+1,len(kfc)):
#         print(kfc[i],kfc[j])
#
# for i in range(len(kfc)):
#     for j in range(i+1,len(kfc)):
#         for k in range(j + 1, len(kfc)):
#             print(kfc[i],kfc[j],kfc[k])

#问题 递归
result = []
def kfcGroup(n,item=[]):
    if n == 0:
        return result
    for i in range(len(kfc)):
        item.append(kfc[i])
        kfcGroup(n-1,item)
        result.append(item.copy())
        item = []

print(kfcGroup(2))
print(result)
