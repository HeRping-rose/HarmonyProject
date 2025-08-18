from django.urls import path
from . import views
from .views import NewsListView
# urlpatterns=[
#     # 二级路由配置
#     path('news_list/',views.news_list,name='news_list')
# ]


#由于采用了restful的请求方式，把调用的函数视图换成类视图
urlpatterns = [
    #as_view 自动展开去识别是什么请求
    path('news_list/', NewsListView.as_view(), name='news-list'),
]