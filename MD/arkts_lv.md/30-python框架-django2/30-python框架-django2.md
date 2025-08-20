# 一、Django联表查询



 一对一：基础信息与详情信息（用户与用户详情）

models.OneToOneField()

一对多：店铺与商品、用户与评论

models.ForeignKey()

多对多：用户与群、作者与书籍

models.ManyToManyField()



```py
shop/models.py

from django.db import models as db

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
    # 一对一关联：一个店铺只有一个详情，一个详情属于一个店铺
    shop = db.OneToOneField(
        Shop, 
        on_delete=db.CASCADE,  # 店铺删除时，详情也删除
        related_name='detail',  # 允许通过 shop.detail 访问详情
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


# Create your models here.
class Goods(db.Model):
     # 一对多关联：一个店铺可拥有多个商品，一个商品只属于一个店铺
    shop = db.ForeignKey(
        Shop, 
        on_delete=db.CASCADE,  # 店铺删除时，旗下商品也删除
        related_name='goods',  # 允许通过 shop.goods 访问所有商品
        verbose_name='所属店铺',
        default=1  # 这里填写一个已存在的 Shop 的 id（例如 1）
    )
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


```

```py
shop/admin.py

from django.contrib import admin
from .models import Goods, Shop, ShopDetail

# 1. 商品模型 Admin 配置（已补充关联字段）
@admin.register(Goods)
class GoodsAdmin(admin.ModelAdmin):
    # 列表页显示字段（新增“所属店铺”关联字段）
    list_display = ('id', 'shop', 'name', 'brand', 'price', 'sales', 'stock')



# 2. 店铺详情 Admin 配置（嵌套在店铺编辑页）
class ShopDetailInline(admin.StackedInline):
    """在店铺编辑页直接编辑详情（一对一关联专用）"""
    model = ShopDetail
    extra = 0  # 不显示额外的空白编辑框（因一对一不允许重复）
    fieldsets = (
        ('店铺详情', {
            'fields': ('opening_hours', 'description', 'address')
        }),
    )


# 3. 店铺模型 Admin 配置（包含嵌套的详情编辑）
@admin.register(Shop)
class ShopAdmin(admin.ModelAdmin):
    # 列表页显示字段
    list_display = ('id', 'name', 'phone','is_open')
     # 详情页显示嵌套的店铺详情编辑
    inlines = [ShopDetailInline]  # 直接在店铺编辑页编辑详情

```

```py
shop/serializers.py

from rest_framework import serializers
from .models import Shop, ShopDetail, Goods

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
```

```py
shop/urls.py

from django.urls import path
from .views import GoodsView,ShopView

urlpatterns = [
    path('goods/', GoodsView.as_view(), name='goods'),
    path('shops/', ShopView.as_view(), name='shop-list'),
]
```

```py
shop/views.py 
#原有代码.....
from .models import Shop
from .serializers import ShopListSerializer, ShopDetailViewSerializer

#原有代码.....
class ShopView(APIView):
    def get(self, request):
        # 从查询参数中获取id和detail
        shop_id = request.query_params.get('id')
        detail_flag = request.query_params.get('detail', 'false').lower() == 'true'

        # 1. 查询单个店铺
        if shop_id:
            try:
                shop = Shop.objects.get(id=shop_id)
                # 根据detail参数选择序列化器
                if detail_flag:
                    # 返回包含详情和商品的完整信息
                    serializer = ShopDetailViewSerializer(shop)
                    return Response({
                        "code": 1,
                        "msg": "查询成功",
                        "result": serializer.data
                    })
                else:
                    # 只返回基本信息
                    serializer = ShopListSerializer(shop)
                    return Response({
                        "code": 1,
                        "msg": "查询成功",
                        "result": serializer.data
                    })
            except Shop.DoesNotExist:
                return Response({
                    "code": 404,
                    "msg": f"id为{shop_id}的店铺不存在",
                    "result": None
                })

        # 2. 查询所有店铺（默认只返回基本信息）
        else:
            shops = Shop.objects.all()
            serializer = ShopListSerializer(shops, many=True)  # many=True表示多个对象
            return Response({
                "code": 1,
                "msg": "查询成功",
                "result": serializer.data
            })

```



