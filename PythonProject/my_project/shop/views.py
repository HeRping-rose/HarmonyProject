from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import Goods
from .serializers import GoodsSerializer

from .models import Shop
from .serializers import ShopListSerializer, ShopDetailViewSerializer

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
                goods = Goods.objects.get(id=goods_id)  #根据id进行查询
                serializer = GoodsSerializer(goods)   #序列化商品数据 一条  不需要many=True
                # 返回
                return Response({
                    "code": 1,
                    "msg": "查询成功",
                    "result": serializer.data  # 返回单个商品的序列化数据加中括号视为了返回一个数组,请求返回的参数就是[]
                    #如果这里不添加中括号，返回的就是一个对象，而不是数组 那么前端请求api时候需要进行处理请求返回的数据类型使用联合类型
                    #并且接收的时候需要判断返回数据并处理
                })
            except Goods.DoesNotExist:
                return Response({
                    "code": 0,
                    "msg": f"id为{goods_id}的商品不存在",
                    "result": None
                }, status=404)
        else:
            # 查询所有商品
            # goods_list = Goods.objects.all()  
            #filter()使用  过滤返回
            goods_list = Goods.objects.filter(brand__contains='book')
            serializer = GoodsSerializer(goods_list, many=True)
            return Response({
                "code": 1,
                "msg": "查询成功",
                "result": serializer.data
            })
    
    def post(self, request):
        """创建新商品"""
        #request.data是前端以Post方式提交的数据{name:xxx,price:xxx...}
        # 收到request.data 把他存到数据库的表中 问题:收到的是一个字典 但数据表的每一行是一个对象
        # 先把字典转化为对象才可以存 GoodsSerializer序列化器 即负责对象转字典 还负责字典转对象
        serializer = GoodsSerializer(data=request.data) #序列化请求数据
        if serializer.is_valid(): #验证数据
            serializer.save() #保存数据
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

        serializer = GoodsSerializer(goods, data=request.data) #序列化请求数据覆盖
        if serializer.is_valid():
            serializer.save()
            return Response({
                "code": 1,
                "msg": "商品更新成功",
                # "result": serializer.data
                "result":{"id":serializer.data["id"]}
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
            id=goods.id
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
                # "result": None
                "result":{"id":goods_id}
            })
        except Goods.DoesNotExist:
            return Response({
                "code": 0,
                "msg": f"id为{goods_id}的商品不存在",
                "result": None
            }, status=404)
        

    def patch(self, request):
        goods_id = request.query_params.get('id')
        try:
            goods = Goods.objects.get(id=goods_id)
        except Goods.DoesNotExist:
            return JsonResponse({"code": 404, "msg": "商品不存在", "result": None})
        
        # partial=True 允许部分更新（无需传递所有字段）
        serializer = GoodsSerializer(goods, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()  # 只更新传递的字段，未传递的字段保持原样
            return JsonResponse({"code": 1, "msg": "更新成功", "result": serializer.data})
        return JsonResponse({"code": 0, "msg": "更新失败", "result": serializer.errors})
    


class ShopView(APIView):
    def get(self, request):
        # 从查询参数中获取id和detail
        shop_id = request.query_params.get('id')
        detail_flag = request.query_params.get('detail', 'false').lower() == 'true'

        # 1. 查询单个店铺
        if shop_id:
            try:
                shop = Shop.objects.get(id=shop_id)
                # 根据detail参数选择序列化器
                if detail_flag:
                    # 返回包含详情和商品的完整信息
                    serializer = ShopDetailViewSerializer(shop)
                    return Response({
                        "code": 1,
                        "msg": "查询成功",
                        "result": serializer.data
                    })
                else:
                    # 只返回基本信息
                    serializer = ShopListSerializer(shop)
                    return Response({
                        "code": 1,
                        "msg": "查询成功",
                        "result": serializer.data
                    })
            except Shop.DoesNotExist:
                return Response({
                    "code": 404,
                    "msg": f"id为{shop_id}的店铺不存在",
                    "result": None
                })

        # 2. 查询所有店铺（默认只返回基本信息）
        else:
            shops = Shop.objects.all()
            serializer = ShopListSerializer(shops, many=True)  # many=True表示多个对象
            return Response({
                "code": 1,
                "msg": "查询成功",
                "result": serializer.data
            })
