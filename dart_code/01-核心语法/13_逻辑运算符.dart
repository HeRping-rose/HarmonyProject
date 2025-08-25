void main() {
  // 年龄
  int age = 33;
  // 工作年限
  int years = 10;

  // 1. 逻辑与：一假则假
  // 年龄大于28岁，并且工作年限大于4年
  if (age > 28 && years > 4) {
    print('符合条件');
  } else {
    print('不符合条件');
  }

  // 2. 逻辑或：一真则真
  // 年龄大于23岁，或者工作年限大于2年
  if (age > 23 || years > 2) {
    print('符合条件');
  } else {
    print('不符合条件');
  }

  // 3. 逻辑非：真变假，假变真
  if (!(age > 28 && years > 4)) {
    print('不符合条件');
  } else {
    print('符合条件');
  }

  // 工作年限不小于9年
  if (years >= 9) {
    print('符合条件');
  } else {
    print('不符合条件');
  }
}
