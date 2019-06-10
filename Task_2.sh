#!/bin/bash

cd /var/www

mkdir html2
mkdir html3
mkdir html4
mkdir loadbal

cd /etc/apache2

echo "LISTEN 81" >> ports.conf	
echo "LISTEN 82" >> ports.conf
echo "LISTEN 83" >> ports.conf
echo "LISTEN 84" >> ports.conf

cd ./sites-available

for (( i = 2;i < 5;i++ )); do
	touch html${i}.conf
	j=79+${i}
echo "<VirtualHost *:`echo ${j}`>" > html${i}.conf
echo "ServerAdmin webmaster@localhost">> html${i}.conf
echo "ServerName html${i}.com">> html${i}.conf
echo "ServerAlias www.html${i}.com">> html${i}.conf
echo "DocumentRoot /var/www/html${i}">> html${i}.conf
echo "ErrorLog ${APACHE_LOG_DIR}/error.log">> html${i}.conf
echo "CustomLog ${APACHE_LOG_DIR}/access.log combined">> html${i}.conf
echo "</VirtualHost>">> html${i}.conf
done

	touch loadbal.conf
echo "<VirtualHost *:84>" > loadbal.conf
echo "ServerAdmin webmaster@localhost">> loadbal.conf
echo "ServerName loadbal.com">> loadbal.conf
echo "ServerAlias www.loadbal.com">> loadbal.conf
echo "DocumentRoot /var/www/loadbal">> loadbal.conf
echo "ErrorLog ${APACHE_LOG_DIR}/error.log">> loadbal.conf
echo "CustomLog ${APACHE_LOG_DIR}/access.log combined">> loadbal.conf
echo "</VirtualHost>">> loadbal.conf

cd 

ip=`hostname -i`
cd /etc
for (( i = 2; i < 5; i++ )); do
	echo "${ip} html${i}.com" >> ./hosts
	echo "${ip} www.html${i}.com" >>./hosts
done
	
	echo "${ip} loadbal.com" >> ./hosts
	echo "${ip} www.loadbal.com" >>./hosts

a2ensite html2.conf
a2ensite html3.conf
a2ensite html4.conf
a2ensite loadbal.conf

systemctl reload apache2

mysql -u root -p << EOF
drop database ser_det;
create database ser_det;
use ser_det;
create table nodes(
name varchar(20),
CPUs int,
Mem_Size int,
Mem_Aval int  
);

INSERT INTO nodes VALUES('80','4','500','500');
INSERT INTO nodes VALUES('81','6','750','750');
INSERT INTO nodes VALUES('82','3','300','300');
INSERT INTO nodes VALUES('83','1','50','50');

create table Requests(
ID int NOT NULL AUTO_INCREMENT,
PRIMARY KEY (ID),
allocated_node_name varchar(20),
Starttime varchar(9),
CPU_Req int,
Memory_Req int,
comp_time_req int
);

create table req(
ID int,
time_started varchar(20),
node_name varchar(20)
);

create table history1(
ID int,
Start_time varchar(9),
End_time varchar(9)
);

create table history2(
ID int,
Start_time varchar(9),
End_time varchar(9)
);

create table history3(
ID int,
Start_time varchar(9),
End_time varchar(9)
);

create table history4(
ID int,
Start_time varchar(9),
End_time varchar(9)
);

EOF