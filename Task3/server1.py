#!/usr/bin/env python3

import socket
import threading

server=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
socket.socket(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
host='127.0.0.1'
port=1235
server.bind((host,port))
server.listen()

t=[]
users=0

def client_thread(connection):
    ++users
    while True:
        data=connection.recv(1024).decode('utf-8')
        if len(data)!=0:
            for a in t:
                if a!=connection:
                    a.send(data.encode('utf-8'))
        else:
            break
    for a in t:
        if a==connection:
            t.remove(a)
    --users
    connection.close()

while True:
        connection, address=server.accept()
        t.append(connection)
        threading.Thread(target=client_thread,args=(connection,),daemon=True).start()

    


