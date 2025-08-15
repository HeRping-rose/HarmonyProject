#单选题
single_choice_questions = [
    {
        "prompt": "以下哪个国家不是欧洲的国家？",
        "options": ["法国", "德国", "意大利", "中国"],
        "answer": 3
    },
    {
        "prompt": "太阳系中第三近的行星是哪一个？",
        "options": ["水星", "金星", "地球", "火星"],
        "answer": 2
    },
    # ... (其他单选题)
]
#多选题
multiple_choice_questions = [
    {
        "prompt": "以下哪些食物富含维生素C？",
        "options": ["苹果", "香蕉", "橙子", "土豆"],
        "answer": [2, 3]  # 假设索引2和3的选项是正确的
    },
    {
        "prompt": "下列哪些动物是陆生动物？",
        "options": ["鱼", "狗", "鸟", "蛇"],
        "answer": [1, 2, 3]  # 假设索引1, 2, 3的选项是正确的
    },
    # ... (其他多选题)
]
#填空题
fill_in_the_blank_questions = [
    {
        "prompt": "_______ 是世界上最大的陆生动物。",
        "answer": "非洲象"
    },
    {
        "prompt": "水的化学公式是H₂_______。",
        "answer": "O"
    },
    # ... (其他填空题)
]
#判断题
true_or_false_questions = [
    {
        "prompt": "地球是围绕太阳旋转的。",
        "answer": True
    },
    {
        "prompt": "人类已经登上了火星。",
        "answer": False
    },
    # ... (其他判断题)
]

#题库类
class Question:
    def __init__(self, prompt, answer):
        self.prompt = prompt
        self.answer = answer
        self.options = []
        self.type = "Question"
        self.score = 2

    def ask(self):
        print(self.prompt)

    def check_answer(self, user_answer):
        return self.answer == user_answer


class SingleChoice(Question):
    def __init__(self, prompt, answer, options):
        super().__init__(prompt, answer)
        self.options = options
        self.type = "单选"
        self.score = 2

    def ask(self):
        print(f'({self.type})'+self.prompt)
        for index, option in enumerate(self.options):
            print(f"{index + 1}. {option}")

    def check_answer(self):
        # 显示题目并获取用户输入
        user_answer = int(input("请作答:"))-1
        # 检查用户答案是否正确
        if user_answer == self.answer:
            print(f"回答正确！,得{self.score}分")
        else:
            print(f"回答错误，正确答案是：{self.options[self.answer]}")

class MultipleChoice(Question):
    def __init__(self, prompt, answer, options):
        super().__init__(prompt, answer)
        self.options = options
        self.type = "多选"
        self.score = 3

    def ask(self):
        print(f'({self.type})' + self.prompt)
        for index, option in enumerate(self.options):
            print(f"{index + 1}. {option}")

    def check_answer(self, user_answer):
        pass

# one = SingleChoice("以下哪个国家不是欧洲的国家？",3,["法国", "德国", "意大利", "中国"])
# one.ask()
# one.check_answer()
mut = SingleChoice("以下哪个国家不是欧洲的国家？",3,["法国", "德国", "意大利", "中国"])
mut.ask()
mut.check_answer()