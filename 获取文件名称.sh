# /bin/bash
# 获取文件名
# author shenxing

if [[ -n $1 ]]; then
	# %是从右向左匹配最短的字符并删除，此时注意*号在.的右边
	prefix=${1%.*}	
	echo $prefix
else
	echo "请在shell文件名后面输入文件名称"
fi