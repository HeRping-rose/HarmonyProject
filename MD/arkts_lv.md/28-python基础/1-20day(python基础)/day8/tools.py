def avgfn(score):
    # score = [23,45,76,21,435,6]
    total = 0
    for i in score:
        total+=i
    avg = total/len(score)
    print(avg)

#参数（实参与形参）必须要对应， 或都有默认值
def sum(a=100,b=200):
    print(a+b)

def lunbotu(config={}):
    width = config.get("width",50)
    height = config.get("height", 50)
