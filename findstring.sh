#!/bin/bash
read -p 'string?
' string
echo "$string"
find . -type f -name '*.txt' -exec \
    grep -q $string "{}" \; -exec cp "{}" out \;
