#!/bin/bash
#-------------------------
# A auto git pull script
# Author:CHN-STUDENT<chn-student@outlook.com>
#-------------------------
source /etc/profile
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
export TERM=${TERM:-dumb}
#-------------------------

################请设置以下变量部分################

# 要git pull的目录，多个目录请用逗号,分隔
# eg:path="/root/test/path1,/root/test/path2"
path=""


################不要编辑以下脚本部分################

# Check if user is root
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must run this script as root.${CEND}"; exit 1; } 2>&1

# Check if directory path exists
if [[ "${path}" = "" ]]; then 
	echo "${CFAILURE}Error: You must set the correct directory path.Exit.${CEND}" 2>&1
	exit 1
fi

# Check if command git exists
if ! [ -x "$(command -v git)" ]; then
	echo "${CFAILURE}Error: You may not install the git.Exit.${CEND}" 2>&1
	exit 1
fi

# Check where is command git
git_path=`which git`

# Start to deal the set dir
OLD_IFS="$IFS" 
IFS="," 
dir=($path) 
IFS="$OLD_IFS" 

echo "Start to execute this script." 2>&1

for every_dir in ${dir[@]} 
do 
    cd ${every_dir}
	work_dir=`pwd`
	echo "---------------------------------" 2>&1
	echo "Start to deal" ${work_dir} 2>&1
    ${git_path} pull
	echo "---------------------------------" 2>&1
done

echo "All done,thanks for your use." 2>&1
