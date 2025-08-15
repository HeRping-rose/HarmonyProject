import random

def draw_prize(prizes, winners):
    """
    抽奖函数
    :param prizes: 奖项列表，包括奖品和数量，例如 [('一等奖', 3), ('二等奖', 6), ('三等奖', 30)]
    :param winners: 中奖名单，用于检查是否已经中过奖
    :return: 中奖者姓名和奖项
    """
    prize_type, prize_count = random.choice(prizes)
    winner = random.choice([worker for worker in workers if worker not in winners])
    winners.append(winner)
    print(f'恭喜 {winner} 获得 {prize_type}')
    return winner, prize_type

# 员工名单
workers = [f'员工{i}' for i in range(1, 301)]
# 奖项设置
prizes = [('一等奖', 3), ('二等奖', 6), ('三等奖', 30)]
# 中奖名单
winners = []

# 第一次抽三等奖
print("第一次抽奖：")
for _ in range(30):
    draw_prize([('三等奖', 1)], winners)

# 第二次抽二等奖
print("\n第二次抽奖：")
for _ in range(6):
    draw_prize([('二等奖', 1)], winners)

# 第三次抽一等奖
print("\n第三次抽奖：")
for _ in range(3):
    draw_prize([('一等奖', 1)], winners)
