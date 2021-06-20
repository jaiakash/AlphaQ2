#!/bin/bash

#Pass the date whose mom need to be created. For example
#$./genMoM.sh 2019-09-27
date1=$1

#getting 1st occurance line no of the date1
start=$(grep -n $date1 attendance.log | head -1 | cut -d':' -f 1)
#getting last occurance line no of the date2
end=$(grep -n $date1 attendance.log | tail -1 | cut -d':' -f 1)

#Loop that goes from first person to join to last person joined on the date of meeting
while read p
do
    if [[ "$x" -lt "$end" ]]
    then
        w=$(echo $p | cut -d' ' -f 1)
        t=$(echo $p | cut -d' ' -f 3)
        if [[ $w == *"_0"* ]]; then
            name=$w #name
            mssg=$p #attendance log
            t=${t%?}
            dt=$t #date
        fi
    fi
((x++))
done < attendance.log

#Creates a file to home directory
fle=/home/tanu/$dt.txt
touch $fle

#Write message to mom file
echo "You have to make mom for meeting" >> $fle
echo "For date $dt" >> $fle
echo $mssg >> $fle
