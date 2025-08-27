# zhiyin_backend/urls.py
# from django.contrib import admin
from django.urls import path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from podcast import views

urlpatterns = [
    # path('admin/', admin.site.urls),

    # 用户
    path('user/register/', views.RegisterView.as_view(), name='register'),
    path('user/login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('user/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('user/profile/', views.ProfileView.as_view()),

    # 播
    path('podcast/list/', views.PodcastListView.as_view()),
    path('podcast/detail/<int:pk>/', views.PodcastDetailView.as_view()),

    # 播
    path('play/history/', views.PlayHistoryView.as_view()),

    # 评
    path('comment/list/<int:podcast_id>/', views.CommentView.as_view()),
    path('comment/add/<int:podcast_id>/', views.CommentView.as_view()),
]