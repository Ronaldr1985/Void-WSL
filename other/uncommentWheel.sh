#!/bin/bash


# Bash command to uncomment wheel group from sudoers
tmpfile=$(echo $((1 + RANDOM % 10))) 
correctline=$(grep $'%wheel ALL=(ALL) ALL' /etc/sudoers | sed s/#\ //g )
echo $correctline
# Look at using grep -n to get the line number dynamically
(awk -v correctLine="$correctline" '{ if (NR == 82) print correctLine; else print $0}' /etc/sudoers ) > /tmp/$tmpfile && (yes | cp -f /tmp/$tmpfile /etc/sudoers) && rm -rf /tmp/$tmpfile 