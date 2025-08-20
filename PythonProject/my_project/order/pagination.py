from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response

class OrderPagination(PageNumberPagination):
    """订单分页类：自定义分页规则"""
    # 1. 每页默认显示数量（若全局设置了PAGE_SIZE，这里可覆盖）
    page_size = 4  # 优先级：视图中设置 > 此类page_size > 全局PAGE_SIZE
    
    # 2. 允许前端通过 query_param 参数动态指定每页数量（如 ?page_size=10）
    page_size_query_param = 'page_size'  # 前端参数名
    
    # 3. 限制前端最大每页数量（防止恶意请求大量数据）
    max_page_size = 20  # 前端最多只能请求20条/页
    
    # 4. 自定义分页响应格式（默认只返回count/next/previous/results，这里扩展更多信息）
    def get_paginated_response(self, data):
        return Response({
            'pagination': {
                'total': self.page.paginator.count,  # 总记录数
                'page_size': self.page_size,  # 当前页大小（可能是前端指定的）
                'total_pages': self.page.paginator.num_pages,  # 总页数
                'current_page': self.page.number,  # 当前页码
                'has_next': self.page.has_next(),  # 是否有下一页
                'has_previous': self.page.has_previous()  # 是否有上一页
            },
            'results': data  # 当前页的数据列表
        })