#!/bin/bash
######################
REMOTE_USER="root"
REMOTE_IP="127.0.0.1"
REMOTE_PORT="22"
REMOTE_PASSWD="12345678"
#######################
#DO NOT EDIT
sshpass_path=$(command -v sshpass)
if ! [ -x "${sshpass_path}" ]; then
    echo "Error: You may not install the sshpass."
else
    REMOTE_DIR=`${sshpass_path} -p ${REMOTE_PASSWD} ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_IP} -p ${REMOTE_PORT} 'bash -s' < remote.sh`
    echo "${REMOTE_DIR}"
fi