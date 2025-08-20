from rest_framework import serializers
from django.contrib.auth import get_user_model


User = get_user_model()

# 常规用户序列化器
class UserSerializer(serializers.ModelSerializer):
    """简化的用户序列化器：只做数据转换，不包含验证逻辑"""
    class Meta:
        model = User
        fields = ('id', 'username', 'password', 'email', 'phone', 'nickname', 'avatar')
        extra_kwargs = {'password': {'write_only': True}}  # 密码仅写入
# 额外的参数配置 配置一下密码 只写不可读 ,再给前端返回数据时不返回密码


# 登录序列化器
class LoginSerializer(serializers.Serializer):
    """登录序列化器：只定义输入字段"""
    username = serializers.CharField()
    password = serializers.CharField(write_only=True)
    # 在收到前端发来的一个字典 对于这个字典去做一下验证
    # username= serializers.CharField() 我必须收到一个叫username的字段并且他的值是一个短文本类型
    # password = serializers.CharField(write_only=True) 我必须收到一个叫password的字段并且他的值是一个短文本类型
    # 并且前端可以给传密码 但服务器不会返回这个字段(密码)