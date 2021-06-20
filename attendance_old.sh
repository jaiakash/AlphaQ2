#!/bin/bash  

#Loop to get dates when meeting was held
# first=0
# max=0
# while read p
# do
# date=$(echo $p | cut -d' ' -f 3)
# date=${date%?}

# if [ $first -eq 0 ]
# then
#    meetdate[0]=$date
#    #echo ${meetdate[0]}
#    first=1
#    continue
# fi

# if [ ${meetdate[max]} != $date ]
# then
#    ((max++))
#    meetdate[$max]=$date
#    #echo ${meetdate[$max]}
# fi

# done <  attendance.log

# while read p
# do 
# name=$(echo $p | cut -d' ' -f 1)
# date=$(echo $p | cut -d' ' -f 3)
# date=${date%?}
# echo Name is $name and date is $date
# done <  read_file.txt
