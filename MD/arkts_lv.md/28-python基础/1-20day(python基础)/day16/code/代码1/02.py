class Question:
    def __init__(self, prompt, answer):
        self.prompt = prompt
        self.answer = answer
        self.type = "Question"

    def ask(self):
        print(self.prompt)

    def check_answer(self, user_answer):
        return self.answer == user_answer

class SingleChoice(Question):
    def __init__(self, prompt, answer, options):
        super().__init__(prompt, answer)
        self.options = options
        self.type = "SingleChoice"

    def ask(self):
        print(self.prompt)
        for index, option in enumerate(self.options):
            print(f"{index + 1}. {option}")

    def check_answer(self, user_answer):
        return self.options[user_answer - 1] == self.answer

class MultipleChoice(Question):
    def __init__(self, prompt, answer, options):
        super().__init__(prompt, answer)
        self.options = options
        self.type = "MultipleChoice"

    def ask(self):
        print(self.prompt)
        for index, option in enumerate(self.options):
            print(f"{index + 1}. {option}")

    def check_answer(self, user_answer):
        if isinstance(user_answer, list):
            return all(option == self.options[index] for index, option in enumerate(self.options) if index in user_answer - 1)
        return False

class FillInTheBlank(Question):
    def __init__(self, prompt, answer):
        super().__init__(prompt, answer)
        self.type = "FillInTheBlank"

    def ask(self):
        print(self.prompt)

    def check_answer(self, user_answer):
        # 假设用户答案与标准答案不区分大小写
        return self.answer.lower() == user_answer.lower()

class TrueOrFalse(Question):
    def __init__(self, prompt, answer):
        super().__init__(prompt, answer)
        self.type = "TrueOrFalse"

    def ask(self):
        print(self.prompt)

    def check_answer(self, user_answer):
        return str(user_answer).lower() == "true" if self.answer else str(user_answer).lower() == "false"

# 示例
questions = [
    SingleChoice("What is the capital of France?", "Paris", ["London", "Berlin", "Paris", "Madrid"]),
    MultipleChoice("Select all fruits.", ["apple", "banana", "carrot", "orange"], [1, 2, 4]),
    FillInTheBlank("Complete the sentence: The quick brown fox jumps over the _______.", "lazy dog"),
    TrueOrFalse("Python is an interpreted language.", True)
]

for question in questions:
    question.ask()
    user_answer = input("Your answer: ")
    if question.check_answer(user_answer):
        print("Correct!")
    else:
        print("Incorrect.")
    print("---")


import random

def ask_question(questions):
    if not questions:
        print("没有更多题目了。")
        return

    # 随机选择一个题目
    question = random.choice(questions)
    prompt = question["prompt"]
    answer = question["answer"]

    # 显示题目并获取用户输入
    user_answer = input(prompt).strip().lower()

    # 检查用户答案是否正确
    if user_answer == answer:
        print("回答正确！")
    else:
        print(f"回答错误，正确答案是：{answer}")

    # 从列表中移除已使用的题目
    questions.remove(question)

# 示例使用
questions_of_each_type = [single_choice_questions, multiple_choice_questions, fill_in_the_blank_questions, true_or_false_questions]
all_questions = sum(questions_of_each_type, [])

# 随机选择题型并提问
while all_questions:
    question_type = random.choice(questions_of_each_type)
    if isinstance(question_type[0], dict):  # 如果是字典类型，表示是选择题或判断题
        ask_question(question_type)
    else:  # 如果是列表类型，表示是填空题
        question = random.choice(question_type)
        prompt, correct_answer = question
        user_answer = input(prompt).strip()
        if user_answer == correct_answer:
            print("回答正确！")
        else:
            print(f"回答错误，正确答案是：{correct_answer}")
        question_type.remove(question)



https://blog.csdn.net/qq_41082423/article/details/82048710

