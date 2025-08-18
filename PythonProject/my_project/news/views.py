# from django.http import HttpResponse,JsonResponse
# from django.shortcuts import render

# Create your views here.  视图创建

# def news_list(request):
#     # return HttpResponse("hello djan23432geo1")
#     return JsonResponse({
#         "code":"1",     
#         "msg":"成功",
#         "result":[
#             {"id":1,"title":"123123","content":"2345234"},
#             {"id":2,"title":"retert","content":"erterter"}
#         ]
#     })


from rest_framework.views import APIView
from rest_framework.response import Response
from .models import News
from .serializers import NewsSerializer

class NewsListView(APIView):
    """新闻列表API视图，返回符合指定格式的新闻数据"""
    
    def get(self, request):
        # 从数据库获取所有新闻
        news_list = News.objects.all()
        # 返回:[Object,Object.....]
        
        # 序列化数据 ：将数据库中的数据转换成字典格式的数据
        serializer = NewsSerializer(news_list, many=True)  #many=ture 多行 一定要带 循环
        
        # 按指定格式返回响应 返回字符串
        return Response({
            "code": "1",
            "msg": "成功",
            "result": serializer.data
        })
    def post(self, request):
        pass
    def put(self, request):
        pass
    def delete(self, request):
        pass