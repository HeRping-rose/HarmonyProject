from django.contrib import admin

from .models import Goods  # 导入你的goods模型

@admin.register(Goods)
class GoodsAdmin(admin.ModelAdmin):
    # 列表页显示的字段
    list_display = ('id', 'name', 'brand', 'sales',"price")