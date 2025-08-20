from django.contrib import admin

# Register your models here.
from .models import Order

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    """订单后台管理配置：方便添加测试数据"""
    # 列表页显示字段（便于快速查看订单信息）
    list_display = ('id', 'order_number', 'user_name', 'product_name', 
                   'total_price', 'status', 'created_at')