#!/bin/bash
######################
REMOTE_USER="root"
REMOTE_IP="127.0.0.1"
REMOTE_PORT="22"
REMOTE_PASSWD="12345678"
WORK_DIR="/root/ABC/TEST2"
#######################
#DO NOT EDIT
sshpass_path=$(command -v sshpass)
if ! [ -x "${sshpass_path}" ]; then
    echo "Error: You may not install the sshpass."
else
    REMOTE_DIR=`${sshpass_path} -p ${REMOTE_PASSWD} ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_IP} -p ${REMOTE_PORT} 'bash -s' < find.sh`
	echo ${REMOTE_DIR}
	for everydir in ${REMOTE_DIR}
	do
		sshpass -p ${REMOTE_PASSWD} ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_IP} -p ${REMOTE_PORT} " cd ${everydir} && ./draw.out "
		LOCAL_DIR=${WORK_DIR}/$(basename ${everydir})
		mkdir -p ${LOCAL_DIR}
		sshpass -p ${REMOTE_PASSWD} sftp -o StrictHostKeyChecking=no -P ${REMOTE_PORT}  -b - ${REMOTE_USER}@${REMOTE_IP} <<DOWNLOAD
				lcd ${LOCAL_DIR}
				cd ${everydir}
				get *.bmp
				exit
DOWNLOAD
	done
fi
