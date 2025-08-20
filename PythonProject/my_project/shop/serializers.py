from rest_framework import serializers
from .models import Goods, Shop, ShopDetail

class GoodsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Goods
        fields = '__all__'   #all代表要取出表中所有字段，序列化后返回

# 店铺详情序列化器（一对一关联）
class ShopDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShopDetail
        fields = '__all__'


# 店铺基本信息序列化器（用于列表查询）
class ShopListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shop
        fields = '__all__'


# 店铺详细信息序列化器（包含详情和商品，用于单个查询）
class ShopDetailViewSerializer(serializers.ModelSerializer):
    # 嵌套店铺详情（一对一）
    detail = ShopDetailSerializer(read_only=True)
    # 嵌套店铺商品（一对多）
    goods = GoodsSerializer(many=True, read_only=True)  # many=True表示多个商品

    class Meta:
        model = Shop
        fields = '__all__'