# # l1=[1,2,3,4]
#
# l2=l1[:]
# l2=l1.copy()
# l1[0]=100
#
# print(l2)

# l1=[1,2,[3,4]]
# l2=l1.copy()
# l1[2][0] = 200
# print(l2)

import copy
l1=[1,2,[3,4]]
l3=copy.deepcopy(l1)
l1[2][0]=300
print(l1)
print(l3)