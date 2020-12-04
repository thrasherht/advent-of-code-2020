#!/bin/bash
input="$(cat day2.input)"

while read count char pass; do
  #Grab positions and letter to check
  pos2=$(echo $count | awk -F'-' {'print $2'})
  pos1=$(echo $count | awk -F'-' {'print $1'})
  checkletter=$(echo $char | sed 's/://g')

  #break down password
  passbreak="$(echo $pass | sed 's/./\0\n/g' | grep -v ^$)"
  pos1char=$(echo "$passbreak" | sed -n ${pos1}p)
  pos2char=$(echo "$passbreak" | sed -n ${pos2}p)

  #Isolate and count instances of checkletter
  checkcount=$(printf "$pos1char\n$pos2char" | grep -c $checkletter)

  #Verified if password checks against rules
  if [[ $checkcount  == 1 ]]; then
    #echo "Password Good $pass"
    ((good++))
  elif [[ $checkcount == 2 ]] || [[ $checkcount == 0 ]]; then
    #echo "Password Bad $pass"
    ((bad++))
  fi

done < <(echo "$input")

#output totals
echo "===Counts==="
echo "Good passwords: $good"
echo "Bad password: $bad"
