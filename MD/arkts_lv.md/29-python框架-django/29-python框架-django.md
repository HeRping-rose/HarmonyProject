# 一、Django介绍

Python Web 框架 Django是一个高级 Python Web 框架，旨在帮助开发者快速构建安全、可扩展的 Web 应用程序。它采用 MVT（Model-View-Template）架构模式，提供了一套完整的工具和组件，无需开发者从零开始搭建基础功能。

### 1、**Django 的核心功能**

1. **ORM（对象关系映射）系统**
   无需编写原始 SQL 语句，通过 Python 类（模型，Model）即可定义数据库结构，自动实现与数据库的交互。支持多种数据库（MySQL、PostgreSQL、SQLite 等），开发者可专注于业务逻辑而非数据库操作。
2. **Admin 后台管理系统**
   自动生成强大的后台管理界面，只需简单配置模型，即可实现数据的增删改查、权限控制等功能。支持自定义界面布局、筛选条件和操作按钮，极大简化后台管理开发。
3. **模板引擎（Template）**
   提供灵活的模板系统，支持模板继承、变量渲染、条件判断和循环等功能，实现前后端分离开发，同时保持代码复用性。
4. **URL 路由系统**
   通过简洁的 URL 配置，将请求映射到对应的视图函数或类，支持正则表达式匹配，便于构建清晰、可维护的 URL 结构。
5. **表单处理**
   内置表单验证机制，自动处理数据校验、错误提示和 HTML 表单生成，简化用户输入处理流程。
6. **认证与权限系统**
   提供完整的用户认证（登录、注册、密码重置）和权限管理功能，支持角色划分、权限粒度控制，保障应用安全。
7. **安全特性**
   内置防御常见 Web 攻击的机制，如 CSRF（跨站请求伪造）、XSS（跨站脚本）、SQL 注入等，自动处理会话管理和密码加密。
8. **缓存系统**
   支持多种缓存后端（如内存、文件、Redis 等），可轻松配置缓存策略，提升应用性能。
9. **国际化与本地化**
   内置多语言支持，可通过配置实现内容的国际化翻译和本地化适配（如时间、日期格式）。

### 2、**作为后台服务器的优势**

1. **开发效率极高**
   “电池已包含” 的设计减少了重复开发工作，Admin 后台、ORM 等功能可直接复用，大幅缩短开发周期，适合快速迭代的项目。
2. **安全性强**
   内置的安全机制从底层规避常见风险，开发者无需手动处理复杂的安全细节，降低安全漏洞概率。
3. **可扩展性好**
   支持通过中间件、信号机制、第三方插件（如 Django REST framework 用于构建 API）扩展功能，能适应从小型应用到大型系统的需求。
4. **生态丰富**
   拥有庞大的社区和丰富的第三方库，可快速集成支付、认证、搜索等功能（如 Django-allauth 处理社交登录，Celery 处理异步任务）。
5. **易于维护**
   严格的代码规范和架构设计（如 MVT 分离）使项目结构清晰，便于团队协作和后期维护。
6. **适合构建 API 后端**
   结合 Django REST framework，可快速开发 RESTful API，支持序列化、认证、分页等功能，是构建前后端分离应用的理想选择。

总之，Django 适合需要快速开发、注重安全性和可维护性的 Web 应用，无论是内容管理系统（CMS）、电商平台、后台 API 服务还是企业级应用，都能高效支撑。



# 二、Django初始化项目

#### 1、安装django

要使用django后端开发框架，先安装

```
pip install django -i https://pypi.tuna.tsinghua.edu.cn/simple
```

#### 2、创建新的项目   

```
django-admin startproject my_project
```

进入项目文件夹

```
cd my_project
```

#### 3、创建应用

一个项目可以包含多个应用，每个应用可以看成是项目中不同的功能模块，如 新闻、商品、订单、用户等。

```python
#python manage.py startapp user
python manage.py startapp news
```

#### 4、添加应用到项目

在my_project全局settings.py文件安装应用

```py
INSTALLED_APPS = [ 
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    "news"
]
```

 添加应用的具体作用
（1）数据库迁移（Migrations）
Django 通过 INSTALLED_APPS 确定哪些应用的模型需要创建数据库表。
若不注册应用，执行 python manage.py migrate 时不会为该应用创建表。
（2）模板和静态文件查找
Django 在 INSTALLED_APPS 中按顺序查找模板和静态文件。
例如，当使用 render(request, 'index.html') 时，Django 会在所有已注册应用的 templates/ 目录下查找模板。
（3）信号（Signals）和应用初始化
应用的 ready() 方法（在 apps.py 中定义）会在应用加载时执行，用于注册信号等初始化操作。
若不注册应用，这些初始化逻辑不会被触发。
（4）管理界面（Admin）
注册应用后，其模型才能在 Django 管理界面中显示和操作。
（5）中间件和 URL 路由
虽然中间件和 URL 配置不直接依赖 INSTALLED_APPS，但应用的组件（如视图）需要被框架识别。

