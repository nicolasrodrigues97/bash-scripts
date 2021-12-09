#!/bin/bash
read -p 'qual o string?
' string
echo "$string"
find . -type f -name '*.txt' -exec \
    grep -q $string "{}" \; -exec cp "{}" out \;
