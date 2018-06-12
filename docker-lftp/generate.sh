#! /bin/sh
THREADS=${THREADS:-10}
USER=${USER:-anonymous}
PASS=${PASS:-idr@openmicroscopy.org}
SERVER=${SERVER:-193.62.55.120:32021}
# 193.62.55.107 is production
NAME=test-$(hostname)

# Generate upload script
echo "open -u $USER,$PASS $SERVER" > /tmp/upload.scp
echo "mkdir /incoming/$NAME" >> /tmp/upload.scp
#echo "set ftp:use-site-utime false" >> /tmp/upload.scp
#echo "set ftp:use-site-utime2 false" >> /tmp/upload.scp
echo "mirror -p --parallel=$THREADS -R /in/ /incoming/$NAME/" >> /tmp/upload.scp
echo "bye" >> /tmp/upload.scp
lftp -f /tmp/upload.scp -d
