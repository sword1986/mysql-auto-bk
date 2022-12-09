# centos环境mysql数据库自动备份
## 一、定时使用crontabs
安装命令：  
yum install crontabs  

配置定时规则：  
vim /etc/crontab  

在文件尾部添加  
0 3 * * * root /usr/local/db_bk.sh  

启用  
crontab /etc/crontab


## 二、mysql备份使用命令  
mysqldump -u$dbuser -p$dbpwd $dbname | gzip>$bakdir/${dbname}_$date.sql.gz
