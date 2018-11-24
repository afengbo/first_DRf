import json

from django.shortcuts import HttpResponse
from django.http import JsonResponse
from django.core import serializers
from django.views.generic import View

from apps.goods.models import Goods


class GoodsList(View):
    def get(self, resquest):
        """
        返回商品数据
        :param resquest:
        :return: goods info for json data
        """
        json_list = []
        goods = Goods.objects.all()[:10]
        json_data = serializers.serialize('json', goods)
        json_data = json.loads(json_data)
        return HttpResponse(json.dumps(json_data))
        # return JsonResponse(json_data, safe=False)
