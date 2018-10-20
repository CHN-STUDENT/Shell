#!/bin/bash

#######################
PROJECT_NAME="TESTA"
ROOT_DIR="/root/ABC/TEST"
######################


dir_list=`ls -l ${ROOT_DIR} | grep ^d | awk '{print $9}' | grep ${PROJECT_NAME} | sed ':label;N;s/\n/ /;b label'`
#ls -l *| grep ^d | awk '{print $9}' | grep 'TESTA' | sed ':label;N;s/\n/ /;b label'

remote_name=""

#echo ${dir_list}

if [[ "${dir_list}" = "" ]]; then
    mkdir -p "${ROOT_DIR}/${PROJECT_NAME}0"
    remote_name="${ROOT_DIR}/${PROJECT_NAME}0"
else
    for((i=0;i<99999;i++))
    do
 
       if [[ ${dir_list/${PROJECT_NAME}${i}//} != "${dir_list}" ]]; then
            continue
       else
            mkdir -p "${ROOT_DIR}/${PROJECT_NAME}${i}"
            remote_name="${ROOT_DIR}/${PROJECT_NAME}${i}"
            break
       fi
    done
fi

echo ${remote_name}