#!/bin/bash

input="$(cat day2.input)"

while read count char pass; do
  high=$(echo $count | awk -F'-' {'print $2'})
  low=$(echo $count | awk -F'-' {'print $1'})
  checkletter=$(echo $char | sed 's/://g')

  #break down password
  passbreak="$(echo $pass | sed 's/./\0\n/g' | grep -v ^$ | sort |uniq -c)"
  checklcount=$(echo "$passbreak" |grep $checkletter | sed 's/^ *//g' |awk {'print $1'})

  if [[ $checklcount -ge $low ]] && [[ $checklcount -le $high ]]; then
    #echo "Password good"
    ((good++))
  else
    #echo "Password bad ($low $high $char $pass)"
    ((bad++))
  fi
done < <(echo "$input")

echo "===Counts==="
echo "Good passwords: $good"
echo "Bad password: $bad"
