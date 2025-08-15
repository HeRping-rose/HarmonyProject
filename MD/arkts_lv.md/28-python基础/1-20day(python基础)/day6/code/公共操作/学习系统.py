# db_file='student_data.db'
#
# def validate_phone(num):
#     if not num.isdigit():
#         exit('必须是数字')
#     if len(num) !=11:
#         exit('手机号必须11位')
#
#
# def register_api():
#     stu_data= {}
#     print('欢迎来到学堂'.center(50,'-'))
#     print('请完成学籍注册')
#     # 学生姓名 年龄，手机 身份证
#     name=input('姓名:').strip()
#     age=input('年龄：').strip()
#
#     phone=input('手机:').strip()
#
#     id_num=input('请输入身份证号:').strip()
#
#     if phone in phone_list:
#         exit('该手机号已注册')
#     if id_num in id_num_list:
#         print('该身份证已注册')
#
#     # 定义课程列表
#     course_list=['python开发','云计算','网络安全','前端','Linux']
#     # 循环列表
#     for index,course in enumerate(course_list):
#         print(f"{index},{course}")
#
#     # 选择课程
#     selected_course = input("选择课程:")
#     if selected_course.isdigit():
#         selected_course=int(selected_course)
#         if selected_course>=0 and selected_course<len(course_list):
#             picked_course = course_list[selected_course]
#             print(picked_course)
#         else:
#             exit('不合法选项')
#     else:
#         exit('非法输入')
#
#     stu_data['name'] = name
#     stu_data['age'] = age
#     stu_data['phone'] = phone
#     stu_data['id_num'] = id_num
#     stu_data['course'] = picked_course
#     return stu_data
#
#
#
# def commit_to_db(filename,stu_data):
#     """
#         把学员数据保存到文件里
#         filename:学员的数据库文件
#         stu_data:单个学员数据的dict
#
#         """
#     # 打开 文件并解码
#     f= open(filename,'a',encoding='utf-8')
#     # 给数据赋值
#     row= f"{stu_data['name']},{stu_data['age']},{stu_data['phone']},{stu_data['id_num']},{stu_data['course']}\n"
#     # 写入数据
#     # 关闭数据
#     f.write(row)
#     f.close()
#
#
#
#
#
#
#
# student_data=register_api()
# commit_to_db(db_file,student_data)