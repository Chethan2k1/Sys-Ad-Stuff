#!/bin/bash

sudo groupadd Scientists -g 500
sudo groupadd interns -g 501

function myfunc()
{
    local  myresult=$(( RANDOM % 51 ))
    echo "$myresult"
} 

sudo useradd -m -d /home/MasterH -g 500 -s /bin/bash MasterH
sudo useradd -m -d /home/Heisenberg -g 500 -s /bin/bash Heisenberg
sudo useradd -m -d /home/Hertz -g 500 -s /bin/bash Hertz
sudo useradd -m -d /home/Holland -g 500 -s /bin/bash Holland

sudo chmod 707 -R /home/MasterH
sudo chmod 707 -R /home/Heisenberg
sudo chmod 707 -R /home/Hertz
sudo chmod 707 -R /home/Holland

sudo setfacl -m d:user:MasterH:rwx /home/Heisenberg
sudo setfacl -m d:user:MasterH:rwx /home/Hertz
sudo setfacl -m d:user:MasterH:rwx /home/Holland

for (( i = 1; i <= 20; i++ )); do
	sudo useradd -m -d /home/MasterH-Intern${i} -g 501 -s /bin/bash MasterH-Intern${i}
	echo "Working fine MasterH"
	sudo chmod 507 -R /home/MasterH-Intern${i}
	sudo setfacl -R -m d:user:MasterH:rwx /home/MasterH-Intern${i}
	for (( j = 0; j <= 5; j++ )); do
		sudo mkdir /home/MasterH-Intern${i}/task${j}
		sudo chmod +t /home/MasterH-Intern${i}/task${j}
	done
done

for (( i = 1; i <= 20; i++ )); do
	sudo useradd -m -d /home/Heisenberg-Intern${i} -g 501 -s /bin/bash Heisenberg-Intern${i}
	echo "Working fine Heisenberg"
	sudo chmod 507 -R /home/Heisenberg-Intern${i}
	sudo setfacl -R -m d:user:MasterH:rwx /home/Heisenberg-Intern${i}
	for (( j = 1; j <= 5; j++ )); do
		sudo mkdir /home/Heisenberg-Intern${i}/task${j}
		sudo chmod +t /home/Heisenberg-Intern${i}/task${j}
	done
done

for (( i = 1; i <= 20; i++ )); do
	sudo useradd -m -d /home/Hertz-Intern${i} -g 501 -s /bin/bash Hertz-Intern${i}
	echo "Working fine Hertz"
	sudo chmod 507 -R /home/Hertz-Intern${i}
	sudo setfacl -R -m d:user:MasterH:rwx /home/Hertz-Intern${i}
	for (( j = 0; j <= 5; j++ )); do
		sudo mkdir /home/Hertz-Intern${i}/task${j}
		sudo chmod +t /home/Hertz-Intern${i}/task${j}
	done
done

for (( i = 1; i <= 20; i++ )); do
	sudo useradd -m -d /home/Holland-Intern${i} -g 501 -s /bin/bash Holland-Intern${i}
	echo "Working fine Holland"
	sudo chmod 507 -R /home/Holland-Intern${i}
	sudo setfacl -R -m d:user:MasterH:rwx /home/Holland-Intern${i}
	for (( j = 1; j <= 5; j++ )); do
		sudo mkdir /home/Holland-Intern${i}/task${j}
		sudo chmod +t /home/Holland-Intern${i}/task${j}
	done
done

for (( i = 1; i <=5; i++ )); do
	sudo mkdir /home/MasterH/task${i}
	cd /home/MasterH/task${i}
	for (( j = 1; j <=50; j++ )); do
		sudo touch /home/MasterH/task${i}/MasterH-task${j}.txt
		head -c 128 /dev/urandom > /home/MasterH/task${i}/MasterH-task${j}.txt
	done
done

for (( i = 1; i <=5; i++ )); do
	sudo mkdir /home/Heisenberg/task${i}
	cd /home/Heisenberg/task${i}
	for (( j = 1; j <=50; j++ )); do
		sudo touch /home/Heisenberg/task${i}/Heisenberg-task${j}.txt
		head -c 128 /dev/urandom > /home/Heisenberg/task${i}/Heisenberg-task${j}.txt
	done
done

for (( i = 1; i <=5; i++ )); do
	sudo mkdir /home/Hertz/task${i}
    cd /home/Hertz/task${i}
	for (( j = 1; j <=50; j++ )); do
		sudo touch /home/Hertz/task${i}/Hertz-tasks${j}.txt
		head -c 128 /dev/urandom > /home/Hertz/task${i}/Hertz-tasks${j}.txt
	done
done

for (( i = 1; i <=5; i++ )); do
	sudo mkdir /home/Holland/task${i}
    cd /home/Holland/task${i}
	for (( j = 1; j <=50; j++ )); do
		sudo touch /home/Holland/task${i}/Holland-task${j}.txt
		head -c 128 /dev/urandom > /home/Holland/task${i}/Holland-task${j}.txt
	done
	cd /home
done

for (( k = 1; k < 6; k++ )); do
	 var=${myfunc}
     crontab -l > mycron
     /home/linux/Desktop/cronjob.sh "k" "var" >> mycron
     crontab mycron
     rm mycron
done
































