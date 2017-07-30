# bin/bash/
# 遍历文件目录

#对目录操作 参数目录地址
function doSthWhenDir() {
	echo $1 "是一个文件夹"
}

# 对文件操作 文件名称
function doSthWhenFile() {
	echo $1 "是一个文件"
}

# 遍历文件系统
function scanDir() {
	# 切换到当前目录，很有必要，否则后面的路径需要绝对路径
	cd $1
	for curr in `ls $1`; do
		if [[ -d $curr ]]; then 
			doSthWhenDir $curr
			# 切换到$curr目录继续遍历
			cd $curr
			# 此处是完整的路径
			scanDir $1/$curr
			# 返回上级目录
			cd ..
		elif [[ -f $curr ]]; then
			doSthWhenFile $curr
		fi
	done
}


# start shell 
if [[ -d $1 ]]; then
	scanDir $1
else
	echo "请输入路径..."
fi

