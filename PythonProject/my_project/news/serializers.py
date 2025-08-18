from rest_framework import serializers
from .models import News
# serializers.py  新闻数据序列化器

class NewsSerializer(serializers.ModelSerializer):
    """新闻数据序列化器，用于模型实例与JSON数据的转换"""
    class Meta:
        model = News  #序列化哪个模型
        fields = ['id', 'title', 'content']  # 只序列化需要返回的字段
        #fields = '__all__'   #all代表要取出表中所有字段，序列化后返回