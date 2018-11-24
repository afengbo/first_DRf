from django.shortcuts import render
from rest_framework import viewsets, mixins
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.authentication import SessionAuthentication
from rest_framework.response import Response
from rest_framework import status

from apps.user_operation.models import UserFav, UserLeaveMessage, UserAddress
from apps.user_operation.serializers import UserFavSerializer, UserFavDetailSerializer
from apps.user_operation.serializers import LeftMessagesSerializer, AddressSerializer
from utils.permissions import IsOwnerOrReadOnly


class UserFavViewset(mixins.CreateModelMixin, mixins.ListModelMixin, mixins.RetrieveModelMixin,
                     mixins.DestroyModelMixin, viewsets.GenericViewSet):
    '''
    用户收藏
    list:
        获取用户收藏列表
    retrieve:
        判断某个商品是否已经收藏
    create:
        添加收藏商品
    '''
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    lookup_field = 'goods_id'

    # 用信号量实现收藏数变更
    # def perform_create(self, serializer):
    #     '''重载创建方法，让收藏数+1'''
    #     instance = serializer.save()
    #     goods = instance.goods
    #     goods.fav_num += 1
    #     goods.save()
    #
    # def destroy(self, request, *args, **kwargs):
    #     '''重载删除方法，让收藏数-1'''
    #     instance = self.get_object()
    #     goods = instance.goods
    #     goods.fav_num -= 1
    #     goods.save()
    #     self.perform_destroy(instance)
    #     return Response(status=status.HTTP_204_NO_CONTENT)

    def get_serializer_class(self):
        if self.action == 'list':
            a = {}
            b = a['a']
            return UserFavDetailSerializer
        else:
            return UserFavSerializer

    def get_queryset(self):
        return UserFav.objects.filter(user=self.request.user)


class LeftMessageViewset(mixins.CreateModelMixin, mixins.ListModelMixin, mixins.DestroyModelMixin,
                         viewsets.GenericViewSet):
    '''
    用户留言
    list:
        列举用户留言
    create:
        用户创建留言
    delete:
        删除用户留言
    '''
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = LeftMessagesSerializer

    def get_queryset(self):
        return UserLeaveMessage.objects.filter(user=self.request.user)


class AddressViewset(viewsets.ModelViewSet):
    '''
    用户收货地址
    list:
        列举用户收货地址
    create:
        创建用户收货地址
    delete:
        删除用户收货地址
    update:
        更新用户收货地址
    '''
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = AddressSerializer

    def get_queryset(self):
        return UserAddress.objects.filter(user=self.request.user)
