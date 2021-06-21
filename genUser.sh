#!/bin/bash

function genUser {
    for i in {01..30}
    do
        sudo adduser $1_$i $1
        #adduser automatically creates home directory
        #unlike useradd
    done
}

#Creating User Group

newgrp alpha
newgrp sysad
newgrp appdev
newgrp webdev

#Adding Jay_Jay and users of 3 domains
sudo adduser jay_jay alpha
genUser sysad
genUser appdev
genUser webdev