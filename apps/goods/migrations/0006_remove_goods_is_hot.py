# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2018-10-21 01:42
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0005_goods_is_hot'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='goods',
            name='is_hot',
        ),
    ]