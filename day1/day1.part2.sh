#!/bin/bash
#pull list into variable, sort acending order
list="$(cat day1.list.txt |sort -V)"

#Read whole list, during each loop add each value together and subtract total from 2020, check if difference value exists in original list
echo "$list" | while read x; do
  for i in $(echo "$list"); do
    dif=$(echo "2020 - ($x + $i)" | bc)
    if [[ $(echo "$list" | grep "^$dif\$") ]]; then
      echo $x:$i:$dif
      echo $(echo "$x * $i  * $dif" | bc)
      exit 0
    fi
  done
done  
