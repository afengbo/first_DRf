#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/11/1
import requests


def get_auth_url():
    weibo_auth_url = "https://api.weibo.com/oauth2/authorize"
    client_id = '1502315656'
    redirect_uri = ''
    # https://api.weibo.com/oauth2/authorize?client_id=123050457758183&redirect_uri=http://www.example.com/response&response_type=code
    auth_url = weibo_auth_url + f"?client_id={client_id}&redirect_uri={redirect_uri}"
    print(auth_url)


def get_access_token(code=''):
    access_token_url = 'https://api.weibo.com/oauth2/access_token'
    ret_dict = requests.post(access_token_url, data={
        'client_id': '',
        'client_secret': '',
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': '',
    })
    print(ret_dict)


def get_user_info(access_token='', uid=''):
    weibo_user_url = 'https://api.weibo.com/2/users/show.json'
    access_token = ''
    uid = ''
    user_url = weibo_user_url + f"?access_token={access_token}&uid={uid}"
    print(user_url)


if __name__ == '__main__':
    get_auth_url()
    get_access_token('')
    get_user_info()
