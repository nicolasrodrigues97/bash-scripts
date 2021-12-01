# bash-scripts
Some useful bash scripts.

**clonepurge: (OSX - requires coreutils)**
Compares SHA256 hashes of files within a directory and deletes duplicates.

**video-convert: (requires ffmpeg)**
Converts a video file to a chosen common video format with a profile of your choice using ffmpeg.


Usage: 

Make the script executable:
`sudo chmod +x ./video-convert`

Run the script: 
`./video-convert filename.extension`

**image-convert: (requires imagemagick)**
Converts an image file to a chosen common format and scales it up/down using ImageMagick.


Usage: 

Make the script executable:
`sudo chmod +x ./image-convert`

Run the script: 
`./image-convert filename.extension`

In order to make PDF convertions:

Make the following change under ImageMagick's policy file:

`sudo nano /etc/ImageMagick-6/policy.xml`

or

`sudo nano /etc/ImageMagick/policy.xml`

under

```xml
<policy domain="coder" rights="none" pattern="PDF" />
```
change it to 
```xml
<policy domain="coder" rights="read|write" pattern="PDF" />
```

**Observations:**

The output of `ls -l /bin/sh` for my system is dash. This means that POSIX-compliant scripts will run faster than using bash (eg. Arch linux's default setting). However, scripts written for BASH that make use of ["BASHisms"](https://mywiki.wooledge.org/Bashism) (features not defined by POSIX) won't work in dash, and some other setups.

Clonepurge doesn't seem to delete off all duplicate files at once. It may need to be executed multiple times in order to get rid of all duplicates (which is not ideal and thus needs fixing).

**To-do:**

- Add cut functionality to video-convert 

More scripts to be added soon.
