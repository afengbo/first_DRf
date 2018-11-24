# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2018-10-16 14:30
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0002_goodscategorybrand_category'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='goodsimage',
            name='image_url',
        ),
        migrations.AlterField(
            model_name='banner',
            name='add_time',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='添加时间'),
        ),
        migrations.AlterField(
            model_name='goods',
            name='add_time',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='添加时间'),
        ),
        migrations.AlterField(
            model_name='goods',
            name='goods_front_image',
            field=models.ImageField(blank=True, null=True, upload_to='goods/images/', verbose_name='封面图'),
        ),
        migrations.AlterField(
            model_name='goodscategory',
            name='add_time',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='添加时间'),
        ),
        migrations.AlterField(
            model_name='goodscategorybrand',
            name='add_time',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='添加时间'),
        ),
        migrations.AlterField(
            model_name='goodscategorybrand',
            name='image',
            field=models.ImageField(upload_to='brand/'),
        ),
        migrations.AlterField(
            model_name='goodsimage',
            name='add_time',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='添加时间'),
        ),
    ]
