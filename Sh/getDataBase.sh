#! /bin/bash
# get database of the specific application

pkg=$1
database=$2

adb shell "su -c '
    cd /data/data/$pkg/databases
    ls
    pwd
    cp $database /sdcard
    '
"

# delete old file
if [ -e $database ];then
    rm -r $database
fi

adb pull /sdcard/$database ./

if [ $? -ne 0 ]; then
    echo "retrieve database failed"
else
    echo "retrieve database succeed"
fi
