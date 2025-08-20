from django.urls import path
from rest_framework_simplejwt.views import TokenRefreshView
from .views import LoginView, RegisterView, TestView

urlpatterns = [
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('test/', TestView.as_view(), name='test'),
    # path('logout/', LogoutView.as_view(), name='logout'),
    # path('token/refresh/', TokenRefreshView.as_view(), name='token-refresh'),  # 保留令牌刷新
]