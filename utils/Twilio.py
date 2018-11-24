#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Date: 2018/10/19
from twilio.rest import Client

class TwilioClass():
    def __init__(self, account_sid, auth_token, from_):
        self.account_sid = account_sid
        self.auth_token = auth_token
        self.from_ = from_

    def sendMessages(self, mobile, code):
        '''发送验证码短信'''
        client = Client(self.account_sid, self.auth_token)
        message = client.messages.create(
                    to=mobile,
                    from_=self.from_,
                    body="【Fone】 You code is [%s]\nIgnore this message if it is not my operation.(Xiaosheng bb~)" % code
        )
        return message.error_message


if __name__ == "__main__":
    # Your Account SID from twilio.com/console
    account_sid = "ACf46cd4e6b6a1da547b0c5b6e78faa37e"
    # Your Auth Token from twilio.com/console
    auth_token = "ee53be0790ec48c9854f9eb7e1f3541a"
    to = "+8618520849338"
    from_ = "+16825829138"
    twilio = TwilioClass(account_sid, auth_token, from_)
    try:
        error_message = twilio.sendMessages(to, 'nichousha')
        print(error_message)
    except Exception as e:
        print(type(e.args[0]))

