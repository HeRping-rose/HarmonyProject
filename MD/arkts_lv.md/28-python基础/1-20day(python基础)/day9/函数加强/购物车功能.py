

items = []


def add_item( name, price, quantity):
    items.append({"name": name, "price": price, "quantity": quantity})
def display_cart():

    if not items:
        print("购物车为空")
    else:
        print("购物车内容：")
        for item in items:
            print(f"商品名称: {item['name']}, 价格: {item['price']}, 数量: {item['quantity']}")
def modify_item(index, name=None, price=None, quantity=None):
    if index < 0 or index >= len(items):
        print("无效的索引")
        return
    item = items[index]
    print(type(item))

    if name:
        item['name'] = name
    if price:
        item['price'] = price
    if quantity:
        item['quantity'] = quantity
def calculate_total_price():
    total_price = 0
    for item in items:
        total_price += item['price'] * item['quantity']
    return total_price


while True:
    print("\n请选择操作：")
    print("1. 添加商品")
    print("2. 展示购物车")
    print("3. 修改购物车信息")
    print("4. 计算总价")
    print("5. 退出")
    choice = input("输入数字以选择操作：")
    if choice == "1":
        name = input("输入商品名称：")
        price = float(input("输入商品价格："))
        quantity = int(input("输入商品数量："))
        add_item(name, price, quantity)
    elif choice == "2":
        display_cart()
    elif choice == "3":
        index = int(input("输入要修改的商品索引："))
        name = input("输入新的商品名称（按回车跳过）：")
        price = float(input("输入新的商品价格（按回车跳过）：") or -1)
        quantity = int(input("输入新的商品数量（按回车跳过）：") or -1)
        modify_item(index, name, price if price != -1 else None, quantity if quantity != -1 else None)
    elif choice == "4":
        print(f"总价为: {calculate_total_price()}")
    elif choice == "5":
        print("感谢使用，再见！")
        break
    else:
        print("无效的选项，请重新输入。")