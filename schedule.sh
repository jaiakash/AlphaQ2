#!/bin/bash

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

#Schedule
dt=$( date +%F )
strings future.txt | grep  $dt | tee ./sdl.txt
cp sdl.txt /home/jay_jay/schedule.txt

schedule sysad sys
schedule appdev app
schedule webdev web