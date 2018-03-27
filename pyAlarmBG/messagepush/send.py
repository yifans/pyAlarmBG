
import os
import sqlite3
from pyAlarmBG.conf import config

def push_message(pv_name, message_content):
    conf = config.alarm_config()
    db = conf['sqlite']['path'] + os.path.sep +conf['sqlite']['dbname']
    conn = sqlite3.connect(db)
    cursor = conn.cursor()
    cursor.execute('select * from pv;')
    values = cursor.fetchall()
    print(values)
    cursor.close()
    conn.close()
    pass

def send2operator(operator_name, message_content):
    pass

if __name__ == '__main__':
    push_message('alarm:test:A:ai1', 'hihi')
    push_message('alarm:test:B:ai1', 'hihi')
    push_message('alarm:test:C:ai1', 'hihi')
    push_message('alarm:test:D:ai1', 'hihi')
