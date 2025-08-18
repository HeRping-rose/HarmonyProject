from rest_framework import serializers
from .models import Goods

class GoodsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Goods
        fields = '__all__'   #all代表要取出表中所有字段，序列化后返回

