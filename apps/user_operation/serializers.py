#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/10/21
import re

from rest_framework import serializers
from rest_framework.validators import UniqueTogetherValidator

from apps.user_operation.models import UserFav, UserLeaveMessage, UserAddress
from apps.goods.serializers import GoodsSerializer
from mxsx.settings import REGEX_MOBILE


class UserFavDetailSerializer(serializers.ModelSerializer):
    goods = GoodsSerializer()

    class Meta:
        model = UserFav
        fields = ("goods", "id")


class UserFavSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )

    class Meta:
        model = UserFav
        fields = ("user", "goods", "id")
        validators = [
            UniqueTogetherValidator(
                queryset=UserFav.objects.all(),
                fields=('user', 'goods'),
                message="该商品已收藏"
            )
        ]


class LeftMessagesSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    add_time = serializers.DateTimeField(read_only=True, format="%Y-%m-%d %H:%M")

    class Meta:
        model = UserLeaveMessage
        fields = ("id", "user", "message_type", "subject", "message", "file", "add_time")


class AddressSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    add_time = serializers.DateTimeField(read_only=True, format="%Y-%m-%d %H:%M")

    def validate_signer_mobile(self, signer_mobile):
        '''验证手机号码是否合法'''
        if not re.match(REGEX_MOBILE, signer_mobile):
            raise serializers.ValidationError("手机号码非法")
        return signer_mobile

    class Meta:
        model = UserAddress
        fields = ("id", "user", "province", "city", "district", "address", "signer_name", "signer_mobile", "add_time")
