#!/usr/bin/env python3

import socket
import threading
import queue

server=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
socket.socket(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
host='127.0.0.1'
port=1235
server.bind((host,port))
server.listen()

t=[]
users=0
print('Online:'+str(users)+'\n')

def read(connection,q):
    while True:
        data=connection.recv(1024).decode('utf-8')
        q.put(data)

def write(connection,q):
    while True:
        if(q.empty()==False):
            data=q.get()
            if len(data)!=0:
                for a in t:
                    if a!=connection:
                        a.send(data.encode('utf-8'))
            else:
                break
        else:
            continue
    --users
    print('Online:'+str(users)+'\n')
    connection.close()


def client_thread(connection):
    ++users
    print('Online:'+str(users)+'\n')
    q=queue.Queue()
    threading.Thread(target=read,args=(connection,q),daemon=True).start()
    threading.Thread(target=write,args=(connection,q),daemon=True).start()    

while True:
        connection, address=server.accept()
        t.append(connection)
        threading.Thread(target=client_thread,args=(connection,),daemon=True).start()


            

            







