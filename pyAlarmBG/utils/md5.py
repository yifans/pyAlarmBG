#!/usr/bin/env python

import hashlib

def str2md5(src):
    m = hashlib.md5()
    m.update(src.encode("utf8"))
    return m.hexdigest()

if __name__ == '__main__':
    print(str2md5("a"))