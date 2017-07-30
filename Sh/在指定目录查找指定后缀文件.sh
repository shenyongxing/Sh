# /bin/bash
# 移动某个类型的文件到指定地址

#对目录操作 参数目录地址
function doSthWhenDir() {
	echo "开始遍历" $1 "文件夹"
}

# 对文件操作 文件名称
function doSthWhenFile() {
	suffix=${1##*.}	
	if [[ $suffix = $2 ]]; then
		echo $1
	fi
}

# 遍历文件系统
function scanDir() {
	# 切换到当前目录，很有必要，否则后面的路径需要绝对路径
	cd $1
	for curr in `ls $1`; do
		if [[ -d $curr ]]; then 
			###################
			# doSthWhenDir $curr
			###################
			# 切换到$curr目录继续遍历
			# 此处存在目录切换失败的情况
			cd $curr
			# 此处是完整的路径
			scanDir $1/$curr
			# 返回上级目录y
			cd ..
		elif [[ -f $curr ]]; then
			###################
			doSthWhenFile $curr $2
			###################
		fi
	done
}

if [[ $# -lt 2 ]]; then
	echo "使用格式为: " $0 "文件类型后缀 源地址"
else
	suffix=$1
	sourceDir=$2
	echo "开始遍历当前目录下的指定类型文件..."
	scanDir $sourceDir $suffix
fi