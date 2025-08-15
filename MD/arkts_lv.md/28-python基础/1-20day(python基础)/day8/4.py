#深拷贝
import copy
a = [1,3,[1,34,45],5] # xx001 = [1,3,xxx002,5]

b = copy.deepcopy(a)  # b =  [1,3,xxx002,5]

a[2][1] = 100

print(a)
print(b) #[1,3,[1,34,45],5]  [1,3,[1,100,45],5]