# from datetime import datetime
from django.utils import timezone as datetime

from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.


class UserProfile(AbstractUser):
    '''
    用户信息
    为了注册的时候可以写入数据，name、birthday、email设置成可空字段
    '''
    name = models.CharField(max_length=30, null=True, blank=True, verbose_name='姓名')
    birthday = models.DateField(null=True, blank=True, verbose_name='出生日期')
    mobile = models.CharField(null=True, blank=True, max_length=11, verbose_name='电话')
    gender_choice = (
        ('male', '男'),
        ('female', '女')
    )
    gender = models.CharField(max_length=6, choices=gender_choice, default='female', verbose_name='性别')
    email = models.CharField(max_length=100, null=True, blank=True, verbose_name='邮箱')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '用户'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


class VerifyCode(models.Model):
    '''短信验证码'''
    code = models.CharField(max_length=10, verbose_name='验证码')
    mobile = models.CharField(max_length=11, verbose_name='电话')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '短信验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.code