#### 5、启动项目

```
python manage.py runserver
```



#### 6、配置路由

为保证项目结构清晰，开发人员通常在Django项目的每个应用下创建urls.py文件，在其中为每个应用配置子URL。路由系统接收到HTTP请求后，先根据请求的URL地址匹配根URLconf，找到匹配的子应用，再进一步匹配子URLconf，直到匹配完成。

![image-20250817173705951](.\img\image-20250817173705951.png)

##### 1.配置全局路由

在my_project/my_project/urls.py中是全局路由配置，在这里加入应用的路由

```python
from django.contrib import admin  
from django.urls import include, path  
  
urlpatterns = [  
    path('admin/', admin.site.urls),  
    path('news/', include('news.urls')),  
]
```

##### 2.配置应用路由

在news应用中创建一个urls.py文件，配置二级路由

```python
from django.urls import path
from . import views

urlpatterns = [
    path('news_list/', views.news_list, name='news_list')
]
```

##### 3.创建视图

```py
from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def news_list(request):
    return HttpResponse("hello django")
```

在浏览器中尝试接口是否可用

```
http://127.0.0.1:8000/news/news_list/
```



# 三、Django跨域

### 0.鸿蒙demo准备

创建一个用于接口测试的鸿蒙新项目

```ts
utils/RequestRcp.ets

import { rcp } from '@kit.RemoteCommunicationKit'
import { promptAction } from '@kit.ArkUI'

class GlobalVariable {
  static readonly TIME_OUT: number = 60000 // 超时时间

  static readonly BASE_URL: string = "http://192.168.0.103:8000" // 网络请求基础地址
  static readonly SUCCESS_CODE: string = "1" // 成功标识
}
interface ResponseData<T> {
  code:string,
  msg:string,
  result:T
}

class myInterceptor implements rcp.Interceptor {
  async intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
     //请求时做一个拦截： 格式化参数
     // context.request.content  =  {__ob_keyword:"貌似zi",xxx:xxxx}
    // if(typeof context.request.content == 'object'){
    //   context.request.content = JSON.parse(JSON.stringify(context.request.content).replace(/__ob_/g,""))
    // }
     let res = await next.handle(context)
     return res
  }
}

//创建rcp会话实例
let instance = rcp.createSession({
  baseAddress:GlobalVariable.BASE_URL,  //配置基础网址
  interceptors:[new myInterceptor()],  //拦截器
  requestConfiguration:{
    transfer:{
      timeout:{
         connectMs:GlobalVariable.TIME_OUT,  //最大连接时间
         transferMs:GlobalVariable.TIME_OUT,  //传输超时
         inactivityMs:GlobalVariable.TIME_OUT  //会话超时
      }
    }
  }
})

//封装请求类
export class RequestRcp<T> {

  //get请求
  // 发请求 需要指定两种类型，在请求中携带数据 需要类型
  // 接收数据 也需要指定类型 ， <T> 用于接收 响应数据类型
  //
  static get<T>(url:string,params?:object): Promise<T>{
    // https://meikou-api.itheima.net/home/banner?id=1&name=asd
    return RequestRcp.toRightData<T>(instance.get(url + RequestRcp.objectToQuery(params)))
  }
  static post<T>(url:string,data?:object): Promise<T>{
    return RequestRcp.toRightData<T>(instance.post(url,data))
  }
  static delete<T>(url: string, params?: object, data?: object): Promise<T> {
    const req = new rcp.Request(url+ RequestRcp.objectToQuery(params),"DELETE",{},data)
    return RequestRcp.toRightData<T>(instance.fetch(req))
    // return RequestRcp.toRightData<T>(instance.delete(url + RequestRcp.objectToQuery(params)),data)
  }
  static put<T>(url: string, data?: object): Promise<T> {
    return RequestRcp.toRightData<T>(instance.put(url,data))
  }
  static patch<T>(url: string, data?: object) {}
  static upload<T>() {}
  static download<T>() {}

  //当请求发出了，给我们返回一个响应的结果，但是这个结果包含了很多信息，我们要挑出body响应体中的信息
  static async toRightData<T>(res:Promise<rcp.Response>){
     // console.log(JSON.stringify(await res))
     let obj = await res  //当前得到的这个obj 是包含了所有响应信息的对象

     let result = obj.toJSON() as ResponseData<T>  //从原始响应中 挑出了 服务器实际响应的数据

    //如果响应的状态码为1 就是成功的
     if(result.code == GlobalVariable.SUCCESS_CODE){
       return result.result
     }
     promptAction.openToast({message:result.msg})
     //如果报错了，就返回一个错误对象，其中包含的信息是服务器响应的说明
     return Promise.reject(new Error(result.msg))
  }
  //实现一个方法 用于 get请求中的 查询字符串的拼接
  static objectToQuery(params?:object){
    if(params){
      return "?" + Object.keys(params).map(i=> `${i}=${params[i]}`).join("&")
      // 原 {id:1,name:"asd"}  要 ?id=1&name=asd
      //  Object.keys(params)  ["id","name"]
      // Object.keys(params).map(i=> `${i}=${params[i]}`)  ["id=1","name='asd'"]
      //Object.keys(params).map(i=> `${i}=${params[i]}`).join("&")  id=1&name='asd'
    }
    //如果没有传入params 就不需要拼接了
    return ""
  }
}

```

