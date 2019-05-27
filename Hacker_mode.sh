#!/bin/bash

wget https://delta.nitt.edu/~deeraj/server_logs.txt

for (( i = 1; i < 21; i++ )); do
	sudo touch /home/MasterH-Intern${i}/Success.txt
	sudo touch /home/MasterH-Intern${i}/Failure.txt
done

for (( i = 1; i < 21; i++ )); do
	sudo touch /home/Heisenberg-Intern${i}/Success.txt
	sudo touch /home/Heisenberg-Intern${i}/Failure.txt
done

for (( i = 1; i < 21; i++ )); do
	sudo touch /home/Hertz-Intern${i}/Success.txt
	sudo touch /home/Hertz-Intern${i}/Failure.txt
done

for (( i = 1; i < 21; i++ )); do
	sudo touch /home/Holland-Intern${i}/Success.txt
	sudo touch /home/Holland-Intern${i}/Failure.txt
done

    sudo touch /home/MasterH/Success.txt
    sudo touch /home/MasterH/Failure.txt
 
    sudo touch /home/Heisenberg/Success.txt
    sudo touch /home/Heisenberg/Failure.txt

    sudo touch /home/Hertz/Success.txt
    sudo touch /home/Hertz/Failure.txt

    sudo touch /home/Holland/Success.txt
    sudo touch /home/Holland/Failure.txt


for (( i = 1; i < 21; i++ )); do
	touch logs0-intern${i}.txt
cat server_logs.txt | grep "MasterH-Intern${i} ->" > logs0-intern${i}.txt
input="./logs0-intern${i}.txt"
while IFS= read -r line
do
	echo "MY name is ${line}"
	d= echo "${LINE}" | grep "MasterH-Intern${i}" | cut -d " " -f4
	path="/home/${d}"
	su MasterH-Intern${i}
	if  [ -x "${path}" ] ; then
		echo "$LINE" > /home/MasterH-Intern${i}/Success.txt
    else
    	echo "$LINE" > /home/MasterH-Intern${i}/Failure.txt
	fi  
done < "$input"
rm logs0-intern${i}.txt
done


for (( i = 1; i < 21; i++ )); do
	touch logs0-intern${i}.txt
cat server_logs.txt | grep "Heisenberg-Intern${i} ->" > logs0-intern${i}.txt
input="./logs0-intern${i}.txt"
while IFS= read -r line
do
	echo "MY name is ${line}"
	d= echo "${LINE}" | grep Heisenberg-Intern${i} | cut -d " " -f4
	path="/home/${d}"
	su Heisenberg-Intern${i}
	if  [ -x "${path}" ] ; then
		echo "$LINE" > /home/Heisenberg-Intern${i}/Success.txt
    else
    	echo "$LINE" > /home/Heisenber-Intern${i}/Failure.txt
	fi  
done < "$input"
rm logs0-intern${i}.txt
done


for (( i = 1; i < 21; i++ )); do
	touch logs0-intern${i}.txt
cat server_logs.txt | grep "Hertz-Intern${i} ->" > logs0-intern${i}.txt
input="./logs0-intern${i}.txt"
while IFS= read -r line
do
	echo "MY name is ${line}"
	d= echo "${LINE}" | grep Hertz-Intern${i} | cut -d " " -f4
	path="/home/${d}"
	su Hertz-Intern${i}
	if  [ -x "${path}" ] ; then
		echo "$LINE" > /home/Hertz-Intern${i}/Success.txt
    else
    	echo "$LINE" > /home/Hertz-Intern${i}/Failure.txt
	fi  
done < "$input"
rm logs0-intern${i}.txt
done


for (( i = 1; i < 21; i++ )); do
	touch logs0-intern${i}.txt
cat server_logs.txt | grep "Holland-Intern${i} ->" > logs0-intern${i}.txt

input="./logs0-intern${i}.txt"
while IFS= read -r line
do
	echo "MY name is ${line}"
	d= echo "${LINE}" | grep Holland-Intern${i} | cut -d " " -f4
	path="/home/${d}"
	su Holland-Intern${i}
	if  [ -x "${path}" ] ; then
		echo "$LINE" > /home/Holland-Intern${i}/Success.txt
    else
    	echo "$LINE" > /home/Holland-Intern${i}/Failure.txt
	fi  
