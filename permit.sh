#!/bin/bash

#function to copy schedule file to each user's directory
permit() {
    for i in {01..30}
    do
        if [ $i -le 11 ]
        then
            #Adding to group
            sudo usermod -a -G $2_secondyr $1_$i 

            #Adding read and execute permisiion for head as well as seniors
            setfacl -dm g:$2_thirdyr:r-x /home/$1_$i
            setfacl -dm g:$2_fourthyr:r-x /home/$1_$i
            setfacl -dm u:jay_jay:r-x /home/$1_$i
        elif [ $i -le 21 ]
        then
            sudo usermod -a -G $2_thirdyr $1_$i

            #Adding read and execute permisiion for head as well as seniors
            setfacl -dm g:$2_fourthyr:r-x /home/$1_$i
            setfacl -dm u:jay_jay:r-x /home/$1_$i
        elif [ $i -le 31 ]
        then
            sudo usermod -a -G $2_fourthyr $1_$i

            #Adding read and execute permisiion for head
            setfacl -dm u:jay_jay:r-x /home/$1_$i
        fi
    done
}

#Permission group
groupadd head
groupadd sys_fourthyr
groupadd web_fourthyr
groupadd app_fourthyr
groupadd sys_thirdyr
groupadd web_thirdyr
groupadd app_thirdyr
groupadd sys_secondyr
groupadd web_secondyr
groupadd app_secondyr

#Permission
sudo usermod -a -G head jay_jay
permit sysad sys
permit appdev app
permit webdev web