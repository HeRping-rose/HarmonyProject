from rest_framework.views import APIView
from rest_framework.response import Response
#from .models import Goods
#from .serializers import GoodsSerializer

class GoodsView(APIView):
    def get(self, request):
        return Response({
            "code": "1",
            "msg": "成功",
            "result": "临时测试"
        })