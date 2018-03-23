#/bin/bash

RNDC='/usr/sbin/rndc dumpdb -cache'
DUMPDB_SRC='/var/named/data/cache_dump.db'
DATE=`date +%Y%m%d%H%M`
DUMPDB_DST='/data/dnslog/cache_dump.db_'$DATE

#cache dump
$RNDC

#wait for cache dump
sleep 30


cp $DUMPDB_SRC $DUMPDB_DST

[root@centos wuhesong]# cat qps_bind.sh 
#/bin/bash

DATETIME=`date '+%F %T'`

N_stats='/var/named/data/named_stats.txt'

QPS_file='/home/wuhesong/qps'

RNDC=`/usr/sbin/rndc stats`

$RNDC

QPS_num=`grep QUERY $N_stats | awk 'END{print $1}'`

echo $DATETIME ' ' $QPS_num >>$QPS_file
