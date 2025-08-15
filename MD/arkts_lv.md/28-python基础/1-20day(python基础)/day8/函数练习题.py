# 1.编写一个函数，接受两个参数，返回它们的和。
def add_numbers(a, b):
    return a + b
result = add_numbers(3, 5)
print(result)
# 2.编写一个函数，接受一个字符串作为参数，返回该字符串的反转。
def reverse_string(input_str):
    return input_str[::-1]

result = reverse_string("Hello, World!")
print(result)


# 3.编写一个函数，接受一个整数列表作为参数，返回其中的最大值和最小值。
def find_max_min(numbers):
    if not numbers:
        return None, None  # 如果列表为空，返回None

    max_num = min_num = numbers[0]  # 初始化最大值和最小值为列表的第一个元素

    for num in numbers:
        if num > max_num:
            max_num = num
        elif num < min_num:
            min_num = num

    return max_num, min_num

# 4.测试函数
numbers = [3, 1, 8, 4, 10, 5]
max_num, min_num = find_max_min(numbers)
print("最大值:", max_num)
print("最小值:", min_num)

# 5.编写一个函数，接受一个字符串列表作为参数，返回其中长度最长的字符串。
def longest_string(strings):
    if not strings:
        return None
    return max(strings, key=len)

# 示例用法
string_list = ["apple", "banana", "kiwi", "strawberry"]
result = longest_string(string_list)
print(result)
# 6.编写一个函数，接受一个整数作为参数，返回其阶乘。
def factorial(n):
    result = 1
    for i in range(1, n + 1):
        result *= i
    return result
print(factorial(5))
# 7.编写一个函数，接受一个字符串作为参数，返回一个字典，其中键为字符串中的字符，值为该字符在字符串中出现的次数。
from collections import Counter

def count_characters(string):
    return dict(Counter(string))

# 示例用法
input_string = "hello"
result = count_characters(input_string)
print(result)
# 8.编写一个函数，接受一个整数列表作为参数，返回所有奇数的和。
def sum_of_odd_numbers(numbers):
    return sum(num for num in numbers if num % 2 != 0)


numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
result = sum_of_odd_numbers(numbers)
print(result)
# 9.编写一个函数，接受一个整数列表作为参数，返回其中所有负数的个数。
def count_negative_numbers(numbers):
    count = 0
    for num in numbers:
        if num < 0:
            count += 1
    return count

# 示例用法
numbers = [1, -2, 3, -4, 5, -6]
print(count_negative_numbers(numbers))  # 输出: 3
# 10.编写一个函数，接受一个字符串列表作为参数，返回其中所有长度超过5的字符串组成的列表。
def filter_strings_by_length(strings):
    return [s for s in strings if len(s) > 5]

# 示例用法
input_strings = ["apple", "banana", "kiwi", "grape", "orange"]
result = filter_strings_by_length(input_strings)
print(result)
# 11.编写一个函数，接受一个整数列表作为参数，返回其中的中位数。
def median(nums):
    sorted_nums = sorted(nums)
    n = len(sorted_nums)
    if n % 2 == 0:
        return (sorted_nums[n // 2 - 1] + sorted_nums[n // 2]) / 2
    else:
        return sorted_nums[n // 2]

# 示例用法
numbers = [1, 3, 5, 7, 9]
print("中位数:", median(numbers))