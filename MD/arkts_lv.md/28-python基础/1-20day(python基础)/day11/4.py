students = [
    {'name': 'TOM', 'age': 20},
    {'name': 'ROSE', 'age': 19},
    {'name': 'Jack', 'age': 22}
]
students.sort(key=lambda i:i["name"])
students.sort(key=lambda i:i["age"], reverse=True)
print(students)

a = [3,3,65,4,56,8]
#更新
# print([i*i for i in a])
# def xx(i):
#     return i*i
print(list(map(lambda i:i*i,a)))

def xx(i):
    i["age"]+=10
    return i
print(list(map(xx,students)))