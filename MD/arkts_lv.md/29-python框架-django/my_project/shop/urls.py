from django.urls import path
from .views import GoodsView

urlpatterns = [
    path('goods/', GoodsView.as_view(), name='goods')
]