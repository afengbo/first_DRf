#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/10/20
from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver

from apps.user_operation.models import UserFav


@receiver(post_save, sender=UserFav)
def create_userfav(sender, instance=None, created=False, **kwargs):
    if created:
        goods = instance.goods
        goods.fav_num += 1
        goods.save()


@receiver(post_delete, sender=UserFav)
def delete_userfav(sender, instance=None, created=False, **kwargs):
    goods = instance.goods
    goods.fav_num -= 1
    goods.save()