```ts
api/index.ets

import { RequestRcp } from "../utils/RequestRcp"

interface NewsList {
  id:number,
  title:string,
  content:string
}

//请求猜你喜欢
export const getNewsListAPI = ()=>{
  return RequestRcp.get<NewsList[]>("/news/news_list/")
}

```



```ts
pages/index.ets

import { getNewsListAPI } from '../api'
import { JSON } from '@kit.ArkTS'

@Entry
@ComponentV2
struct  Index{

  aboutToAppear(): void {
    this.getData()
  }

  async getData(){
    try {
      let res = await getNewsListAPI()
      console.log(JSON.stringify(res))
    }catch (e) {
      console.log(JSON.stringify(e))
    }

  }

  build() {
    Column(){
      Text("12")
    }
  }
}
```



后端修正成符合要求的接口返回值

```py
news/views.py

from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse,JsonResponse

# Create your views here.
def news_list(request):
    # return HttpResponse("hello djan23432geo1")
    return JsonResponse({
        "code":"1",     
        "msg":"成功",
        "result":[
            {"id":1,"title":"123123","content":"2345234"},
            {"id":2,"title":"retert","content":"erterter"}
        ]
    })

```



前后端分离架构中需要处理 “跨域” 问题，核心原因与浏览器的 **“同源策略”（Same-Origin Policy）** 密切相关。我们可以从以下几个层面理解：

### 1. 什么是 “同源”？

浏览器定义的 “同源” 是指两个 URL 的 **协议、域名、端口** 三者完全一致。例如：

- `http://localhost:3000`（前端页面）和 `http://localhost:8000`（后端接口）—— 端口不同，**不同源**；
- `https://www.example.com`（前端）和 `http://www.example.com`（后端）—— 协议不同，**不同源**；
- `https://a.example.com`（前端）和 `https://b.example.com`（后端）—— 域名不同，**不同源**。

### 2. 同源策略：浏览器的安全防线

同源策略是浏览器的核心安全机制，目的是 **防止恶意网站窃取其他网站的数据**。它限制了 “不同源” 的脚本（如前端的 JavaScript）对另一个源的资源（如后端接口返回的数据）进行读写操作。

例如：如果没有同源策略，黑客可以在自己的网站中嵌入一段脚本，伪装成用户向银行网站发送请求，窃取用户的账户信息 —— 这显然是危险的。

### 3. 为什么需要 “允许跨域”？

前后端分离的核心是分工协作：前端专注于用户体验，后端专注于数据处理。为了让它们能正常通信（前端获取后端数据），就必须 **“突破” 浏览器的同源策略限制**，即通过技术手段告诉浏览器：“这个跨域请求是安全的，允许通过”。

常见的解决方案是后端配置 **CORS（跨域资源共享）**，通过在响应头中添加 `Access-Control-Allow-Origin` 等字段，明确允许指定的前端源访问接口。

### 4.django跨域配置

##### 1.安装跨域插件

```
pip install django-cors-headers
```

##### 2.配置跨域

```py
my_project/settings.py

# 跨域配置
INSTALLED_APPS = [
    # ... 其他应用
    'corsheaders',  # 跨域请求头处理
    # ... 你的应用
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',  # 必须放在第一个中间件位置
    'django.middleware.common.CommonMiddleware',  # 原有中间件
    # ... 其他中间件
]

# CORS 配置
CORS_ALLOW_ALL_ORIGINS = True  # 允许所有域名进行跨域调用
CORS_ALLOW_CREDENTIALS = True  # 允许携带凭证（如 cookies）
CORS_ALLOW_METHODS = (  # 允许的请求方法
    'DELETE',
    'GET',
    'OPTIONS',
    'PATCH',
    'POST',
    'PUT',
)
CORS_ALLOW_HEADERS = (  # 允许的请求头
    'accept',
    'accept-encoding',
    'authorization',
    'content-type',
    'dnt',
    'origin',
    'user-agent',
    'x-csrftoken',
    'x-requested-with',
)
```

##### 3.适配鸿蒙模拟器

由于鸿蒙模拟器是在电脑上运行的虚拟器，不在本地环境中，所以还需要额外配置，让虚拟器也可以访问到本机的服务器接口。

1.在命令行中输入ipconfig获取本机ip,并配置到鸿蒙全局ip地址

