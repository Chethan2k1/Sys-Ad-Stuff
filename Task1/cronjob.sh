#!/bin/bash

for (( j = 1; j < 21; j++ )); do
     echo "0 0 * * * cp /home/MasterH/task${k}/task${var} /home/MasterH-Intern${j}/task${k}"
   	 echo "0 0 * * * cp /home/Heisenberg/task${k}/task${var} /home/Heisenberg-Intern${j}/task${k}"
   	 echo "0 0 * * * cp /home/Hertz/task${k}/task${var} /home/Hertz-Intern${j}/task${k}"
   	 echo "0 0 * * * cp /home/Holland/task${k}/task${var} /home/Holland-Intern${j}/task${k}"  
  done
     echo "0 0 * * * rm /home/MasterH/task${k}/task${var}"
     echo "0 0 * * * rm /home/Heisenberg/task${k}/task${var}"
     echo "0 0 * * * rm /home/Hertz/task${k}/task${var}"
     echo "0 0 * * * rm /home/Holland/task${k}/task${var}"
