import sys
a = "I like Python!"
print(sys.getrefcount(a))
b = a
print(sys.getrefcount(a))
