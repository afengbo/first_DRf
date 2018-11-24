#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/10/20
import re
from datetime import datetime, timedelta

from rest_framework import serializers
from django.contrib.auth import get_user_model
from rest_framework.validators import UniqueValidator
from django.utils.timezone import utc

from mxsx.settings import REGEX_MOBILE
from apps.users.models import VerifyCode

User = get_user_model()


class SmsSerializer(serializers.Serializer):
    mobile = serializers.CharField(max_length=11, label='手机号', help_text='手机号')

    def validate_mobile(self, mobile):
        '''验证手机号码'''
        # 验证手机是否注册
        if User.objects.filter(mobile=mobile).count():
            raise serializers.ValidationError("手机号码已注册")
        # 验证手机号码是否合法
        if not re.match(REGEX_MOBILE, mobile):
            raise serializers.ValidationError("手机号码非法")
        # 验证码发送频率
        one_mintes_ago = datetime.now() - timedelta(hours=0, minutes=1, seconds=0)
        if VerifyCode.objects.filter(add_time__gt=one_mintes_ago, mobile=mobile):
            raise serializers.ValidationError("验证码发送频率过高")
        return mobile


class UserDetailSerializer(serializers.ModelSerializer):
    '''用户详情'''
    class Meta:
        model = User
        fields = ("name", "gender", "mobile", "birthday", "email")


class UserRegSerializer(serializers.ModelSerializer):
    '''用户注册'''
    code = serializers.CharField(required=True, write_only=True, max_length=4, min_length=4, help_text='验证码', label='验证码',
                                 error_messages={
                                                    "blank": "请输入验证码",
                                                    "required": "请输入验证码",
                                                    "max_length": "请输入4位验证码",
                                                    "min_length": "请输入4位验证码",
    })
    username = serializers.CharField(required=True, allow_blank=False, label="用户名", help_text='用户名',
                                     validators=[UniqueValidator(queryset=User.objects.all(), message='用户已存在')])

    # 设置密码为密文输入
    password = serializers.CharField(
        label="密码",
        help_text='密码',
        write_only=True,
        style={'input_type': 'password'}
    )

    # def create(self, validated_data):
    #     '''重写create方法，实现密码密文保存'''
    #     user = super(UserRegSerializer, self).create(validated_data=validated_data)
    #     user.set_password(validated_data['password'])
    #     user.save()
    #     return user

    def validate_code(self, code):
        '''验证code'''
        # get方法实现
        # try:
        #     verify_records = VerifyCode.objects.get(mobile=self.initial_data['username'], code=code).order_by('-add_time')
        # except VerifyCode.DoesNotExist as e:
        #     pass
        # except VerifyCode.MultipleObjectsReturned as e:
        #     pass

        # filter方法实现
        verify_records = VerifyCode.objects.filter(mobile=self.initial_data['username'], code=code).order_by('-add_time')
        if verify_records:
            last_record = verify_records[0]
            six_mintes_ago = datetime.utcnow().replace(tzinfo=utc) - timedelta(hours=0, minutes=6, seconds=0)
            if last_record.add_time < six_mintes_ago:
                raise serializers.ValidationError("验证码已过期")
            if last_record.code != code:
                raise serializers.ValidationError("验证码错误")
        else:
            raise serializers.ValidationError("验证码错误")

    def validate(self, attrs):
        attrs['mobile'] = attrs['username']
        del attrs['code']
        return attrs

    class Meta:
        model = User
        fields = ("username", "code", "mobile", "password")
