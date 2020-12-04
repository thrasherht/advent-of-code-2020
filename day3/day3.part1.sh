#!/bin/bash
#set -x

input="$(cat day3.input)"
tree=0
xpos=1

for line in $(echo "$input"); do 
  checkchar=$(echo ${line:$(($xpos-1)):1})
  if [[ $checkchar == '#' ]]; then
    #echo "tree"
    ((tree++))
  fi

  newpos=$((xpos+3))
  xpos=$(echo $(($newpos% 31)))
done

echo $tree