```py
utils/RequestRcp.ets

class GlobalVariable {
  static readonly TIME_OUT: number = 60000 // 超时时间

  static readonly BASE_URL: string = "http://192.168.0.103:8000" // 网络请求基础地址
  static readonly SUCCESS_CODE: string = "1" // 成功标识
}
```

2.启动服务器时监听局域网地址

Django 服务器默认只监听 `127.0.0.1`（仅本机可访问），必须修改为监听所有地址（`0.0.0.0`），允许局域网内的设备访问：

```
# 错误方式（仅本机可访问）
python manage.py runserver 8000

# 正确方式（允许局域网访问）
python manage.py runserver 0.0.0.0:8000   # 关键：0.0.0.0表示开放所有IP地址
```

3.修改允许访问主机的ip

```py
my_project/settings.py

ALLOWED_HOSTS = ['192.168.0.103', 'localhost', '127.0.0.1']
```



# 四、Django-restful

RESTful 是一种设计网络 API（应用程序编程接口）的架构风格，核心是遵循 HTTP 协议的设计原则，通过统一的规范实现客户端与服务器之间的交互。它并非严格的标准，而是一组指导思想，旨在让 API 更简洁、易理解、可扩展。



### 1.创建数据模型

数据模型会与数据库表生成映射关系，操作模型就是在操作数据表（避免了直接操作原生sql语句）

```py
news/models.py

from django.db import models

class News(models.Model):
    """新闻数据模型"""
    title = models.CharField(max_length=200, verbose_name="标题")
    content = models.TextField(verbose_name="内容")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = "新闻"
        verbose_name_plural = "新闻"
        ordering = ['-created_at']  # 按创建时间倒序排列

    def __str__(self):
        return self.title

```



#### 常用字段类型及用途

| 字段类型      | 用途说明                                                     | 主要参数（特有）                                             |
| ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| AutoField     | 自动增长的整数型字段，通常用作主键                           | primary_key=True（设置为模型主键）                           |
| BigAutoField  | 类似 AutoField，但支持更大的整数范围（适用于数据量极大的场景） | primary_key=True（设置为模型主键）                           |
| CharField     | 字符串字段（适用于短文本，如标题、名称）                     | max_length（字符串最大长度，必填）                           |
| TextField     | 大文本字段（适用于长文本，如文章内容、备注）                 | 无特有参数                                                   |
| IntegerField  | 整数字段（适用于存储整数，如数量、年龄）                     | default（默认值）                                            |
| FloatField    | 浮点数字段（适用于存储小数，精度要求不高的场景）             | default（默认值）                                            |
| DecimalField  | 定点数字段（适用于高精度小数，如金额、重量）                 | max_digits（总位数）、decimal_places（小数位数）、default（默认值） |
| BooleanField  | 布尔值字段（存储 True/False，适用于状态标记）                | default（默认值）                                            |
| DateField     | 日期字段（仅存储年 / 月 / 日）                               | auto_now（每次保存自动更新为当前日期）、auto_now_add（创建时自动设为当前日期）、default（默认值） |
| DateTimeField | 日期时间字段（存储年 / 月 / 日 / 时 / 分 / 秒）              | auto_now（每次保存自动更新为当前时间）、auto_now_add（创建时自动设为当前时间）、default（默认值） |
| EmailField    | 电子邮件字段（带格式验证的字符串）                           | max_length（最大长度）、default（默认值）                    |
| FileField     | 文件上传字段（存储文件路径）                                 | upload_to（上传路径）、max_length（文件路径最大长度）、default（默认值） |
| ImageField    | 图片上传字段（带格式验证的文件字段）                         | upload_to（上传路径）、height_field（自动保存图片高度）、width_field（自动保存图片宽度）、max_length（路径最大长度） |

#### 字段类型特有参数说明

| 字段类型      | 特有参数       | 参数说明                                                     |
| ------------- | -------------- | ------------------------------------------------------------ |
| AutoField     | primary_key    | 设为 True 时，该字段作为模型主键（Django 默认会自动添加主键，通常无需手动设置） |
| BigAutoField  | primary_key    | 同 AutoField，仅支持更大整数范围                             |
| CharField     | max_length     | 字符串的最大长度（数据库层面限制，必填）                     |
| DecimalField  | max_digits     | 数字的总位数（包括整数和小数部分）                           |
| DecimalField  | decimal_places | 小数点后的固定位数                                           |
| DateField     | auto_now       | 每次调用 save () 时，自动更新为当前日期（如 “最后修改日期”） |
| DateField     | auto_now_add   | 首次创建对象时，自动设为当前日期（如 “创建日期”）            |
| DateTimeField | auto_now       | 每次调用 save () 时，自动更新为当前日期时间                  |
| DateTimeField | auto_now_add   | 首次创建对象时，自动设为当前日期时间                         |
| FileField     | upload_to      | 指定文件上传的存储路径（可动态生成，如`'files/%Y/%m/'`按日期分类） |
| ImageField    | height_field   | 若指定，会自动将图片高度保存到该字段（需模型中额外定义整数字段） |
| ImageField    | width_field    | 若指定，会自动将图片宽度保存到该字段（需模型中额外定义整数字段） |

