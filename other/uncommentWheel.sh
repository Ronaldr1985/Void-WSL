#!/bin/bash


# Bash command to uncomment wheel group from sudoers
tmpfile=$(echo $((1 + RANDOM % 10))) && \
correctline=$(grep $'%wheel\tALL=(ALL)\tALL' /etc/sudoers | sed s/#\ //g ) && \
(awk -v correctLine="$correctline" '{ if (NR == 107) print correctLine; else print $0}' /etc/sudoers ) > /tmp/$tmpfile && \
(yes | cp -f /tmp/$tmpfile /etc/sudoers) && rm -rf /tmp/$tmpfile