# 二、Django分页查询

### 一、创建应用并配置 settings

#### 1. 新建应用

在项目根目录执行命令创建 `order` 应用：

```bash
python manage.py startapp order
```

#### 2. settings.py 配置

在项目的 `settings.py` 中添加应用及 REST Framework 配置（分页核心依赖）：

```python
# settings.py

INSTALLED_APPS = [
    # ... 其他已有应用
    'rest_framework',  # 必须添加，分页依赖DRF
    'order',  # 注册订单应用
]

# DRF 全局配置（分页核心配置）
REST_FRAMEWORK = {
    # 默认分页类（全局生效，若视图单独指定则覆盖全局）
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    # 全局默认每页显示数量
    'PAGE_SIZE': 5,
}
```



### 二、核心文件实现（order 应用目录下）

#### 1. models.py（数据模型）

定义订单模型，包含基础订单字段，用于分页查询的数据来源：

```python
# order/models.py
from django.db import models

class Order(models.Model):
    """订单模型：用于分页查询练习的数据载体"""
    # 订单状态选项（元组形式：(存储值, 显示值)）
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
```

#### 2. serializers.py（序列化器）

将订单模型数据转换为 JSON 格式，用于 API 响应：

```python
# order/serializers.py
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
```

#### 3. pagination.py（分页配置类）

自定义分页规则，DRF 分页核心配置：

```python
# order/pagination.py
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response

class OrderPagination(PageNumberPagination):
    """订单分页类：自定义分页规则"""
    # 1. 每页默认显示数量（若全局设置了PAGE_SIZE，这里可覆盖）
    page_size = 5  # 优先级：视图中设置 > 此类page_size > 全局PAGE_SIZE
    
    # 2. 允许前端通过 query_param 参数动态指定每页数量（如 ?page_size=10）
    page_size_query_param = 'page_size'  # 前端参数名
    
    # 3. 限制前端最大每页数量（防止恶意请求大量数据）
    max_page_size = 20  # 前端最多只能请求20条/页
    
    # 4. 自定义分页响应格式（默认只返回count/next/previous/results，这里扩展更多信息）
    def get_paginated_response(self, data):
        return Response({
            'pagination': {
                'total': self.page.paginator.count,  # 总记录数
                'page_size': self.page_size,  # 当前页大小（可能是前端指定的）
                'total_pages': self.page.paginator.num_pages,  # 总页数
                'current_page': self.page.number,  # 当前页码
                'has_next': self.page.has_next(),  # 是否有下一页
                'has_previous': self.page.has_previous()  # 是否有上一页
            },
            'results': data  # 当前页的数据列表
        })
```

#### 4. views.py（视图：核心分页逻辑）

实现订单列表查询接口，应用分页功能：

```python
# order/views.py
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import Order
from .serializers import OrderSerializer
from .pagination import OrderPagination  # 导入自定义分页类

class OrderListView(APIView):
    """订单列表视图：实现分页查询核心逻辑"""
    
    def get(self, request):
        """
        GET 请求处理：返回分页后的订单列表
        前端可传参数：
            - page：页码（如 ?page=2 → 获取第2页数据）
            - page_size：每页数量（如 ?page=1&page_size=10 → 第1页，每页10条）
        """
        # 1. 查询所有订单（从数据库获取原始数据）
        order_queryset = Order.objects.all()  # 此处可添加过滤条件，如按状态筛选
        
        # 2. 初始化分页器
        paginator = OrderPagination()  # 使用自定义分页类
        
        # 3. 对查询集进行分页处理
        # paginate_queryset 方法会自动从 request 中获取 page/page_size 参数
        paginated_orders = paginator.paginate_queryset(order_queryset, request)
        
        # 4. 序列化分页后的数据（转换为JSON格式）
        serializer = OrderSerializer(paginated_orders, many=True)  # many=True 表示序列化多条数据
        
        # 5. 返回分页响应（使用分页器的get_paginated_response方法，返回自定义格式）
        return paginator.get_paginated_response(serializer.data)
```

