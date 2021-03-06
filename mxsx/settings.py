"""
Django settings for mxsx project.

Generated by 'django-admin startproject' using Django 1.11.1.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.11/ref/settings/
"""

import os
import sys
import datetime

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE_DIR, 'apps'))
sys.path.insert(0, os.path.join(BASE_DIR, 'extra_apps'))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '+otm1+k#re=v%ru#)!wv9pj$&g4i1_52n4^6-cgkt68vr1h%88'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']

AUTH_USER_MODEL = 'users.UserProfile'


# Application definition

INSTALLED_APPS = [
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'DjangoUeditor',
    'apps.users.apps.UsersConfig',
    'apps.goods.apps.GoodsConfig',
    'apps.trade.apps.TradeConfig',
    'apps.user_operation.apps.UserOperationConfig',
    'xadmin',
    'crispy_forms',
    'rest_framework',
    'django_filters',
    'corsheaders',
    'rest_framework.authtoken',
    'social_django',
    'raven.contrib.django.raven_compat',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

# 允许所有域名访问
CORS_ORIGIN_ALLOW_ALL = True

ROOT_URLCONF = 'mxsx.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'social_django.context_processors.backends',
                'social_django.context_processors.login_redirect',
            ],
        },
    },
]

WSGI_APPLICATION = 'mxsx.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.11/ref/settings/#databases

DATABASES = {
    'default': {
    'ENGINE': 'django.db.backends.mysql',
    'NAME':'mxsx',
    'USER': 'root',
    'PASSWORD': 'nicai',
    'HOST': 'localhost',
    'PORT': '3306',
    'OPTIONS': {'init_command': 'SET storage_engine=INNODB;'}
    }
}


# Password validation
# https://docs.djangoproject.com/en/1.11/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.11/topics/i18n/

LANGUAGE_CODE = 'zh-hans'

TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.11/howto/static-files/

STATIC_URL = '/static/'
# STATIC_ROOT = os.path.join(BASE_DIR, 'static')
STATICFILES_DIRS = (os.path.join(BASE_DIR, 'static'),)

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

REST_FRAMEWORK = {
    # 认证相关
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.BasicAuthentication',
        'rest_framework.authentication.SessionAuthentication',
        # 'rest_framework.authentication.TokenAuthentication',
        # 'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
    ),
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.LimitOffsetPagination',
    'PAGE_SIZE': 10,
    # 用户限速
    'DEFAULT_THROTTLE_CLASSES': (
        'rest_framework.throttling.AnonRateThrottle',
        'rest_framework.throttling.UserRateThrottle'
    ),
    # 搜索
    'DEFAULT_FILTER_BACKENDS': (
        'django_filters.rest_framework.DjangoFilterBackend',
    ),
    'DEFAULT_THROTTLE_RATES': {
        'anon': '12/minute',
        'user': '13/minute'
    }
}

JWT_ALLOW_REFRESH = True

AUTHENTICATION_BACKENDS = (
    'apps.users.views.CustomBackend',
    'social_core.backends.weibo.WeiboOAuth2',
    'social_core.backends.weixin.WeixinOAuth2',
    'social_core.backends.qq.QQOAuth2',
    'django.contrib.auth.backends.ModelBackend',
)

JWT_AUTH = {
    # JWT过期时间
    'JWT_EXPIRATION_DELTA': datetime.timedelta(seconds=3600),
    # JWT刷新超时时间
    'JWT_REFRESH_EXPIRATION_DELTA': datetime.timedelta(days=7),
    # 设置请求前缀
    'JWT_AUTH_HEADER_PREFIX': 'JWT',
}

# 手机号码正则
REGEX_MOBILE = "^1[358]\d{9}$|^147\d{8}$|^176\d{8}$"

# Twilio设置
account_sid = "ACf46cd4e6b6a1da547b0c5b6e78faa37e"
auth_token = "ee53be0790ec48c9854f9eb7e1f3541a"
from_ = "+16825829138"

# 支付宝相关设置
private_key_path = os.path.join(BASE_DIR, 'apps/trade/keys/private_key_2048.txt')
alipay_public_key_path = os.path.join(BASE_DIR, 'apps/trade/keys/alipay_key_2048.txt')

# 缓存配置
REST_FRAMEWORK_EXTENSIONS = {
    'DEFAULT_CACHE_RESPONSE_TIMEOUT': 60 * 15
}

# Redis配置
CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": "redis://10.10.99.100:6379",
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    }
}

# 日志配置
LOGGING = {
    'version': 1,
    # 是否禁用已经存在的配置
    'disable_existing_loggers': False,
    # 日志格式
    'formatters': {
        'verbose': {
            'format': '{levelname} {asctime} {module} {process:d} {thread:d} {message}',
            'style': '{',
        },
        'simple': {
            'format': '{levelname} {message}',
            'style': '{',
        },
        "default": {
            'format': '%(asctime)s %(levelname)s %(name)s %(lineno)s %(message)s',
            'datefmt': "%Y-%m-%d %H:%M:%S"
        }
    },
    'handlers': {
        # 输出到屏幕
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'default'
        },
        # 输出到文件
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': os.path.join(BASE_DIR, "log", 'debug.log'),
            'formatter': 'default'
        },
        'request': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': os.path.join(BASE_DIR, "log", 'request.log'),
            'formatter': 'default'
        },
        'server': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': os.path.join(BASE_DIR, "log", 'server.log'),
            'formatter': 'default'
        },
        'db_backends': {
            'level': 'DEBUG',
            'class': 'logging.handlers.TimedRotatingFileHandler',
            'filename': os.path.join(BASE_DIR, "log", 'backends.log'),
            'when': 'S',
            'interval': 10,
            'formatter': 'default'
        },
        # 发送邮件
        # 'mail_admins': {
        #     'level': 'ERROR',
        #     'class': 'django.utils.log.AdminEmailHandler',
        #     'filters': ['special']
        # }
    },
    'loggers': {
        # 所有日志
        'django': {
            "level": "DEBUG",
            'handlers': ['console', 'file'],
            'propagate': True,  # 当前日志处理完以后是否向上传播,django的父级是root
        },
        # 处理与请求相关的日志
        'django.request': {
            'handlers': ['request'],
            'level': 'DEBUG',
            # 这里propagate设置为True，则这里日志会在request.log和debug.log同时保存
            'propagate': False,
        },
        'django.server': {
            'handlers': ['server'],
            'level': 'DEBUG',
            'propagate': False,
        },
        'django.db.backends': {
            'handlers': ['db_backends'],
            'level': 'DEBUG',
            'propagate': False,
        },
        # 自定义日志
        'fone': {
            "level": "DEBUG",
            'handlers': ['console', 'file'],
            'propagate': False,
        },
    }
}

# 第三方登录相关
SOCIAL_AUTH_WEIBO_KEY = '1502315656'
SOCIAL_AUTH_WEIBO_SECRET = '5a08486e859d7a4140bb87d0085bf092'

SOCIAL_AUTH_QQ_KEY = ''
SOCIAL_AUTH_QQ_SECRET = ''

SOCIAL_AUTH_WEINXIN_KEY = ''
SOCIAL_AUTH_WEIXIN_SECRET = ''

# 登录成功以后的跳转页面
SOCIAL_AUTH_LOGIN_REDIRECT_URL = '/index/'

# sentry配置
RAVEN_CONFIG = {
    'dsn': 'http://2e0c979995824ea289389c6d14a0eecc@10.10.99.100:9000/2',
}