#### 通用字段参数说明

| 通用参数         | 说明                                                         |
| ---------------- | ------------------------------------------------------------ |
| null             | 数据库层面：设为 True 时，允许字段存储 NULL 值（默认为 False） |
| blank            | 表单验证层面：设为 True 时，表单允许该字段为空（默认为 False，与 null 独立） |
| choices          | 提供可选值（如`[(1, '男'), (2, '女')]`），表单会显示为下拉框 |
| db_column        | 指定该字段在数据库中的列名（默认使用字段名）                 |
| db_index         | 设为 True 时，数据库会为该字段创建索引（提升查询速度）       |
| db_tablespace    | 指定字段的数据库表空间（仅部分数据库支持，如 PostgreSQL）    |
| default          | 字段的默认值（可是值或可调用对象，如`timezone.now`）         |
| editable         | 设为 False 时，字段不会在 Admin 后台或表单中显示（默认为 True） |
| error_messages   | 自定义验证错误消息（如`{'required': '此字段不能为空'}`）     |
| help_text        | 在 Admin 或表单中显示的帮助文本（如`'请输入正确的邮箱格式'`） |
| primary_key      | 设为 True 时，该字段作为模型主键（一个模型只能有一个主键）   |
| unique           | 设为 True 时，字段值在数据库中必须唯一（如 “用户名” 不可重复） |
| unique_for_date  | 与 DateField/DateTimeField 配合，确保该字段在指定日期内唯一  |
| unique_for_month | 与 DateField/DateTimeField 配合，确保该字段在指定月份内唯一  |
| unique_for_year  | 与 DateField/DateTimeField 配合，确保该字段在指定年份内唯一  |
| verbose_name     | 字段的友好名称（如`verbose_name='用户年龄'`，Admin 中会显示该名称） |

#### `Meta`元属性说明

以下是 Django 模型中常用的`Meta`元属性表格，用于定义模型的元数据（如表名、排序、显示名称等）：

| 属性名                 | 用途说明                                                     |
| ---------------------- | ------------------------------------------------------------ |
| `db_table`             | 指定模型对应的数据库表名。若不设置，Django 默认使用 “应用名_模型类名小写” 作为表名。 |
| `ordering`             | 设置模型查询结果的默认排序方式，值为字段名列表（如`['-pub_date', 'title']`，`-`表示降序）。 |
| `verbose_name`         | 模型的单数显示名称（用于 Admin 界面等），如`verbose_name = "新闻"`。 |
| `verbose_name_plural`  | 模型的复数显示名称（默认在`verbose_name`后加`s`），如`verbose_name_plural = "新闻"`。 |
| `indexes`              | 定义模型的数据库索引列表，如`indexes = [models.Index(fields=['title'])]`。 |
| `unique_together`      | 定义联合唯一约束（多个字段组合的值必须唯一），如`unique_together = [['title', 'pub_date']]`（Django 2.2 + 推荐用`constraints`替代）。 |
| `constraints`          | 定义数据库约束列表（如唯一约束、检查约束等），如`constraints = [models.UniqueConstraint(fields=['title', 'pub_date'], name='unique_title_date')]`。 |
| `abstract`             | 若为`True`，则该模型为抽象基类（不会创建数据库表，仅用于被其他模型继承）。 |
| `managed`              | 若为`False`，Django 不会自动管理该模型的数据库表（不创建、不删除表），适用于映射已存在的表。 |
| `default_related_name` | 定义反向关联的默认名称，如`default_related_name = "news_comments"`，避免反向关联名称冲突。 |
| `permissions`          | 定义额外的权限，如`permissions = [("can_publish", "Can publish news")]`，用于权限控制。 |
| `app_label`            | 若模型不在应用的`models.py`中，需指定所属应用，如`app_label = "myapp"`。 |

这些元属性通过在模型内部定义`class Meta:`类来配置，用于定制模型的数据库行为和显示方式。



#### 1.1.配置数据库

1.在mysql中先创建一个名为mydatabase库

```
create database mydatabase;
```

2.在my_project全局settings.py文件中配置数据库

```py
DATABASES = {
     'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mydatabase',
        'USER': 'root',
        'PASSWORD': 'root',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}
```

#### 1.2.数据库迁移

数据模型会与数据库表生成映射关系，映射分为两步：生成迁移文件和执行迁移文件。

生成迁移文件:生成迁移文件是通过ORM框架生成执行数据库操作所需的SQL语句。

执行迁移文件:执行迁移文件则是执行迁移文件中的SQL语句。

1.生成迁移文件

```
python manage.py makemigrations
```

执行生成迁移的命令后，应用的migrations目录下会自动创建一个名为“0001_initial.py”的文件，该文件包含生成的数据表的代码。

2.执行迁移文件

```
python manage.py migrate
```

