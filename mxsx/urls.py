"""mxsx URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include

import xadmin
from mxsx.settings import MEDIA_ROOT
from django.views.static import serve
from rest_framework.documentation import include_docs_urls
from rest_framework.routers import DefaultRouter
from rest_framework.authtoken import views
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token
from django.views.generic import TemplateView

from apps.goods.views import GoodsListViewSet, GoodsCategoryListViewSet, BannerViewset, IndexCategoryViewset
from apps.users.views import SmsCodeViewset, UserViewset
from apps.user_operation.views import UserFavViewset, LeftMessageViewset, AddressViewset
from apps.trade.views import ShopCartViewset, OrderViewset
from apps.trade.views import AliPayView

router = DefaultRouter()
router.register(r'goods', GoodsListViewSet, base_name='goods')
# 首页轮播图
router.register(r'banners', BannerViewset, base_name='banners')
# 首页关联商品展示
router.register(r'indexgoods', IndexCategoryViewset, base_name='indexgoods')
router.register(r'categorys', GoodsCategoryListViewSet, base_name='categorys')
router.register(r'code', SmsCodeViewset, base_name='code')
router.register(r'users', UserViewset, base_name='users')
# 用户收藏
router.register(r'userfavs', UserFavViewset, base_name='userfavs')
# 用户留言
router.register(r'messages', LeftMessageViewset, base_name='messages')
# 用户收货地址
router.register(r'address', AddressViewset, base_name='address')
# 购物车
router.register(r'shopcarts', ShopCartViewset, base_name='shopcarts')
# 订单
router.register(r'orders', OrderViewset, base_name='orders')

# goods_list = GoodsListViewSet.as_view({
#     'get': 'list',
# })

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),

    # 列举所有接口url
    url(r'^', include(router.urls)),

    url(r'^index', TemplateView.as_view(template_name='index.html'), name='index'),

    # 支付宝
    url(r'alipay/return/', AliPayView.as_view(), name='alipay'),

    # DRf 自带的token认证
    url(r'^drf-auth/', views.obtain_auth_token),

    # JWT的认证接口
    # url(r'^jwt-auth/', obtain_jwt_token),
    url(r'^login/$', obtain_jwt_token),
    url(r'^jwt-token-refresh/', refresh_jwt_token),

    url(r'docs/', include_docs_urls(title='Fone生鲜')),

    # 第三方登录
    url(r'^social/', include('social_django.urls', namespace='social'))

]
