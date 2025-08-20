from django.urls import path
from .views import GoodsView, ShopView

urlpatterns = [
    path('goods/', GoodsView.as_view(), name='goods'),
    path('shops/', ShopView.as_view(), name='shop-list')
]