迁移文件生成之后，使用执行迁移文件命令生成对应的数据表。



### 2.创建序列化器

```py
news/serializers.py

from rest_framework import serializers
from .models import News

class NewsSerializer(serializers.ModelSerializer):
    """新闻数据序列化器，用于模型实例与JSON数据的转换"""
    class Meta:
        model = News
        fields = ['id', 'title', 'content']  # 只序列化需要返回的字段
        #fields = '__all__'   #all代表要取出表中所有字段，序列化后返回
```

### 3.实现restful请求

1. 安装 Django REST Framework：

```bash
pip install djangorestframework
```

​	2.在my_project全局settings.py文件安装应用

```py
INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    'corsheaders',  # 跨域请求头处理
    'rest_framework',
    "news"
]
```

​	3.创建类视图

```py
news/views.py

from rest_framework.views import APIView
from rest_framework.response import Response
from .models import News
from .serializers import NewsSerializer

class NewsListView(APIView):
    """新闻列表API视图，返回符合指定格式的新闻数据"""
    
    def get(self, request):
        # 从数据库获取所有新闻
        news_list = News.objects.all()
        
        # 序列化数据
        serializer = NewsSerializer(news_list, many=True)
        
        # 按指定格式返回响应
        return Response({
            "code": "1",
            "msg": "成功",
            "result": serializer.data
        })
```

### 4.调整路由

由于采用了restful的请求方式，把调用的函数视图换成类视图

```py
news/urls.py

from django.urls import path
from .views import NewsListView

urlpatterns = [
    path('news_list/', NewsListView.as_view(), name='news-list'),
]
```

### 5.admin后台管理

1.访问 Admin 后台

`http://192.168.0.103:8000/admin/`，使用超级用户登录。

2.确保你已经创建了超级用户（如果没有，执行`python manage.py createsuperuser`并按提示创建）。

3.配置news数据模型的后台管理

```py
news/admin.py

from django.contrib import admin
from .models import News  # 导入你的News模型

# 自定义News模型的Admin配置类
@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    # 列表页显示的字段
    list_display = ('id', 'title', 'content', 'created_at')
    
    # 可搜索的字段
    search_fields = ('title', 'content')
    
    # 过滤条件（右侧过滤栏）
    list_filter = ('created_at',)
    
    # 排序方式（默认按创建时间降序）
    ordering = ('-created_at',)
    
    # 列表页可直接编辑的字段
    list_editable = ('title',)
    
    # 详情页字段分组显示
    fieldsets = (
        ('基本信息', {
            'fields': ('title', 'content')
        }),
        ('时间信息', {
            'fields': ('created_at'),
            'classes': ('collapse',)  # 默认折叠该分组
        }),
    )
    
    # 只读字段（不允许编辑）
    readonly_fields = ('created_at')
    
```



# 五、数据表操作

### 0.复习应用编写流程

##### 1、创建应用

一个项目可以包含多个应用，每个应用可以看成是项目中不同的功能模块，如 新闻、商品、订单、用户等。

```python
python manage.py startapp shop
```

##### 2、添加应用到项目

在my_project全局settings.py文件安装应用

```py
INSTALLED_APPS = [ 
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    "shop",
    "news"
]
```

##### 3、配置路由

在my_project/urls.py中是全局路由配置，在这里加入应用的路由

```python
from django.contrib import admin  
from django.urls import include, path  
  
urlpatterns = [  
    path('admin/', admin.site.urls),  
    path('news/', include('news.urls')),
    path('shop/', include('shop.urls')),
]
```

##### 4.配置应用路由

在shop应用中创建一个urls.py文件，配置二级路由

```python
from django.urls import path
from .views import GoodsView

urlpatterns = [
    path('goods/', GoodsView.as_view(), name='goods')
]
```

##### 5.创建视图

```python
shop/views.py

from rest_framework.views import APIView
from rest_framework.response import Response
#from .models import Goods
#from .serializers import GoodsSerializer

class GoodsView(APIView):
    def get(self, request):
        return Response({
            "code": "1",
            "msg": "成功",
            "result": "临时测试"
        })
```

在浏览器中尝试接口是否可用

```
http://127.0.0.1:8000/shop/goods/
```

##### 6.创建数据模型

数据模型会与数据库表生成映射关系

```py
goods/models.py

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

```

##### 7.数据库迁移

1.生成迁移文件

```
python manage.py makemigrations
```

2.执行迁移文件

```py
python manage.py migrate
```

##### 8.创建序列化器

```py
goods/serializers.py

from rest_framework import serializers
from .models import Goods

class GoodsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Goods
        fields = '__all__'   #all代表要取出表中所有字段，序列化后返回
```

##### 9.后台管理

```python
goods/admin.py

from django.contrib import admin
from .models import Goods  # 导入你的goods模型

@admin.register(Goods)
class GoodsAdmin(admin.ModelAdmin):
    # 列表页显示的字段
    list_display = ('id', 'name', 'brand', 'sales',"price")
```