#### 5. urls.py（路由配置）

配置接口访问路径：

```python
# order/urls.py
from django.urls import path
from .views import OrderListView

# 应用内路由（需在项目urls.py中注册）
urlpatterns = [
    path('orders/', OrderListView.as_view(), name='order-list'),
]
```

同时，需要在**项目的 urls.py** 中注册应用路由：

```python
# 项目/urls.py
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    # 注册订单应用路由（访问前缀为空，直接通过/orders/访问）
    path('order', include('order.urls')),
]
```

#### 6. admin.py（后台管理配置）

便于在后台添加测试数据，验证分页功能：

```python
# order/admin.py
from django.contrib import admin
from .models import Order

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    """订单后台管理配置：方便添加测试数据"""
    # 列表页显示字段（便于快速查看订单信息）
    list_display = ('id', 'order_number', 'user_name', 'product_name', 
                   'total_price', 'status', 'created_at')
```



#### 7. 测试分页接口

访问订单列表接口，通过参数控制分页：

- 基础分页：`http://localhost:8000/orders/`（默认第 1 页，5 条 / 页）
- 指定页码：`http://localhost:8000/orders/?page=2`（第 2 页）
- 自定义每页数量：`http://localhost:8000/orders/?page=1&page_size=10`（第 1 页，10 条 / 页）





# 三、身份验证系统

Django内置了一套身份验证系统，此系统提供了处理用户登录验证、权限验证、请求验证等一系列与身份验证相关的功能，且支持定制与扩展。开发人员在使用Django框架（开发）网站时，可以借助Django内置的身份验证系统便捷地实现用网站通用的、与用户相关的验证功能。本章将对Django身份验证系统相关的知识进行介绍。



## 1、User对象介绍

Django中的User对象通过User模型类创建，该类中内置了很多与用户信息相关字段。

| **字段**   | **说明**                                                     |
| ---------- | ------------------------------------------------------------ |
| username   | 必选，表示用户名，长度在150字符以内，可以由字母、数字和“_@+.-”字符组成 |
| password   | 必选，表示用户密码，长度无限制、可以由任意字符组成           |
| email      | 可选，表示用户的邮箱地址                                     |
| first_name | 可选，表示用户的名                                           |
| last_name  | 可选，表示用户的姓                                           |

| is_superuser | 可选，布尔值，如果值为True表示超级用户               |
| ------------ | ---------------------------------------------------- |
| is_active    | 可选，布尔值，如果值为True表示用户已激活             |
| is_staff     | 可选，布尔值，如果值为True表示该用户可以访问管理站点 |
| date_joined  | 可选，用户的创建日期时间，默认设置为当前日期时间     |
| last_login   | 可选，用户上次登录的日期时间                         |

默认情况下，通过User类创建的用户默认保存在数据表auth_user中。

![image-20250819005714295](.\img\image-20250819005714295.png)

超级用户的is_superuser与is_staff字段为1，普通用户的is_superuser与is_staff字段为0。



#### 1.1自定义用户模型

尽管Django内置的用户模型类中包含许多通用字段，但在实际开发项目时可能需要使用额外的用户字段，此时可以编写自定义代码，对内置用户模型类进行拓展。

```py
#自定义用户模型类需要继承django.contrib.auth.models模块中的抽象类AbstractUser，并在用户模型类中自定义额外的字段。

class User(AbstractUser):
    nickname = models.CharField(max_length=20, verbose_name='昵称')
    mobile = models.CharField(max_length=11, verbose_name='手机号码')    # 手机号码
    address = models.TextField(blank=False, verbose_name='地址') # 地址
    class Meta:
        db_table = 'tb_users'  	# 数据表名
        verbose_name = '用户'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.username

```

User模型定义完成之后，修改settings.py中的AUTH_USER_MODEL选项，使其指向自定义用户模型类以启用自定义User模型。

![image-20250819004742756](.\img\image-20250819004742756.png)

配置完成后使用“python manage.py makemigrations”命令生成迁移文件，使用“python manage.py migrate”命令执行迁移文件以生成（或更新）用户表。此时在数据库中查看数据表tb_users，可观察到其中包含了AbstractUser类中的所有字段以及自定义模型中的字段。



