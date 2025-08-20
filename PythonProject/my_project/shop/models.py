from django.db import models  as db

# Create your models here.
# 1. 店铺模型（基本信息）
class Shop(db.Model):
    name = db.CharField(max_length=50, verbose_name='店铺名称')
    logo = db.ImageField(upload_to='shop_logos/', null=True, blank=True, verbose_name='店铺logo')
    phone = db.CharField(max_length=20, verbose_name='联系电话')
    is_open = db.BooleanField(default=True, verbose_name='是否营业')

    class Meta:
        db_table = 'shop'
        verbose_name = '店铺'
        verbose_name_plural = '店铺'

    def __str__(self):
        # 关键：返回店铺名称，Admin 会用这个值显示关联对象
        return self.name  
    

# 2. 店铺详情模型（与Shop一对一关联）
class ShopDetail(db.Model):
    # 一对一关联：一个店铺只有一个详情，一个详情属于一个店铺OneToOneField()一对一关联
    shop = db.OneToOneField( 
        Shop, #要关联哪个模型 参数1
        on_delete=db.CASCADE,  # 店铺删除时，详情也删除
        related_name='detail',  # 允许通过 shop.detail 访问详情 关联名称
        verbose_name='关联店铺'
    )
    opening_hours = db.CharField(max_length=100, verbose_name='营业时间')  # 如："09:00-22:00"
    description = db.TextField(verbose_name='店铺简介')
    address = db.CharField(max_length=200, verbose_name='店铺地址')
    # 可添加更多详细字段：如特色标签、评分、注册资本等

    class Meta:
        db_table = 'shop_detail'
        verbose_name = '店铺详情'
        verbose_name_plural = '店铺详情'


class Goods(db.Model):
    shop = db.ForeignKey(
        Shop, 
        on_delete=db.CASCADE,  # 店铺删除时，旗下商品也删除
        related_name='goods',  # 允许通过 shop.goods 访问所有商品
        verbose_name='所属店铺',
        default=1  # 这里填写一个已存在的 Shop 的 id（例如 1）
    )
    name = db.CharField(max_length=20, verbose_name='名称')
    logo = db.ImageField(null=True,blank=True ,verbose_name='Logo图片')
    brand = db.CharField(max_length=20, verbose_name='品牌')
    sales = db.IntegerField(default=0, verbose_name='销量')
    stock = db.IntegerField(default=0, verbose_name='库存')
    comments = db.IntegerField(default=0, verbose_name='评价数')
    desc_detail = db.TextField(default='', verbose_name='详细介绍')
    price = db.DecimalField(max_digits=10, decimal_places=2,
                                verbose_name='单价')

    class Meta:
        db_table = 'goods'
        verbose_name = '商品'  #后台看到的名称
        verbose_name_plural = verbose_name


#python manage.py makemigrations
#python manage.py migrate