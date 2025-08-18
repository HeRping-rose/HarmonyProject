from rest_framework.views import APIView
from rest_framework.response import Response
from .models import News
from .serializers import NewsSerializer

class NewsListView(APIView):
    """新闻列表API视图，返回符合指定格式的新闻数据"""
    
    def get(self, request):
        # 从数据库获取所有新闻
        news_list = News.objects.all()
        
        # 序列化数据
        serializer = NewsSerializer(news_list, many=True)
        
        # 按指定格式返回响应
        return Response({
            "code": "1",
            "msg": "成功",
            "result": serializer.data
        })