done < "$input"
rm logs0-intern${i}.txt
done


touch logs0-MasterH.txt
cat server_logs.txt | grep "MasterH ->" > logs0-MasterH.txt
input="./logs0-MasterH.txt"
while IFS= read -r line
do
	echo "MY name is ${line}"
	d= echo "${LINE}" | grep MasterH | cut -d " " -f4
	path="/home/${d}"
	su MasterH
	if  [ -x "${path}" ] ; then
		echo "$LINE" > /home/MasterH/Success.txt
    else
    	echo "$LINE" > /home/MasterH/Failure.txt
	fi  
done < "$input"
rm logs0-MasterH.txt


rm logs0-Heisenberg.txt
touch logs0-Heisenberg.txt
cat server_logs.txt | grep "Heisenberg ->" > logs0-Heisenberg.txt
input="./logs0-Heisenberg.txt"
while IFS= read -r line
do
	echo "MY name is ${line}"
	d= echo "${LINE}" | grep Heisenberg | cut -d " " -f4
	path="/home/${d}"
	su Heisenberg
	if  [ -x "${path}" ] ; then
		echo "$LINE" > /home/Heisenberg/Success.txt
    else
    	echo "$LINE" > /home/Heisenberg/Failure.txt
	fi  
done < "$input"
rm logs0-Heisenberg.txt


touch logs0-Hertz.txt
cat server_logs.txt | grep "Hertz ->" > logs0-Hertz.txt
input="./logs0-Hertz.txt"
while IFS= read -r line
do
	echo "MY name is ${line}"
	d= echo "${LINE}" | grep Hertz | cut -d " " -f4
	path="/home/${d}"
	su Hertz
	if  [ -x "${path}" ] ; then
		echo "$LINE" > /home/Hertz/Success.txt
    else
    	echo "$LINE" > /home/Hertz/Failure.txt
	fi  
done < "$input"
rm logs0-Hertz.txt


touch logs0-Holland.txt
cat server_logs.txt | grep "Holland ->" > logs0-Holland.txt
input="./logs0-Holland.txt"
while IFS= read -r line
do
	echo "MY name is ${line}"
	d= echo "${LINE}" | grep Holland | cut -d " " -f4
	path="/home/${d}"
	su Holland
	if  [ -x "${path}" ] ; then
		echo "$LINE" > /home/Holland/Success.txt
    else
    	echo "$LINE" > /home/Holland/Failure.txt
	fi  
done < "$input"
rm logs0-Holland.txt

echo "  TimeStamp : Hostname : Number of Hits "
for (( i = 1; i < 21; i++ )); do
	cat server_logs.txt | grep "MasterH-Intern${i} ->" > Random_logs.txt
	count=0
	input="./Random_logs.txt"
	while IFS= read -r line; do
		count=$(( count + 1 ))
		echo " `echo ${line} | cut -d " " -f1` : `echo ${line} | cut -d " " -f2` : `echo ${count}`"
	done < "$input"
	rm Random_logs.txt
done

for (( i = 1; i < 21; i++ )); do
	cat server_logs.txt | grep "Heisenberg-Intern${i} ->" > Random_logs.txt
	count=0
	input="./Random_logs.txt"
	while IFS= read -r line; do
		count=$(( count + 1 ))
		echo " `echo ${line} | cut -d " " -f1` : `echo ${line} | cut -d " " -f2` : `echo ${count}`"
	done < "$input"
	rm Random_logs.txt
done

for (( i = 1; i < 21; i++ )); do
	cat server_logs.txt | grep "Hertz-Intern${i} ->" > Random_logs.txt
	count=0
	input="./Random_logs.txt"
	while IFS= read -r line; do
		count=$(( count + 1 ))
		echo " `echo ${line} | cut -d " " -f1` : `echo ${line} | cut -d " " -f2` : `echo ${count}`"
	done < "$input"
	rm Random_logs.txt
done

for (( i = 1; i < 21; i++ )); do
	cat server_logs.txt | grep "Holland-Intern${i} ->" > Random_logs.txt
	count=0
	input="./Random_logs.txt"
	while IFS= read -r line; do
		count=$(( count + 1 ))
		echo " `echo ${line} | cut -d " " -f1` : `echo ${line} | cut -d " " -f2` : `echo ${count}`"
	done < "$input"
	rm Random_logs.txt
done