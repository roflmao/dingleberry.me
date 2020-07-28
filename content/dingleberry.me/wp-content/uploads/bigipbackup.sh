#!/bin/bash
HOSTNAME=`bigpipe system hostname | awk '{ print $6 }'`
DATE=`date +_%d_%m_%Y`
OUTPUTDIR="/var/tmp/backup/"

#cleanup, in case of retention/no retention locally
#do find $OUTPUTDIR -type f -mtime +7 -exec rm -- {} \;
#to keep 7 days of backup locally
/bin/rm $OUTPUTDIR/*
echo "Cleaned backupdir, running new backup"

#making backup-data
/bin/bigpipe config save $OUTPUTDIR$HOSTNAME$DATE.ucs
echo "Bigip config saved to $OUTPUTDIR"

#disting
/usr/bin/rsync -a --delete /var/tmp/backup bigipbackup@10.0.10.100:
echo "DIST'ed the data to backupserver"
echo "World domination!"
exit 0
