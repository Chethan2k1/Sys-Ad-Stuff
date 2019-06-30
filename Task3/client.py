#usr/bin/env python3

import socket
import sys

name=input("Enter your Username : ")
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
host='127.0.0.1'
port=1235
s.connect((host,port))
s.setblocking(False)

while True:
    msg=input('> ')
    if msg:
        new_msg='@'+name+'> '+msg
        s.send(new_msg.encode('utf-8'))
    try:
        while True:
            data=s.recv(1024).decode('utf-8')
            print(data)
    except:
        pass
