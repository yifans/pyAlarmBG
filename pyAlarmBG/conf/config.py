import sys
import yaml
import os


def alarm_config():
    curr_dir = os.path.dirname(os.path.realpath(__file__))
    config_file_path = curr_dir + os.sep + 'config.yaml'
    # f = open('/home/yifans/code/pycharm_workspace/pyAlarmBG/pyAlarmBG/conf/config.yaml')
    f = open(config_file_path)
    content = yaml.load(f)
    return content
