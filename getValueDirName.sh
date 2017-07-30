#! /bin/bash
# get the strings.xml directory name

function isDirExist() {
    if [ -e $1 ]; then
        echo $1 " is exist"
        return 2;
    fi
}

resPath=$1  #res资源文件夹路径
dirs=`find $resPath -type d -name "values-*"`
for dir in $dirs
    do
        echo $dir
        countryCode=${dir##.*values-}
        echo $countryCode >> valuesCountryCode.txt
    done

    # 此种方式会丢失换行符\n 以空白符分割
    codes=`cat valuesCountryCode.txt`

    # 默认的IFS就是空格 所以不用转换
    cd $resPath
    pwd
    for code in $codes
        do
            targetDir="values-"$code
            isDirExist $targetDir
        done
    cd -
    pwd





