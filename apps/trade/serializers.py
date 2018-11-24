#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/10/22
import time
import random

from rest_framework import serializers

from apps.goods.models import Goods
from apps.trade.models import ShoppingCart, OrderInfo, OrderGoods
from apps.goods.serializers import GoodsSerializer
from utils.alipay_mx import AliPay
from mxsx.settings import private_key_path, alipay_public_key_path


class ShopCartDetailSerializer(serializers.ModelSerializer):
    goods = GoodsSerializer()

    class Meta:
        model = ShoppingCart
        fields = "__all__"


class ShopcartSerializer(serializers.Serializer):
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    nums = serializers.IntegerField(required=True, label='商品数量', help_text='商品数量', min_value=1,
                                    error_messages={
                                        'min_value': "商品数量不能少于1",
                                        'required': "请选择购买数量",
                                    })
    goods = serializers.PrimaryKeyRelatedField(required=True, queryset=Goods.objects.all())

    def create(self, validated_data):
        user = self.context['request'].user
        goods = validated_data['goods']
        nums = validated_data['nums']

        existed = ShoppingCart.objects.filter(user=user, goods=goods)
        if existed:
            existed = existed[0]
            existed.nums += nums
            existed.save()
        else:
            existed = ShoppingCart.objects.create(**validated_data)
        return existed

    def update(self, instance, validated_data):
        # 修改商品数量
        instance.nums = validated_data['nums']
        instance.save()
        return instance


class OrderGoodsSerializer(serializers.ModelSerializer):
    goods = GoodsSerializer(many=False)
    class Meta:
        model = OrderGoods
        fields = "__all__"



class OrderDetailSerializer(serializers.ModelSerializer):
    goods = OrderGoodsSerializer(many=True)
    class Meta:
        model = OrderInfo
        fields = "__all__"


class OrderSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    order_sn = serializers.CharField(read_only=True, label='订单号', help_text='订单号')
    trade_no = serializers.CharField(read_only=True, label='支付宝交易号', help_text='支付宝交易号')
    pay_status = serializers.CharField(read_only=True, label='订单状态', help_text='订单状态')
    order_mount = serializers.CharField(read_only=True, label='订单金额', help_text='订单金额')
    pay_time = serializers.DateTimeField(read_only=True, label='支付时间', help_text='支付时间')
    alipay_url = serializers.SerializerMethodField(read_only=True, label='交易链接', help_text='交易链接')

    def get_alipay_url(self, obj):
        alipay = AliPay(
            appid="2016092000551560",
            app_notify_url="http://127.0.0.1:8000/alipay/return",
            app_private_key_path=private_key_path,
            alipay_public_key_path=alipay_public_key_path,
            debug=True,  # 默认False,
            return_url="http://127.0.0.1:8000/alipay/return"
        )
        url = alipay.direct_pay(
            subject=obj.order_sn,
            out_trade_no=obj.order_sn,
            total_amount=obj.order_mount,
        )
        ret_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)
        return ret_url

    def generate_order_sn(self):
        '''生成订单号'''
        time_str = time.strftime("%Y%m%d%H%M%S")
        user_id = self.context['request'].user.id
        ranstr = random.randint(100, 999)
        order_sn = f"{time_str}{user_id}{ranstr}"
        return order_sn

    def validate(self, attrs):
        attrs["order_sn"] = self.generate_order_sn()
        return attrs

    class Meta:
        model = OrderInfo
        fields = "__all__"
