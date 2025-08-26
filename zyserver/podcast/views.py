from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import get_user_model, authenticate
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated

from .models import Podcast, PlayHistory, Comment
from .serializers import (
    UserSerializer, LoginSerializer,
    PodcastSerializer, PlayHistorySerializer, CommentSerializer
)

User = get_user_model()


# 用户注册
class RegisterView(APIView):
    """注册视图"""
    def post(self, request):
        username = request.data.get('username')
        password = request.data.get('password')
        confirm_password = request.data.get('confirmPassword')

        if not all([username, password, confirm_password]):
            return Response({'msg': '用户名、密码不能为空'}, status=status.HTTP_400_BAD_REQUEST)
        if password != confirm_password:
            return Response({'msg': '两次密码不一致'}, status=status.HTTP_400_BAD_REQUEST)
        if User.objects.filter(username=username).exists():
            return Response({'msg': '用户名已存在'}, status=status.HTTP_400_BAD_REQUEST)

        user = User.objects.create_user(username=username, password=password)
        return Response({
            'msg': '注册成功',
            'code': 1,
            'result': {'id': user.id, 'username': user.username}
        }, status=status.HTTP_201_CREATED)


# 用户登录
class LoginView(APIView):
    """登录视图：返回JWT令牌"""
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        if not serializer.is_valid():
            return Response({'msg': '请输入用户名和密码'}, status=status.HTTP_400_BAD_REQUEST)

        user = authenticate(
            username=serializer.validated_data['username'],
            password=serializer.validated_data['password']
        )
        if not user:
            return Response({'msg': '用户名或密码错误'}, status=status.HTTP_401_UNAUTHORIZED)

        refresh = RefreshToken.for_user(user)
        return Response({
            'msg': '登录成功',
            'code': 1,
            'result': {
                'access': str(refresh.access_token),
                'refresh': str(refresh),
                'user': UserSerializer(user).data
            }
        })


# 用户退出
class LogoutView(APIView):
    """退出视图：将令牌加入黑名单"""
    def post(self, request):
        refresh_token = request.data.get('refresh')
        if not refresh_token:
            return Response({'msg': '缺少refresh令牌'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            token = RefreshToken(refresh_token)
            token.blacklist()
            return Response({'msg': '退出成功'})
        except Exception:
            return Response({'msg': '令牌无效'}, status=status.HTTP_400_BAD_REQUEST)


# 用户信息
class ProfileView(APIView):
    """获取用户信息"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [JWTAuthentication]

    def get(self, request):
        return Response({
            'code': 200,
            'msg': 'success',
            'data': UserSerializer(request.user).data
        })


# 播客列表
class PodcastListView(APIView):
    """播客列表"""
    def get(self, request):
        podcasts = Podcast.objects.all().order_by('-create_time')
        serializer = PodcastSerializer(podcasts, many=True)
        return Response({'code': 200, 'msg': 'success', 'data': serializer.data})


# 播客详情
class PodcastDetailView(APIView):
    """播客详情"""
    def get(self, request, pk):
        try:
            podcast = Podcast.objects.get(pk=pk)
        except Podcast.DoesNotExist:
            return Response({'msg': '播客不存在'}, status=status.HTTP_404_NOT_FOUND)

        serializer = PodcastSerializer(podcast)
        return Response({'code': 200, 'msg': 'success', 'data': serializer.data})


# 播放历史
class PlayHistoryView(APIView):
    """播放历史列表 & 新增"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [JWTAuthentication]

    def get(self, request):
        histories = PlayHistory.objects.filter(user=request.user)
        serializer = PlayHistorySerializer(histories, many=True)
        return Response({'code': 200, 'msg': 'success', 'data': serializer.data})

    def post(self, request):
        serializer = PlayHistorySerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(user=request.user)
            return Response({'msg': '播放历史已记录', 'data': serializer.data})
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# 评论
class CommentView(APIView):
    """评论列表 & 新增"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [JWTAuthentication]

    def get(self, request, podcast_id):
        comments = Comment.objects.filter(podcast_id=podcast_id)
        serializer = CommentSerializer(comments, many=True)
        return Response({'code': 200, 'msg': 'success', 'data': serializer.data})

    def post(self, request, podcast_id):
        serializer = CommentSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(user=request.user, podcast_id=podcast_id)
            return Response({'msg': '评论成功', 'data': serializer.data})
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
