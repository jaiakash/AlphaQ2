#!/bin/bash

function genUser {
    for i in {01..30}
    do
        sudo useradd -m $1_$i
        sudo usermod -a -G $1 $1_$i
        #adduser automatically creates home directory
        #unlike useradd
    done
}

#Creating User Group

groupadd alpha
groupadd sysad
groupadd appdev
groupadd webdev

#Adding Jay_Jay and users of 3 domains
sudo useradd -m jay_jay
sudo usermod -a -G alpha jay_jay
genUser sysad
genUser appdev
genUser webdev