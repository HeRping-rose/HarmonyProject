from django.urls import path
from .views import OrderListView

# 应用内路由（需在项目urls.py中注册）
urlpatterns = [
    path('orders/', OrderListView.as_view(), name='order-list'),
]