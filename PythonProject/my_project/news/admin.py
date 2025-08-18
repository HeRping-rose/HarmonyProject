from django.contrib import admin
from .models import News   # 导入你的News模型

# Register your models here.


# 自定义News模型的Admin配置类
@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    # 列表页显示的字段
    list_display = ('id', 'title','content','created_at')
