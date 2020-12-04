#!/bin/bash
#pull list into variable, sort acending order
list="$(cat day1.list.txt |sort -V)"

#Read whole list, during each loop subtract item from 2020 and see if difference value exists in original list
echo "$list" | while read value; do
  dif=$(echo "2020 - $value" | bc)
  if [[ $(echo "$list" | grep "^$dif\$") ]]; then
    echo $value:$dif
    echo $(echo "$value * $dif" | bc)
    exit 0
  fi
done  
