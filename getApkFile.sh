#! /bin/bash
# get the apk install file
# 如果执行时permisssion denied，则先尝试adb root命令

adb shell "su -c '
        cd /data/app
        ls
    '
"
read -p "please select the package you want retrieve: " targetPkgName

#targetPkgName="com.blue.battery-2.apk"
#targetPkgName="com.snapchat.android-1.apk"

adb shell "su -c '
        cd /data/app
        ls
        cp $targetPkgName /sdcard
    '
"

if [ -e $targetPkgName ];then
    rm -r $targetPkgName
fi

adb pull /sdcard/$targetPkgName ./

if [ $? -ne 0 ]; then
    echo "retrieve apk failed"
else
    echo "retrieve apk succeed"
fi
