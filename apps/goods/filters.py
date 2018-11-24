#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/10/18
from django.db.models import Q
import django_filters
from apps.goods.models import Goods


class GoodsFilter(django_filters.rest_framework.FilterSet):
    '''商品过滤类'''
    pricemin = django_filters.NumberFilter(field_name='shop_price', lookup_expr='gte')
    pricemax = django_filters.NumberFilter(field_name='shop_price', lookup_expr='lte')
    top_category = django_filters.NumberFilter(method='top_category_field')

    def top_category_field(self, queryset, name, value):
        return queryset.filter(Q(category_id=value)|Q(category__parent_category_id=value)|
                               Q(category__parent_category__parent_category_id=value))

    class Meta:
        model = Goods
        fields = ['pricemin', 'pricemax', 'top_category', 'is_new']
