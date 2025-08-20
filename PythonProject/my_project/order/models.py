from django.db import models

# Create your models here.

class Order(models.Model):
    """订单模型：用于分页查询练习的数据载体"""
    # 订单状态选项（元组形式：(存储值, 显示值)） 枚举
    STATUS_CHOICES = (
        (0, '待支付'),
        (1, '已支付'),
        (2, '已发货'),
        (3, '已完成'),
        (4, '已取消'),
    )
    
    order_number = models.CharField(max_length=32, unique=True, verbose_name='订单编号')
    user_name = models.CharField(max_length=50, verbose_name='用户名')
    product_name = models.CharField(max_length=100, verbose_name='商品名称')
    quantity = models.IntegerField(default=1, verbose_name='购买数量')
    total_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='订单总价')
    status = models.SmallIntegerField(choices=STATUS_CHOICES, default=0, verbose_name='订单状态')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')  # 自动记录创建时间
    
    class Meta:
        db_table = 'order'  # 数据库表名
        verbose_name = '订单'
        verbose_name_plural = '订单'
        ordering = ['-created_at']  # 默认按创建时间降序（最新订单在前）
    
    def __str__(self):
        return f"订单 {self.order_number}（{self.user_name}）"