#### 1.2创建用户

User类提供了创建普通用户的方法create_user()和创建超级用户的方法create()_superuser()。

```py
#创建普通用户

# 导入User类
from django.contrib.auth.models import User  # 创建普通用户
ordinary_user= User.objects.create_user(
       'baron','baron@xx.com','baron123')
ordinary_user.save()
```

```py
#创建超级用户

# 导入User类
from django.contrib.auth.models import User  # 创建超级用户
super_user = User.objects.create_superuser(
        'john','john@xx.com','john123')
super_user.save()  

```

#### 1.3 修改密码

使用User对象的set_password()方法可以修改用户的密码。

```python
from django.contrib.auth.models import User
u = User.objects.get(username='john')
u.set_password('john4321')  		# 设置新密码
u.save()     
```

#### 1.4 验证用户

Django可以使用authenticate()函数来验证用户，该函数通过参数username和password分别接收用户名和密码。如果用户名和密码正确，验证成功，返回一个User对象；否则后端引发PermissionDenied错误，并返回None。

```py
class LoginView(View):
    def post(self, request):
        username = request.POST.get("username")
        password = request.POST.get('passwrod')
        user = authenticate(username=username, password=password)
        if user is not None:
            return HttpResponse("登录成功")
        return HttpResponse("登录失败")

```



## 2、用户应用实操

#### 一、创建应用并安装依赖

1. 创建应用：

```bash
python manage.py startapp user
```

​	2.安装所需依赖：

djangorestframework    pillow

```bash
pip install  djangorestframework-simplejwt 

```



#### 二、核心配置（settings.py）

在项目的 `settings.py` 中添加以下配置：

```py
# 添加应用
INSTALLED_APPS = [
    # ... 其他已有应用
    'rest_framework',
    'rest_framework_simplejwt',
    'user',  # 注册用户应用
]

# 配置自定义用户模型（关键！必须在第一次迁移前设置）
AUTH_USER_MODEL = 'user.User'

# REST Framework 配置
REST_FRAMEWORK = {
    # 默认认证方式为JWT
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    ),
}

# JWT 配置
from datetime import timedelta
SIMPLE_JWT = {
    # 访问令牌有效期（1小时）
    'ACCESS_TOKEN_LIFETIME': timedelta(hours=1),
    # 刷新令牌有效期（7天）
    'REFRESH_TOKEN_LIFETIME': timedelta(days=7),
    # 令牌前缀
    'AUTH_HEADER_TYPES': ('Bearer',),
}


```

#### 三、用户模型（models.py）

自定义用户模型，扩展 Django 自带的用户模型：

```py
from django.db import models
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

```

#### 四、序列化器（serializers.py）

处理用户数据的序列化与验证：

```py
from rest_framework import serializers
from django.contrib.auth import get_user_model

User = get_user_model()

class UserSerializer(serializers.ModelSerializer):
    """简化的用户序列化器：只做数据转换，不包含验证逻辑"""
    class Meta:
        model = User
        fields = ('id', 'username', 'password', 'email', 'phone', 'nickname', 'avatar')
        extra_kwargs = {'password': {'write_only': True}}  # 密码仅写入


class LoginSerializer(serializers.Serializer):
    """登录序列化器：只定义输入字段"""
    username = serializers.CharField()
    password = serializers.CharField(write_only=True)
```

#### 五、视图（views.py）

实现注册、登录、退出功能：

