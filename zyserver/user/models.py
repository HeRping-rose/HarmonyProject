from django.db import models

# Create your models here.
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    """
    自定义用户模型：继承Django自带的AbstractUser
    扩展了电话、昵称、头像字段
    """
    # 手机号码（唯一）
    phone = models.CharField(
        max_length=11, 
        blank=True, 
        null=True, 
        unique=True, 
        verbose_name='手机号码'
    )
    # 昵称
    nickname = models.CharField(
        max_length=50, 
        blank=True, 
        null=True, 
        verbose_name='昵称'
    )
    # 头像（上传到media/avatars/目录）
    avatar = models.ImageField(
        blank=True, 
        null=True, 
        verbose_name='头像'
    )

    class Meta:
        db_table = 'user'  # 数据库表名
        verbose_name = '用户'
        verbose_name_plural = '用户'

    def __str__(self):
        # 显示用户名，便于在Admin中识别
        return self.username
