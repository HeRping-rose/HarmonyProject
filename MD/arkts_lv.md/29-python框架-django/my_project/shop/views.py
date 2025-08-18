from rest_framework.views import APIView
from rest_framework.response import Response
from .models import Goods
from .serializers import GoodsSerializer

class GoodsView(APIView):
    """
    商品接口视图类 \n
    - GET：如果请求带id查询参数，则返回单个商品；否则返回所有商品
    - POST：创建新商品
    - PUT：更新商品（需带id查询参数）
    - DELETE：删除商品（需带id查询参数）
    """
    
    def get(self, request):
        """查询商品：单个或所有"""
        # 从查询参数中获取id（前端请求格式：/goods/?id=1）
        goods_id = request.query_params.get('id')
        print(goods_id)
        if goods_id:
            # 查询单个商品
            try:
                goods = Goods.objects.get(id=goods_id)
                serializer = GoodsSerializer(goods)
                return Response({
                    "code": 1,
                    "msg": "查询成功",
                    "result": [serializer.data]
                })
            except Goods.DoesNotExist:
                return Response({
                    "code": 0,
                    "msg": f"id为{goods_id}的商品不存在",
                    "result": None
                }, status=404)
        else:
            # 查询所有商品
            goods_list = Goods.objects.all()
            serializer = GoodsSerializer(goods_list, many=True)
            return Response({
                "code": 1,
                "msg": "查询成功",
                "result": serializer.data
            })
    
    def post(self, request):
        """创建新商品"""
        serializer = GoodsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                "code": 1,
                "msg": "商品创建成功",
                "result": serializer.data
            }, status=201)
        return Response({
            "code": 0,
            "msg": "商品创建失败",
            "result": serializer.errors
        }, status=400)
    
    def put(self, request):
        """更新商品（需提供id查询参数）"""
        goods_id = request.query_params.get('id')
        if not goods_id:
            return Response({
                "code": 0,
                "msg": "请提供商品id（格式：/goods/?id=1）",
                "result": None
            }, status=400)
        
        try:
            goods = Goods.objects.get(id=goods_id)
        except Goods.DoesNotExist:
            return Response({
                "code": 0,
                "msg": f"id为{goods_id}的商品不存在",
                "result": None
            }, status=404)
        
        serializer = GoodsSerializer(goods, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                "code": 1,
                "msg": "商品更新成功",
                "result": serializer.data
            })
        return Response({
            "code": 0,
            "msg": "商品更新失败",
            "result": serializer.errors
        }, status=400)
    
    def delete(self, request):
        """删除商品（需提供id查询参数）"""
        goods_id = request.query_params.get('id')
        if not goods_id:
            return Response({
                "code": 0,
                "msg": "请提供商品id（格式：/goods/?id=1）",
                "result": None
            }, status=400)
        
        try:
            goods = Goods.objects.get(id=goods_id)
            goods.delete()
            return Response({
                "code": 1,
                "msg": f"id为{goods_id}的商品删除成功",
                "result": None
            })
        except Goods.DoesNotExist:
            return Response({
                "code": 0,
                "msg": f"id为{goods_id}的商品不存在",
                "result": None
            }, status=404)
    