```py
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import get_user_model, authenticate
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import UserSerializer, LoginSerializer

User = get_user_model()

class RegisterView(APIView):
    """注册视图：所有逻辑在视图中处理"""
    def post(self, request):
        # 获取并验证数据
        username = request.data.get('username')
        password = request.data.get('password')
        password2 = request.data.get('password2')

        # 简单验证
        if not all([username, password, password2]):
            return Response({'msg': '用户名、密码不能为空'}, status=status.HTTP_400_BAD_REQUEST)
        if password != password2:
            return Response({'msg': '两次密码不一致'}, status=status.HTTP_400_BAD_REQUEST)
        if User.objects.filter(username=username).exists():
            return Response({'msg': '用户名已存在'}, status=status.HTTP_400_BAD_REQUEST)

        # 创建用户
        user = User.objects.create_user(
            username=username,
            password=password,
            email=request.data.get('email', ''),
            phone=request.data.get('phone', ''),
            nickname=request.data.get('nickname', '')
        )
        return Response({'msg': '注册成功', 'user_id': user.id}, status=status.HTTP_201_CREATED)


class LoginView(APIView):
    """登录视图：返回JWT令牌"""
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        if not serializer.is_valid():
            return Response({'msg': '请输入用户名和密码'}, status=status.HTTP_400_BAD_REQUEST)

        # 验证用户
        user = authenticate(
            username=serializer.validated_data['username'],
            password=serializer.validated_data['password']
        )
        if not user:
            return Response({'msg': '用户名或密码错误'}, status=status.HTTP_401_UNAUTHORIZED)

        # 生成令牌
        refresh = RefreshToken.for_user(user)
        return Response({
            'msg': '登录成功',
            'access': str(refresh.access_token),
            'refresh': str(refresh),
            'user': UserSerializer(user).data
        })


class LogoutView(APIView):
    """退出视图：将令牌加入黑名单"""
    def post(self, request):
        refresh_token = request.data.get('refresh')
        if not refresh_token:
            return Response({'msg': '缺少refresh令牌'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            token = RefreshToken(refresh_token)
            token.blacklist()  # 加入黑名单
            return Response({'msg': '退出成功'})
        except Exception:
            return Response({'msg': '令牌无效'}, status=status.HTTP_400_BAD_REQUEST)
```

#### 六、路由配置（urls.py）

配置用户相关接口的 URL：

```
# user/urls.py
from django.urls import path
from rest_framework_simplejwt.views import TokenRefreshView
from .views import RegisterView, LoginView, LogoutView

urlpatterns = [
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token-refresh'),  # 保留令牌刷新
]
```

同时，需要在**项目的 urls.py** 中注册用户应用的路由：

```
# 项目/urls.py
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    # 注册用户应用路由，访问前缀为/api/user/
    path('user/', include('user.urls')),
]

```

#### 七、Admin 配置（admin.py）

在后台管理自定义用户模型：

```py
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
```



#### 八、JWT 验证

在 Django 中验证 JWT 是否生效，最简洁的方式是使用 **DRF 的装饰器** 或 **权限类**，其中装饰器更符合 “在方法上加验证” 的需求，且实现简单。

示例（在其他应用的视图中使用）：

```py
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework_simplejwt.authentication import JWTAuthentication  # 导入JWT认证类

class ShopView(APIView):
    # 类视图中通过 authentication_classes 定义认证方式（核心）
    authentication_classes = [JWTAuthentication]  # 身份验证类

    def get(self, request):
        # 验证通过后，request.user 就是当前登录用户
        return Response({
            'msg': '店铺接口访问成功',
            'current_user': request.user.username,  # 可获取当前登录用户的用户名
            'shop_data': '这里是店铺数据...'
        })
```

**是否通过用户认证**

from rest_framework.permissions import IsAuthenticated #是否通过用户认证

authentication_classes = [JWTAuthentication]指定接口的认证方式，验证 JWT 令牌



**作用**：
为当前接口指定 “认证类”，这里指定的 `JWTAuthentication` 是专门用于验证 JWT令牌的认证类。

- 当请求访问该接口时，DRF 会自动调用 `JWTAuthentication` 的逻辑，检查请求头中是否携带有效的 JWT 令牌（格式：`Authorization: Bearer <token>`）。
- 验证逻辑包括：检查令牌格式是否正确、签名是否有效、是否过期等。
- 验证通过后：会自动将令牌中包含的用户信息绑定到 `request.user`（即当前登录用户），后续视图中可直接通过 `request.user` 获取用户数据。
- 验证失败（如令牌无效、过期、未携带令牌）：会直接返回 401 错误（未认证），阻止请求访问接口。
