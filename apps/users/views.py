from random import choice
import string

from django.contrib.auth.backends import ModelBackend
from django.contrib.auth import get_user_model
from django.db.models import Q
from rest_framework import mixins, viewsets, status
from rest_framework.response import Response
from rest_framework_jwt.serializers import jwt_payload_handler, jwt_encode_handler
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated

from apps.users.models import VerifyCode
from apps.users.serializers import SmsSerializer, UserRegSerializer, UserDetailSerializer
from utils.Twilio import TwilioClass
from mxsx.settings import account_sid, auth_token, from_
from utils.permissions import IsOwnerOrReadOnly

User = get_user_model()


class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        # 重写authenticate方法，自定义验证字段
        try:
            user = User.objects.get(Q(username=username) | Q(mobile=username))   # 不用验证密码，因为密码在数据库是密文保存的
            if user.check_password(password):   # 调用父类AbstractUser中的check_password验证密码
                return user
        except Exception as e:
            return None


class SmsCodeViewset(mixins.CreateModelMixin, viewsets.GenericViewSet):
    '''发送短信验证码'''
    serializer_class = SmsSerializer

    def generate_code(self):
        seeds = string.hexdigits
        random_str = []
        for i in range(4):
            random_str.append(choice(seeds))
        return ''.join(random_str)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        mobile = '+86' + serializer.validated_data['mobile']
        twilio = TwilioClass(account_sid, auth_token, from_)
        code = self.generate_code()
        try:
            sms_error_message = twilio.sendMessages(mobile, code)
            if sms_error_message:
                return Response({"mobile":sms_error_message}, status=status.HTTP_400_BAD_REQUEST)
            else:
                code_obj = VerifyCode(code=code, mobile=mobile.replace('+86',''))
                code_obj.save()
                return Response({"mobile":mobile.replace('+86','')}, status=status.HTTP_200_OK)
        except Exception as e:
            if e.args[0] == 400:
                error_message = f"The mobile number {mobile} is not a valid phone number.Please go to Twilio for verification."
                return Response({"mobile": error_message}, status=status.HTTP_400_BAD_REQUEST)


class UserViewset(mixins.CreateModelMixin, mixins.ListModelMixin, mixins.UpdateModelMixin,
                  mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    '''用户'''
    # serializer_class = UserRegSerializer
    queryset = User.objects.all()
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        user = self.perform_create(serializer)
        re_dict = serializer.data
        payload = jwt_payload_handler(user)
        re_dict['token'] = jwt_encode_handler(payload)
        re_dict['name'] = user.name if user.name else user.username

        headers = self.get_success_headers(serializer.data)
        return Response(re_dict, status=status.HTTP_201_CREATED, headers=headers)

    def get_serializer_class(self):
        if self.action == 'create':
            return UserRegSerializer
        else:
            return UserDetailSerializer

    def get_permissions(self):
        if self.action == 'retrieve':
            return [IsAuthenticated(), IsOwnerOrReadOnly()]
        else:
            return []

    def get_queryset(self):
        return self.request.user

    def perform_create(self, serializer):
        return serializer.save()
