import logging

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import mixins, viewsets, generics, filters
from rest_framework.pagination import PageNumberPagination
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.authtoken.models import Token
from rest_framework.authentication import TokenAuthentication
from rest_framework_extensions.cache.mixins import CacheResponseMixin
from rest_framework.throttling import UserRateThrottle, AnonRateThrottle
from rest_framework.permissions import DjangoModelPermissions
from django.views.generic.list import ListView

from apps.goods.models import Goods, GoodsCategory, Banner
from apps.goods.serializers import GoodsSerializer, GoodsCategorySerializer, BannerSerializer, IndexCategorySerializer
from apps.goods.filters import GoodsFilter

logger = logging.getLogger(__name__)


# class GoodsListView(APIView):
#     """List all goods info(method 1)"""
#     def get(self, request, format=None):
#         goods = Goods.objects.all()[:10]
#         goods_serializer = GoodsSerializer(goods, many=True)
#         return Response(goods_serializer.data)


class GoodsSetPagination(PageNumberPagination):
    # 分页设置
    page_size = 12           # 每页显示数量
    page_size_query_param = 'page_size'   # 每页显示数量关键字
    page_query_param = 'page'   # 页数关键字
    max_page_size = 100      # 每页最大显示数量


class GoodsListViewSet(CacheResponseMixin, mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    '''
    list:
        列举商品信息（包含分页、过滤、搜索、排序）
    '''
    logger.debug("有人来拿商品列表啦！")
    queryset = Goods.objects.all()
    pagination_class = GoodsSetPagination
    serializer_class = GoodsSerializer
    throttle_classes = (UserRateThrottle, AnonRateThrottle)
    # authentication_classes = (TokenAuthentication, )
    # permission_classes = (DjangoModelPermissions, )
    filter_backends = (filters.SearchFilter, filters.OrderingFilter, DjangoFilterBackend,)
    filter_class = GoodsFilter
    search_fields = ('name', 'goods_brief', 'goods_desc')
    ordering_fields = ('sold_num', 'shop_price')
    logger.warning("拿完列表跑啦啦！")
    # extra_perm_map = {
    #     "GET": ['goods.view_goods']
    # }

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.click_num += 1
        instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

    # def get_queryset(self):
    #     queryset = Goods.objects.all()
    #     price_min = self.request.query_params.get("price_min", 0)
    #     if price_min:
    #         queryset = queryset.filter(shop_price__gt=int(price_min))
    #     return queryset


class GoodsCategoryListViewSet(mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    list:
        商品分类列表数据
    retrieve:
        获取商品分类详情
    """
    serializer_class = GoodsCategorySerializer
    queryset = GoodsCategory.objects.filter(category_type=1)


class BannerViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
    '''
    首页轮播商品
    list:
        轮播商品详情
    '''
    serializer_class = BannerSerializer
    queryset = Banner.objects.filter().order_by('index')


class IndexCategoryViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
    '''
    首页商品系列展示
    list:
        首页关联商品展示
    '''
    serializer_class = IndexCategorySerializer
    queryset = GoodsCategory.objects.filter(is_tab=True, name__in=['奶类食品', '生鲜食品'])
