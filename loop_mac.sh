#!/bin/bash

if [ ! $1 ]; then

   echo 'ERROR: Need to apply loop param'    

   exit  

fi



# Start from target date (set this to your desired end date)

current_date="2018-01-31"



for i in $(seq 1 $1)

do

   export GIT_AUTHOR_DATE="$current_date 13:00:00"

   export GIT_COMMITTER_DATE="$current_date 13:00:00"

   sh ./push.sh

   # Subtract 1 day (macOS date syntax)

   current_date=$(date -j -v-1d -f "%Y-%m-%d" "$current_date" "+%Y-%m-%d")

done


