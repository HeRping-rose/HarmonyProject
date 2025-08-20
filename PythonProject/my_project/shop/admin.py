from django.contrib import admin
from .models import Goods, Shop, ShopDetail  # 导入你的goods模型

# Register your models here.


@admin.register(Goods)
class GoodsAdmin(admin.ModelAdmin):
    # 列表页显示的字段
    list_display = ('id', 'name', 'brand', 'sales',"price")


# 2. 店铺详情 Admin 配置（嵌套在店铺编辑页）
class ShopDetailInline(admin.StackedInline):
    """在店铺编辑页直接编辑详情（一对一关联专用）"""
    model = ShopDetail
    extra = 0  # 不显示额外的空白编辑框（因一对一不允许重复）
    fieldsets = (
        ('店铺详情', {
            'fields': ('opening_hours', 'description', 'address')
        }),
    )


# 3. 店铺模型 Admin 配置（包含嵌套的详情编辑）
@admin.register(Shop)
class ShopAdmin(admin.ModelAdmin):
    # 列表页显示字段
    list_display = ('id', 'name', 'phone','is_open')
     # 详情页显示嵌套的店铺详情编辑
    inlines = [ShopDetailInline]  # 直接在店铺编辑页编辑详情