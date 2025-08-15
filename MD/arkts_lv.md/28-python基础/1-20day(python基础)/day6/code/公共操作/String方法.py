import random
import string
# 车牌首字母
car_num_sample = string.digits+string.ascii_uppercase

car_num_sample = string.digits+string.ascii_uppercase


count = 0
while count < 3 :
    count += 1

    num_list = []
    for i in range(20):
        second_letter = random.choice(string.ascii_uppercase)
        car_num = f"京{second_letter}-{''.join(random.sample(car_num_sample,5))}"
        num_list.append(car_num)
        print(i, car_num)
    choice = input("choice:").strip()
    if choice in num_list:
        exit(f"恭喜你选购成功，您的新⻋牌是{choice}")
    else:
        if count==3:
            print('您的次数已经选完')
            break
        print(f"未选中， 还有{3-count}次机会")
