#!/bin/bash
for FILE in "$@"
do
read -p 'Output format?
1 - .mp4
2 - .webm
3 - .mkv
4 - .mov
5 - .avi
6 - .gif
' output

read -p 'Profile?
1 - baseline (Lower compression - old/mobile devices)
2 - main (Normal, most common profile)
3 - high (High compression - Most efficient, web streaming/long-term storage)
' profile

case "$output" in
"1") ffmpeg -i $FILE -f mp4 -vcodec copy -preset fast -profile:v $profile -acodec copy output.mp4 ;;
"2") ffmpeg -i $FILE -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis -profile:v $profile output.webm ;;
"3") ffmpeg -i $FILE -f matroska -vcodec copy -acodec copy -profile:v $profile output.mkv ;;
"4") ffmpeg -i $FILE -acodec copy -vcodec copy -f mov -profile:v $profile output.mov ;;
"5") ffmpeg -i $FILE -vcodec copy -acodec copy -profile:v $profile filename.avi ;;
"6") ffmpeg -i $FILE output.gif ;;
*) echo "Invalid option." ;;
esac
done
