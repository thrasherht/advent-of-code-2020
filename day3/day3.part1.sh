#!/bin/bash
#set -x

input="$(cat day3.input)"
declare -A map
tree=0
xpos=0

for line in $(echo "$input"); do 
  checkchar=$(echo ${line:$xpos:1})
  #echo "=====" 
  #echo "Line: $count"
  #echo "X:$xpos"
  #echo "Check:$checkchar"
  if [[ $checkchar == '#' ]]; then
    echo "tree"
    ((tree++))
  fi

  newpos=$((xpos+3))
  xpos=$(echo $(($newpos% 31)))
done

echo $tree
