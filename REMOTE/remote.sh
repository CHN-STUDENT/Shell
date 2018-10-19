#!/bin/bash

#######################
PROJECT_NAME="PROJECT"
ROOT_DIR="/root/ABC"
######################

flag="N"
dir_list=`ls -l ${ROOT_DIR} |grep ^d |awk '{print $9}'| sed ':label;N;s/\n/ /;b label'`
FIND_NAME=""
for every_dir in ${dir_list}
do
    reslut=$(echo ${every_dir} | grep "${PROJECT_NAME}")
    if [[ "$reslut" != "" ]]; then
        FIND_NAME="${every_dir}"
        flag="Y"
        continue
    fi
    if [[ "$reslut" = "" && "${flag}" = "Y" ]]; then
       break
    fi
done

REMOTE_DIR=""

if [[ "${FIND_NAME}" = "" ]];then
    mkdir -p "${ROOT_DIR}/${PROJECT_NAME}1"
    REMOTE_DIR="${ROOT_DIR}/${PROJECT_NAME}1"
else
    INDEX=$(echo ${FIND_NAME} | grep -o '[0-9]*')
    NEW_INDEX=$((${INDEX}+1))
    mkdir -p "${ROOT_DIR}/${PROJECT_NAME}${NEW_INDEX}"
    REMOTE_DIR="${ROOT_DIR}/${PROJECT_NAME}${NEW_INDEX}"
fi

echo ${REMOTE_DIR}