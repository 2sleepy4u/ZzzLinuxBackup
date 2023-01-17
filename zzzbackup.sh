#! /bin/bash

while getopts from:to: flag
do
    case "${flag}" in
        from) from=${OPTARG};;
        to) to=${OPTARG};;
    esac
done

wget https://raw.githubusercontent.com/rubo77/rsync-homedir-excludes/master/rsync-homedir-excludes.txt -O /var/tmp/ignorelist
rsync -aAXv --exclude-from=/var/tmp/ignorelist $from $to --info=progress2


