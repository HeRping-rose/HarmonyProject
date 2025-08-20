from rest_framework import serializers
from .models import Order

class OrderSerializer(serializers.ModelSerializer):
    """订单序列化器：将Order模型实例转换为可传输的JSON数据"""
    # 自定义状态显示（将存储的数字转为文字描述，如 0→"待支付"）
    #当模型字段设置了 choices 后，Django 会自动为该模型实例添加一个固定格式的方法：
	#get_<字段名>_display()
	#对于 status 字段来说，就是 get_status_display()。
     #作用：
    #当你访问 order.status 时，得到的是存储在数据库中的「原始值」（如 0、1、2 等）。
    #当你访问 order.get_status_display() 时，得到的是 choices 中对应的「显示文本」（如 "待支付"、"已支付" 等）。
    status_text = serializers.CharField(source='get_status_display', read_only=True)
    
    class Meta:
        model = Order  # 关联订单模型
        # 需序列化的字段：包含自定义的status_text
        fields = ['id', 'order_number', 'user_name', 'product_name', 
                  'quantity', 'total_price', 'status', 'status_text', 'created_at']
        read_only_fields = ['id', 'created_at']  # id和创建时间为只读（自动生成）