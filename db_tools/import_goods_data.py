#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/10/16

import os, sys

pro_dir = os.getcwd()  #如果放在project目录，就不需要在配置绝对路径了
sys.path.append(pro_dir)
os.environ.update({"DJANGO_SETTINGS_MODULE": "mxsx.settings"})

import django
django.setup()

from apps.goods.models import Goods, GoodsCategory, GoodsImage

from db_tools.data.product_data import row_data

for goods_detail in row_data:
    goods = Goods()
    goods.name = goods_detail['name']
    goods.market_price = float(goods_detail['market_price'].replace('￥', '').replace('元', ''))
    goods.shop_price = float(goods_detail['sale_price'].replace('￥', '').replace('元', ''))
    goods.goods_brief = goods_detail['desc'] if goods_detail['desc'] else ''
    goods.goods_desc = goods_detail['goods_desc'] if goods_detail['goods_desc'] else ''
    goods.goods_front_image = goods_detail['images'][0] if goods_detail['images'] else ''
    category_name = goods_detail['categorys'][-1]
    category = GoodsCategory.objects.filter(name=category_name).first()
    if category:
        goods.category = category
    goods.save()

    for goods_image in goods_detail['images']:
        goods_image_instance = GoodsImage()
        goods_image_instance.image = goods_image
        goods_image_instance.goods = goods
        goods_image_instance.save()