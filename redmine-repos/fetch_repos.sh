#!/bin/sh

cd /usr/repos
for folder in $(ls) 
do
    if [ -d $folder ]; then
        echo $folder
        cd $folder 
        git fetch --all --prune
        cd ..
    fi
done
