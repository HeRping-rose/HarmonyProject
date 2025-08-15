import sys
a='i like python you'
print(sys.getrefcount(a))
b=a
print(sys.getrefcount(a))
c=a
del c
print(sys.getrefcount(a))

# sys.modules.keys()
print(sys.modules)
print(sys.modules.keys())
print(sys.modules.values())
print(sys.platform)