#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/10/16

import os, sys

pro_dir = os.getcwd()  #如果放在project目录，就不需要在配置绝对路径了
sys.path.append(pro_dir)
os.environ.update({"DJANGO_SETTINGS_MODULE": "mxsx.settings"})

import django
django.setup()

from apps.goods.models import GoodsCategory

from db_tools.data.category_data import row_data

for lev1_cat in row_data:
    lev1_intance = GoodsCategory()
    lev1_intance.code = lev1_cat['code']
    lev1_intance.name = lev1_cat['name']
    lev1_intance.category_type = 1
    lev1_intance.save()

    for lev2_cat in lev1_cat['sub_categorys']:
        lev2_intance = GoodsCategory()
        lev2_intance.code = lev2_cat['code']
        lev2_intance.name = lev2_cat['name']
        lev2_intance.category_type = 2
        lev2_intance.parent_category = lev1_intance
        lev2_intance.save()

        for lev3_cat in lev2_cat['sub_categorys']:
            lev3_intance = GoodsCategory()
            lev3_intance.code = lev3_cat['code']
            lev3_intance.name = lev3_cat['name']
            lev3_intance.category_type = 3
            lev3_intance.parent_category = lev2_intance
            lev3_intance.save()
