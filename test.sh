#!/bin/bash

#./attendance.sh > ut.txt


#getting 1st occurance line no of the date1
start=$(grep -n $date1 attendance.log | head -1 | cut -d':' -f 1)
#getting last occurance line no of the date2
end=$(grep -n $date1 attendance.log | tail -1 | cut -d':' -f 1)

echo $start
echo $end