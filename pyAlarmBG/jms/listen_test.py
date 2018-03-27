# coding=utf-8

import time
import sys

import stomp


class MyListener(stomp.ConnectionListener):
    def on_error(self, headers, body):
        print("---> error  " + body)
        pass

    def on_message(self, headers, body):
        print("---> body  " + body)
        print("---> header  " + str(headers))
        pass


conn = stomp.Connection10([('192.168.113.4',61613)])
#conn = stomp.Connection([('192.168.113.4',61616)])
conn.set_listener('', MyListener())
conn.start()
conn.connect()
#conn.connect('alarm', 'alarm', wait=True)
conn.subscribe(destination='/topic/HLSII_SERVER', id=1, ack='auto')
time.sleep(100)
conn.disconnect()
