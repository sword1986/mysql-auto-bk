#!/bin/bash
bakdir=/backup
date=$(date +%Y_%m_%d_%H)
dbname='db_name' #数据库名称
dbuser='root' #数据库用户
dbpwd='123456'  #数据库密码
if [ ! -d $bakdir ]
then
        mkdir -p $bakdir
fi
mysqldump -u$dbuser -p$dbpwd $dbname | gzip>$bakdir/${dbname}_$date.sql.gz
#调用上边定义的变量
find $bakdir -mtime +30 -type f | xargs rm -rf #找到//home/backup下的文件，删除30天之前的文件
