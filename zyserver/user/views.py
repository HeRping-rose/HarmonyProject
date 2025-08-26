import token
from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import get_user_model, authenticate
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import UserSerializer, LoginSerializer
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated #是否通过用户认证


User = get_user_model()

# 测试如果前端在访问是没有携带token就不让访问 没有权限
class TestView(APIView):
    # 如果前端在不携带token就 没有权限 访问 该接口类
    permission_classes = [IsAuthenticated] #用于验证前端有没有发来token 如果有但是不是被串改或者过期

    authentication_classes = [JWTAuthentication] #从token解析出用户身份 --xxx->username
    def get(self, request):

# 如果正常传入了token 上面用了JWTAuthentication解析出用户身份 这个解析出的用户名会被存储在request.user中
        if request.user.is_authenticated: #判断用户是否通过认证  is_authenticated是bool值
            print(request.user) #打印用户名username
        # return Response({'msg': '测试成功'})
        return Response({'info': '123141423521'})


class RegisterView(APIView):
    """注册视图：所有逻辑在视图中处理"""
    def post(self, request):
        # 获取并验证数据
        username = request.data.get('username')
        password = request.data.get('password')
        password2 = request.data.get('confirmPassword')

        # 简单验证
        if not all([username, password, password2]):
            return Response({'msg': '用户名、密码不能为空'}, status=status.HTTP_400_BAD_REQUEST)
        if password != password2:
            return Response({'msg': '两次密码不一致'}, status=status.HTTP_400_BAD_REQUEST)
        if User.objects.filter(username=username).exists():
            return Response({'msg': '用户名已存在'}, status=status.HTTP_400_BAD_REQUEST)

        # 创建用户
        user = User.objects.create_user(
            username=username,
            password=password,
            # email=request.data.get('email', ''),
            # phone=request.data.get('phone', ''),
            # nickname=request.data.get('nickname', '')
        )
        return Response({
            'msg': '注册成功',
            'code':1,
            'result':{
                'id':user.id,
            }
        }, status=status.HTTP_201_CREATED)


class LoginView(APIView):
    """登录视图：返回JWT令牌"""
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        if not serializer.is_valid():
            return Response({'msg': '请输入用户名和密码'}, status=status.HTTP_400_BAD_REQUEST)

        # 验证用户
        user = authenticate(
            username=serializer.validated_data['username'],
            password=serializer.validated_data['password']
        )
        if not user:
            return Response({'msg': '用户名或密码错误'}, status=status.HTTP_401_UNAUTHORIZED)

        # 生成令牌   jwt  json web token  为了某个user生成的令牌
        token = RefreshToken.for_user(user)
        return Response({
            'msg': '登录成功',
            # 'access': str(refresh.access_token),
            # 'refresh': str(refresh),
            # 'user': UserSerializer(user).data
            'code': 1,
            'result':{
                'token':str(token.access_token),
                'username':user.username,
                'phone':user.phone
            }
        })


# class LogoutView(APIView):
#     """退出视图：将令牌加入黑名单"""
#     def post(self, request):
#         refresh_token = request.data.get('refresh')
#         if not refresh_token:
#             return Response({'msg': '缺少refresh令牌'}, status=status.HTTP_400_BAD_REQUEST)

#         try:
#             token = RefreshToken(refresh_token)
#             token.blacklist()  # 加入黑名单
#             return Response({'msg': '退出成功'})
#         except Exception:
#             return Response({'msg': '令牌无效'}, status=status.HTTP_400_BAD_REQUEST)