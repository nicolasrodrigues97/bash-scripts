#!/bin/bash
for FILE in "$@"
do
read -p 'Output format?
1 - .png
2 - .jpg
3 - .gif
4 - .pdf
5 - .icns (Apple icon format)
6 - .bmp
' output

read -p 'Resolution? (does not matter if the output format is PDF)
1 - Original
2 - Scale down by half the original size
3 - Scale up by two times the original size
' resolution
case "$resolution" in
"1") scale="100%" ;;
"2") scale="50%" ;;
"3") scale="200%" ;;
*) echo "Invalid option." ;;
esac

case "$output" in
"1") convert -resize $scale $FILE output.png ;;
"2") convert -resize $scale $FILE output.jpg ;;
"3") convert -resize $scale $FILE output.gif ;;
"4") convert $FILE output.pdf ;;
"5") convert -resize $scale $FILE output.icns ;;
"6") convert -resize $scale $FILE output.bmp ;;
*) echo "Invalid option.";;
esac
done
