#-*- coding:utf-8 -*-
# 1.数据存到文件的格式
#2. 要确保手机，身份证，在文件里同样的数据只有一条。可以文件里的手机和身份证号这2列加载到内存
# 里用户一输入相关列，就到列表里检查有没有重复的
#3.选学科时给用户列出选项供选择

# 数据库文件
db_file='student_data.db'

def validate_phone(num):
    if not num.isdigit():
        exit('必须是数字')
    if len(num) !=11:
        exit('手机号必须11位')

def register_api():
    # 创建课程字典
    stu_data={}
    print('欢迎来到学堂'.center(50,"-"))
    print('请完成学籍注册')
    # 学生姓名 年龄，手机 身份证
    name=input("姓名:").strip()
    age=input("年龄：").strip()
    phone=input("手机：").strip()
    id_num=input("请输入身份证号：").strip()
    if phone in phone_list:
        exit('该手机号已注册')
    validate_phone(phone)

    if id_num in id_num_list:
        print('该身份证已注册')

    # 定义课程列表
    course_list=['python开发','云计算','网络安全','前端','Linux']
    # 循环列表
    for index,course in enumerate(course_list):
        print(f'{index},{course_list}')
    selected_course=input("选择课程:")
    if selected_course.isdigit():
        selected_course=int(selected_course)
        if selected_course>=0 and selected_course<len(course_list):
            picked_course=course_list[selected_course]
            print(picked_course)

        else:
            exit('不合法非法选项')

    else:
        exit('非法输入')

    stu_data['name']=name
    stu_data['age']=age
    stu_data['phone']=phone
    stu_data['id_num']=id_num
    stu_data['course']=picked_course
    return stu_data



def commit_to_db(filename,stu_data):
    """
    把学员数据保存到文件里
    filename:学员的数据库文件
    stu_data:单个学员数据的dict

    """
    f=open(filename,'a', encoding='utf-8')
    row=f"{stu_data['name']},{stu_data['age']},{stu_data['phone']},{stu_data['id_num']},{stu_data['course']}\n"
    f.write(row)
    f.close()




# 加载文件
def load_validated(filename):
    # 打开文件
    f= open(filename)
    # 添加空电话列表
    phone_list=[]
    # 添加身份证恐怖列表
    id_num_list=[]
    # 循环文件
    for line in f:
        # 用','分割
        line=line.split(',')
        # 给电话赋值
        phone=line[2]
        # 给身份证赋值
        id_num=line[3]
        # 添加到电话列表
        phone_list.append(phone)
        # 添加到身份证列表
        id_num_list.append(id_num)

    # 返回电话身份证列表
    return phone_list,id_num_list





student_data=register_api()
phone_list,id_num_list=load_validated(db_file)
commit_to_db(db_file,db_file)