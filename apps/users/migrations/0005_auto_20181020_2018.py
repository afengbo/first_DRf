# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2018-10-20 12:18
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_auto_20181020_2010'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='add_time',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='添加时间'),
        ),
        migrations.AlterField(
            model_name='verifycode',
            name='add_time',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='添加时间'),
        ),
    ]