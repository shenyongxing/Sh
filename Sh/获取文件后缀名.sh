# /bin/bash
# 获取文件后缀名
# author shenxing

if [[ -n $1 ]]; then
	# 注意这种写法是正常的，##从左到右匹配最长的
	suffix=${1##*.}	
	echo $suffix
else
	echo "请在shell文件名后面输入文件名称"
fi