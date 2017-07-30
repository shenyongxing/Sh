#! /bin/bash
# get error log of plus and rename
# 注意要放到相应项目的根目录执行，并且同时更改sd错误日志路径

dirName=$1
dir="log"
if [ -e $dir ];then
	rm -r $dir
fi

if [ -z $dirName ]; then
    echo "please input the right package name"
    exit 1
fi

adb pull /sdcard/$dirName ./log

for file in `find ./log -type f -name "*.txt"`
	do	
		echo $file
		time=${file#*-}
		time=${time%_*t}
		echo $time

		utc_date=`date -r $time +"%m-%d_%H:%M.%S"`
		mv $file ./log/error_log_$utc_date.txt
		echo $?
	done


