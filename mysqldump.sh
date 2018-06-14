
MYSQL_USER="root"
MYSQL_SERVER="127.0.0.1"
MYSQL_SERVER_PORT="3306"
db_name="TEST"
MYSQL_PASSWD="123456"
mysqldump_path=$(command -v mysqldump)


if [ -x ${mysqldump_path}  ]; then

    expect <<- EOF
    set timeout 5
	spawn -noecho ${mysqldump_path} -u${MYSQL_USER} -h${MYSQL_SERVER} -P${MYSQL_SERVER_PORT} ${db_name} -p 
	expect {
        "Enter password:" { send "${MYSQL_PASSWD}\r"; exp_continue }
    }
EOF

fi


