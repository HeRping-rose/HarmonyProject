from django.contrib import admin

# Register your models here.
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User

class CustomUserAdmin(UserAdmin):
    """自定义用户Admin配置，显示扩展字段"""
    # 列表页显示的字段
    list_display = ('id', 'username', 'email', 'phone', 'nickname', 
                   'is_active', 'is_staff', 'date_joined')
    
    

# 注册自定义用户模型和Admin配置
admin.site.register(User, CustomUserAdmin)