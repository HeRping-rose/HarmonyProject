// import 'dart:io';

void main() {
  // 1. if单分支语句
  // 准备高考成绩，如果分数大于等于700分，则输出 '恭喜考入黑马程序员'
  var score = 800;
  if (score >= 700) {
    print('恭喜考入黑马程序员');
  }

  // 2. if双分支语句
  // 准备高考成绩，如果分数大于等于700分，则输出 '恭喜考入黑马程序员'，反之，则输出 '继续努力'
  if (score >= 700) {
    print('恭喜考入黑马程序员');
  } else {
    print('继续努力');
  }

  // 3. if多分支语句
  // 根据学生分数划分学生成绩等级：
  // 优秀：分数大于等于90分
  // 良好：分数小于90分，且大于等于80分
  // 中等：分数小于80分，且大于等于60分
  // 不及格：分数小于60分
  // print('请输入学生分数：');
  // var score1 = int.parse(stdin.readLineSync()!);
  var score1 = 80;
  if (score1 >= 90) {
    print('优秀');
  } else if (score1 >= 80) {
    print('良好');
  } else if (score1 >= 60) {
    print('中等');
  } else {
    print('不及格');
  }

}
