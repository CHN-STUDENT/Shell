#!/bin/bash

#######################

ROOT_DIR="/root/ABC/TEST"

######################


dir_list=`ls -l ${ROOT_DIR} | grep ^d | awk '{print $9}' | sed ':label;N;s/\n/ /;b label'`


for every_dir in ${dir_list}
do
	cd ${ROOT_DIR}/${every_dir}
	if [ -e "finish.txt" ]; then 
		echo ${ROOT_DIR}/${every_dir} 
	fi
done 