​    
##### 10.调整图片路径

在my_project全局settings.py中设置

```python
#媒体文件（用户上传的文件）的根目录
#图片会实际存储在：项目根目录/media/
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
```

```python
# 媒体文件的访问URL前缀（浏览器通过此URL访问上传的图片）
# 例如：http://127.0.0.1:8000/media/uploads/xxx.jpg
MEDIA_URL = '/media/'
```

在my_project/urls.py中是全局路由配置

```python
#开发环境中，需要手动配置路由才能通过 URL 访问上传的图片（生产环境通常由 Nginx 等服务器处理）：
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    # 你的其他路由...
]

# 开发环境下，让Django处理媒体文件的访问
if settings.DEBUG:  # 仅在调试模式下生效
    urlpatterns += static(
        settings.MEDIA_URL,
        document_root=settings.MEDIA_ROOT
    )
```



### 1.Manager管理器

Manager管理器是Django模型进行数据库查询操作的接口，每个模型都拥有至少一个管理器。

默认情况下，Django 为每个模型类添加一个名为 objects 的管理器

Django模型提供了丰富的数据库操作功能，如添加数据、查询数据、更新数据和删除数据。



##### 1.查询数据

Django的对象管理器提供了四个查询数据的方法：all()、filter()、exclude()和get()。

![image-20250818015711157](.\img\image-20250818015711157.png)

常见的运算符

| **参数**         | **说明**                             |
| ---------------- | ------------------------------------ |
| gt、gte、lt、lte | 分别表示“>”、“>=”、“<”、“<=”         |
| in               | 判断字段值是否存在于一个可迭代列表中 |
| range            | 判断字段值是否在指定的区间中         |
| exact            | 判断字段值是否精确相等               |
| iexact           | 判断字段值是否精确相等，忽略大小写   |
| contains         | 字段值的模糊匹配                     |

| **参数**    | **说明**                      |
| ----------- | ----------------------------- |
| icontains   | 字段值的模糊匹配，忽略大写    |
| startswith  | 判断字段值以…开头             |
| istartswith | 判断字段值以…开头，忽略大小写 |
| endswith    | 判断字段值以…结尾             |
| iendswith   | 判断字段值以…结尾，忽略大小写 |

##### 2.添加数据

save()方法

save()方法是模型对象的方法，模型实例可调用该方法将数据添加到数据库中，其语法格式如下

```py
save(force_insert=False, force_update=False, using=None,update_fields=None)
```

- force_insert：表示强制执行插入语句，不可与force_update同时使用。
- force_update：表示强制执行更新语句，不可与force_insert同时使用。
- using：用于将数据保存到指定的数据库。
- update_fields：用于指定更新的字段，其余的字段不更新。



##### 3.删除数据

delete()方法

删除数据使用对象的delete()方法，对应SQL中的删除操作，此方法会立即删除数据库中的记录，并返回删除记录的数量。



##### 4.更新数据

update()/save()

是对象管理器的方法，用于根据查询条件更新数据表的指定字段，并返回生效的行数。



### 2.商品增删改查示例

```python
goods/views.py

from rest_framework.views import APIView
from rest_framework.response import Response
from .models import Goods
from .serializers import GoodsSerializer

class GoodsView(APIView):
    """
    商品接口视图类 \n
    - GET：如果请求带id查询参数，则返回单个商品；否则返回所有商品
    - POST：创建新商品
    - PUT：更新商品（需带id查询参数）
    - DELETE：删除商品（需带id查询参数）
    """
    
    def get(self, request):
        """查询商品：单个或所有"""
        # 从查询参数中获取id（前端请求格式：/goods/?id=1）
        goods_id = request.query_params.get('id')
        print(goods_id)
        if goods_id:
            # 查询单个商品
            try:
                goods = Goods.objects.get(id=goods_id)
                serializer = GoodsSerializer(goods)
                return Response({
                    "code": 1,
                    "msg": "查询成功",
                    "result": [serializer.data]
                })
            except Goods.DoesNotExist:
                return Response({
                    "code": 0,
                    "msg": f"id为{goods_id}的商品不存在",
                    "result": None
                }, status=404)
        else:
            # 查询所有商品
            goods_list = Goods.objects.all()
            serializer = GoodsSerializer(goods_list, many=True)
            return Response({
                "code": 1,
                "msg": "查询成功",
                "result": serializer.data
            })
    
    def post(self, request):
        """创建新商品"""
        serializer = GoodsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                "code": 1,
                "msg": "商品创建成功",
                "result": serializer.data
            }, status=201)
        return Response({
            "code": 0,
            "msg": "商品创建失败",
            "result": serializer.errors
        }, status=400)
    
    def put(self, request):
        """更新商品（需提供id查询参数）"""
        goods_id = request.query_params.get('id')
        if not goods_id:
            return Response({
                "code": 0,
                "msg": "请提供商品id（格式：/goods/?id=1）",
                "result": None
            }, status=400)
        
        try:
            goods = Goods.objects.get(id=goods_id)
        except Goods.DoesNotExist:
            return Response({
                "code": 0,
                "msg": f"id为{goods_id}的商品不存在",
                "result": None
            }, status=404)
        
        serializer = GoodsSerializer(goods, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                "code": 1,
                "msg": "商品更新成功",
                "result": serializer.data
            })
        return Response({
            "code": 0,
            "msg": "商品更新失败",
            "result": serializer.errors
        }, status=400)
    
    def delete(self, request):
        """删除商品（需提供id查询参数）"""
        goods_id = request.query_params.get('id')
        if not goods_id:
            return Response({
                "code": 0,
                "msg": "请提供商品id（格式：/goods/?id=1）",
                "result": None
            }, status=400)
        
        try:
            goods = Goods.objects.get(id=goods_id)
            goods.delete()
            return Response({
                "code": 1,
                "msg": f"id为{goods_id}的商品删除成功",
                "result": None
            })
        except Goods.DoesNotExist:
            return Response({
                "code": 0,
                "msg": f"id为{goods_id}的商品不存在",
                "result": None
            }, status=404)
    
```

