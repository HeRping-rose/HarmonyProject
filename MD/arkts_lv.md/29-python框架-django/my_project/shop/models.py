from django.db import models as db

# Create your models here.
class Goods(db.Model):
    name = db.CharField(max_length=20, verbose_name='名称')
    logo = db.ImageField(verbose_name='Logo图片')
    brand = db.CharField(max_length=20, verbose_name='品牌')
    sales = db.IntegerField(default=0, verbose_name='销量')
    stock = db.IntegerField(default=0, verbose_name='库存')
    comments = db.IntegerField(default=0, verbose_name='评价数')
    desc_detail = db.TextField(default='', verbose_name='详细介绍')
    price = db.DecimalField(max_digits=10, decimal_places=2,
                                verbose_name='单价')

    class Meta:
        db_table = 'goods'
        verbose_name = '商品'
        verbose_name_plural = verbose_name

