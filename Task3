#!usr/bin/env python3

import socket

s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
host='127.0.0.1'
port=1235
s.bind((host,port))
s.listen()
sockets=[s]

def recieve_message(client_socket):
    try:
        data=client_socket.recv(1024).decode('utf-8')
        return data 
    except:
        False


while True:
    for socket in sockets:
        client_socket, client_address=s.accept()
        sockets.append([client_socket,client_address])
        data=recieve_message(socket)
        if data is False:
            print(f"closed connection from {socket[1]}")
            sockets.remove(socket)
            continue
        elif data!=None:
            if(data[-4:]=='exit'): #Checking if we have typed in exit
                socket.close()
                sockets.remove(socket)
            else:
                    print(data)
        else:
            continue
        for client_socket in clients: #sending the all other sockets other than the one we are recieving data from
            if client_socket!=socket:
                client_socket.send(data.decode('utf-8'))


            

            







