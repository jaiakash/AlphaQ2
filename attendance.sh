#!/bin/bash

date1=$1
date2=$2

#If no parameters are passed then print all absentees
if [[ "$date1" == "" ]]
then
    date1="2019-09-27"
fi
if [[ "$date2" == "" ]]
then
    date2="2020-07-16"
fi

#getting 1st occurance line no of the date1
start=$(grep -n $date1 attendance.log | head -1 | cut -d':' -f 1)
#getting last occurance line no of the date2
end=$(grep -n $date2 attendance.log | tail -1 | cut -d':' -f 1)


#function to print the absentees
#using grep command
function absent {
    final="$name $date1"
    found=$(strings attendance.log | grep "$final")
    if ! [[ $found != "" ]]
    then
        echo $name is absent on $date1
    fi
}


#function to pass all 30 users of domain
function getUser {
    for i in {01..30}
    do
        name="$1_$i -"
        absent
    done
}

x=1
datx=""
N=3
while read p
do
    if [[ "$x" -lt "$end" ]]
    then
        if [[ "$start" -le "$x" ]]
        then

        if [[ "$datx" != "$date1" ]]
        then
        date1=$datx

            #calling function getUser to get all 30 users and
            #then getUser will call absent function to get the absentees
            getUser sysAd
            getUser webDev
            getUser appDev
        fi

        #awk to get the next unique date
        datx=$(echo $p | awk -v N=$N '{print $N}')
        datx=${datx%?}

        fi
    fi
((x++))
done < attendance.log