以下是使用 `filter()` 结合 Django ORM 常见运算符的示例

```python
# 查询所有商品（原all()方法，作为对比）
goods_list = Goods.objects.all()

# 1. 等于（exact）：查询品牌为"苹果"的商品（exact可省略，直接写=）
goods_list = Goods.objects.filter(brand__exact="苹果")  # 等价于 brand="苹果"

# 2. 不等于（exclude 或 ne）：查询品牌不是"三星"的商品
goods_list = Goods.objects.filter(brand__ne="三星")
# 另一种方式：exclude() 排除符合条件的记录
goods_list = Goods.objects.exclude(brand="三星")

# 3. 模糊匹配（contains）：查询名称包含"手机"的商品（区分大小写）
goods_list = Goods.objects.filter(name__contains="手机")

# 4. 不区分大小写的模糊匹配（icontains）：查询名称包含"电脑"的商品（忽略大小写）
goods_list = Goods.objects.filter(name__icontains="电脑")

# 5. 以指定字符开头（startswith）：查询品牌以"华为"开头的商品
goods_list = Goods.objects.filter(brand__startswith="华为")

# 6. 以指定字符结尾（endswith）：查询名称以"Pro"结尾的商品
goods_list = Goods.objects.filter(name__endswith="Pro")

# 7. 大于（gt）：查询价格大于1000的商品
goods_list = Goods.objects.filter(price__gt=1000)

# 8. 大于等于（gte）：查询库存大于等于10的商品
goods_list = Goods.objects.filter(stock__gte=10)

# 9. 小于（lt）：查询销量小于50的商品
goods_list = Goods.objects.filter(sales__lt=50)

# 10. 小于等于（lte）：查询评价数小于等于100的商品
goods_list = Goods.objects.filter(comments__lte=100)

# 11. 在指定范围内（in）：查询品牌为"苹果"、"华为"、"小米"的商品
goods_list = Goods.objects.filter(brand__in=["苹果", "华为", "小米"])

# 12. 不在指定范围内（notin）：查询价格不在[500, 1000]区间的商品
goods_list = Goods.objects.filter(price__notin=[500, 1000])

# 13. 为空（isnull）：查询没有详细介绍（desc_detail为空）的商品
goods_list = Goods.objects.filter(desc_detail__isnull=True)

# 14. 不为空（isnull=False）：查询有Logo图片的商品（logo字段不为空）
goods_list = Goods.objects.filter(logo__isnull=False)

# 15. 区间查询（range）：查询价格在500到2000之间的商品（包含边界）
goods_list = Goods.objects.filter(price__range=(500, 2000))
```



**对于 `PUT` 方法**：默认需要传递**完整的字段数据**。
因为 `PUT` 在 RESTful 规范中表示 “全量更新”，序列化器会验证所有**必填字段**

**如果想实现 “部分更新”**（只传修改的字段）：
可以改用 `PATCH` 方法，并在序列化器中添加 `partial=True` 参数：

```py
# 在视图的 patch 方法中（需新增）
def patch(self, request):
    goods_id = request.query_params.get('id')
    try:
        goods = Goods.objects.get(id=goods_id)
    except Goods.DoesNotExist:
        return JsonResponse({"code": 404, "msg": "商品不存在", "result": None})
    
    # partial=True 允许部分更新（无需传递所有字段）
    serializer = GoodsSerializer(goods, data=request.data, partial=True)
    if serializer.is_valid():
        serializer.save()  # 只更新传递的字段，未传递的字段保持原样
        return JsonResponse({"code": 1, "msg": "更新成功", "result": serializer.data})
    return JsonResponse({"code": 0, "msg": "更新失败", "result": serializer.errors})
```

