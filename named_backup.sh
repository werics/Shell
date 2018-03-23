#/bin/sh

DATE=`date +%Y%m%d`
DST_DIR='/data/backup/named'
RSYNCDSECRET='/home/wuhesong/rsyncd.secret'


cp -rfp /etc/named.conf $DST_DIR
cp -rfp /var/named/*.db $DST_DIR
cp -rfp /var/named/named.ca $DST_DIR
cp -rfp /var/named/named_dump.db $DST_DIR
cp -rfp /var/named/named.empty $DST_DIR
cp -rfp /var/named/named.localhost $DST_DIR
cp -rfp /var/named/named.loopback $DST_DIR

tar zcvf /data/backup/$DATE.named.tar.gz $DST_DIR

rsync -azuvP --progress /data/backup/*.tar.gz rsyncbak@1.1.1.1::dns --password-file=$RSYNCDSECRET
