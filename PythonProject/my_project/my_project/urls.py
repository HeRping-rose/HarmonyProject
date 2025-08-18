"""
URL configuration for my_project project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.conf import settings
from django.contrib import admin
from django.urls import path,include
from django.conf.urls.static import static

urlpatterns = [
    # The admin URL is used to access the Django admin interface
    # It is typically accessed at /admin/
    path("admin/", admin.site.urls),

    # The news URL is used to include the URLs defined in the news application
    # It allows access to the news application's views, such as news_list
    path("news/",include('news.urls')),
    path('shop/', include('shop.urls')),
]

# 第二步 图片资源需要手动配置路由才能通过 URL 访问上传的图片（生产环境通常由 Nginx 等服务器处理）：
# 开发环境下，让Django处理媒体文件的访问
if settings.DEBUG:  # 仅在调试模式下生效
    urlpatterns += static(
        settings.MEDIA_URL,
        document_root=settings.MEDIA_ROOT
    )
