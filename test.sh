#!/bin/bash

# Ignore this file, used for testing purpose


function genUser {
    for i in {01..30}
    do
        echo $1_$i $1
        #adduser automatically creates home directory
        #unlike useradd
    done
}

genUser ak