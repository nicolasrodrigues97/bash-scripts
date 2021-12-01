#!/bin/bash
if find $(pwd) -mindepth 1 | read; then
echo "Folder not empty"
for f in *\ *; do mv "$f" "${f// /_}"; done
for i in $(shasum -a 256 * | sort | awk '{ print $2, $1 }' | uniq -df 1 | awk '{ print $1 }' ); do rm $i; done
else
echo "Folder empty"
fi
