#!/bin/bash

#function to create users and add to domain group
function genUser{
    for i in {01..30}
    do
        sudo adduser $1_$i $1
        #adduser automatically creates home directory
        #unlike useradd
    done
}

#function to copy schedule file to each user's directory
function schedule{
    for i in {01..30}
    do
        #dt="2021-07-14"
        dt=$( date +%F )
        #using strings and grep to get the schedule of current day
        strings future.txt | grep  $dt | tee ./sdl.txt
        cp sdl.txt /home/$1_$i/schedule.txt
    done
}

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

#Creating User Group

newgrp alpha
newgrp sysad
newgrp appdev
negrp webdev

#Adding Jay_Jay and users of 3 domains
sudo adduser jay_jay alpha
genUser sysad
genUser appdev
genUser webdev

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

#Schedule
dt=$( date +%F )
strings future.txt | grep  $dt | tee ./sdl.txt
cp sdl.txt /home/jay_jay/schedule.txt

schedule sysad sys
schedule appdev app
schedule webdev web