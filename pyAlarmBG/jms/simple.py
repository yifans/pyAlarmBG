import time
import sys

import stomp

class MyListener(stomp.ConnectionListener):
    def on_error(self, headers, message):
        print('received an error "%s"' % message)
    def on_message(self, headers, message):
        print('received a message "%s"' % message)

conn = stomp.Connection([('192.168.126.15',61613)])
conn.set_listener('', MyListener())
conn.start()
# conn.connect('admin', 'password', wait=True)
conn.connect()

conn.subscribe(destination='/queue/test', id=1, ack='auto')

conn.send(body='hello', destination='/queue/test')

time.sleep(2)
conn.disconnect()