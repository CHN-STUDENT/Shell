#!/bin/bash
#-------------------------
# A mysqldump test script
# Author:CHN-STUDENT<chn-student@outlook.com>
#-------------------------


name="test"

if ! [ -x "$(command -v mysqldump)" ]; then
	echo "[$(date +"%Y-%m-%d %H:%M:%S")] ${CFAILURE}Error: You may not install the mysql server.Skip to backup mysql."
	exit 1
fi

if ! [ -x "$(command -v expect)" ]; then
	echo "[$(date +"%Y-%m-%d %H:%M:%S")] ${CFAILURE}Error: You may not install the expect command.Can not backup mysql."
	exit 1
fi

source mysqldump.sh | sed '/Enter password:/d' > "${name}.sql"


