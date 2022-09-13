---
title: "[Linux] Backup your code and database in one script"
date: 2021-12-27T00:00:00+07:00
tags: ['linux', 'vps']
---
Please replace the params `<backup-path>`, `<db-host>`, `<db-port>`, `<db-user>`, `<db-password>`, `<db-name>`, `<site-name>`, `<source-code-path>`.

```bash
#!/bin/bash
# Backup database
export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=`date +"%d%b%Y"`
DB_BACKUP_PATH='<backup-path>'
MYSQL_HOST='<db-host>'
MYSQL_PORT='<db-port>'
MYSQL_USER='<db-user>'
MYSQL_PASSWORD='<db-password>'
DATABASE_NAME='<db-name>'
SITE='<site-name>'
SOUCE_CODE_BACKUP_PATH='<source-code-path>'
BACKUP_RETAIN_DAYS=30
mkdir -p ${DB_BACKUP_PATH}/${TODAY}
echo "Backup started for database - ${DATABASE_NAME}"
mysqldump -h ${MYSQL_HOST} \
    -P ${MYSQL_PORT} \
    -u ${MYSQL_USER} \
    -p${MYSQL_PASSWORD} \
    ${DATABASE_NAME} | gzip > ${DB_BACKUP_PATH}/${TODAY}/${DATABASE_NAME}-${TODAY}.sql.gz
if [ $? -eq 0 ]; then
    echo "Database backup successfully completed"
else
    echo "Error found during backup"
    exit 1
fi
# Backup souce code
echo "Backup started for source code - ${SITE}"
tar -cvpzf ${DB_BACKUP_PATH}/${TODAY}/${SITE}-${TODAY}.tar.gz ${SOUCE_CODE_BACKUP_PATH} > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Source code backup successfully completed"
else
    echo "Error found during backup"
    exit 1
fi
# Remove backups older than {BACKUP_RETAIN_DAYS} days
DBDELDATE=`date +"%d%b%Y" --date="${BACKUP_RETAIN_DAYS} days ago"`
if [ ! -z ${DB_BACKUP_PATH} ]; then
    cd ${DB_BACKUP_PATH}
    if [ ! -z ${DBDELDATE} ] && [ -d ${DBDELDATE} ]; then
        rm -rf ${DBDELDATE}
    fi
fi
```

If you get `Git error: "Host Key Verification Failed"` error, please run this command:

```bash
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
```