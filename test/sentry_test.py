#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/11/1

dsn = 'http://2e0c979995824ea289389c6d14a0eecc@10.10.99.100:9000/2'

from raven import Client

client = Client(dsn)

try:
    1 / 0
except ZeroDivisionError:
    client.captureException()
