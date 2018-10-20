#!/bin/bash
######################
REMOTE_USER="root"
REMOTE_IP="127.0.0.1"
REMOTE_PORT="22"
REMOTE_PASSWD="12345678"
WORK_DIR="/root/ABC"
#######################
#DO NOT EDIT
sshpass_path=$(command -v sshpass)
if ! [ -x "${sshpass_path}" ]; then
    echo "Error: You may not install the sshpass."
else
    REMOTE_DIR=`${sshpass_path} -p ${REMOTE_PASSWD} ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_IP} -p ${REMOTE_PORT} 'bash -s' < remote.sh`
    sshpass -p ${REMOTE_PASSWD} sftp -o StrictHostKeyChecking=no -P ${REMOTE_PORT}  -b - ${REMOTE_USER}@${REMOTE_IP} <<SFTPPASSWORD
        cd ${REMOTE_DIR}
        put ${WORK_DIR}/*.c
        put ${WORK_DIR}/*.t3c
        put ${WORK_DIR}/makefile1   
        put ${WORK_DIR}/makefile2
        put ${WORK_DIR}/pbs_sub
        exit
SFTPPASSWORD
    sed -i '2i REMOTE_DIR="'${REMOTE_DIR}'"' run.sh
    ${sshpass_path} -p ${REMOTE_PASSWD} ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_IP} -p ${REMOTE_PORT} 'bash -s' < run.sh
    sed -i '/REMOTE_DIR=*/d' run.sh
fi