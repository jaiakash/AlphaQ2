#!/bin/bash

#function to copy schedule file to each user's directory
function permit{
    for i in {01..30}
    do
        if [ $i -le 11 ]
        then
            #Adding to group
            sudo adduser $1_$i $2_secondyr

            #Adding read and execute permisiion for head as well as seniors
            setfacl -dm g:$2_thirdyr:r-x /home/$1_$i
            setfacl -dm g:$2_fourthyr:r-x /home/$1_$i
            setfacl -dm u:jay_jay:r-x /home/$1_$i
        elif [ $i -le 21 ]
        then
            sudo adduser $1_$i $2_thirdyr

            #Adding read and execute permisiion for head as well as seniors
            setfacl -dm g:$2_fourthyr:r-x /home/$1_$i
            setfacl -dm u:jay_jay:r-x /home/$1_$i
        elif [ $i -le 31 ]
        then
            sudo adduser $1_$i $2_fourthyr

            #Adding read and execute permisiion for head
            setfacl -dm u:jay_jay:r-x /home/$1_$i
        fi
    done
}

#Permission group
newgrp head
newgrp sys_fourthyr
newgrp web_fourthyr
newgrp app_fourthyr
newgrp sys_thirdyr
newgrp web_thirdyr
newgrp app_thirdyr
newgrp sys_secondyr
newgrp web_secondyr
newgrp app_secondyr

#Permission
sudo adduser jay_jay head
permit sysad
permit appdev
permit webdev