from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import Order
from .serializers import OrderSerializer
from .pagination import OrderPagination  # 导入自定义分页类

class OrderListView(APIView):
    """订单列表视图：实现分页查询核心逻辑"""
    
    def get(self, request):
        """
        GET 请求处理：返回分页后的订单列表
        前端可传参数：
            - page：页码（如 ?page=2 → 获取第2页数据）
            - page_size：每页数量（如 ?page=1&page_size=10 → 第1页，每页10条）
        """
        # 1. 查询所有订单（从数据库获取原始数据）
        order_queryset = Order.objects.all()  # 此处可添加过滤条件，如按状态筛选

        # 2. 初始化分页器  实例化一个分页器对象
        paginator = OrderPagination()  # 使用自定义分页类
        
        # 3. 对查询集进行分页处理
        # paginate_queryset 方法会自动从 request 中获取 page/page_size 参数
        paginated_orders = paginator.paginate_queryset(order_queryset, request)
        
        # 4. 序列化分页后的数据（转换为JSON格式）
        serializer = OrderSerializer(paginated_orders, many=True)  # many=True 表示序列化多条数据
        
        # 5. 返回分页响应（使用分页器的get_paginated_response方法，返回自定义格式）
        return paginator.get_paginated_response(serializer.data)