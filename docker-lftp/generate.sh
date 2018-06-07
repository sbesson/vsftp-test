#! /bin/sh
uuid="$(cat /proc/sys/kernel/random/uuid)"
N=${N:-100}
M=${M:-10}
USER=${USER:-anonymous}
PASS=${PASS:-allowed@example.org}
SERVER=${SERVER:-ftpserver}

# Create data and checksum
mkdir -p /tmp/$uuid && cd /tmp/$uuid 
for i in $(seq 1 $N); do
  echo $date > /tmp/$uuid/$i
done
find * -type f -exec sha1sum {} \; |  grep -v SHASUMS > SHASUMS

# Generate upload script
echo "open -u $USER,$PASS $SERVER" > /tmp/upload.scp
echo "mkdir /incoming/$uuid" >> /tmp/upload.scp
echo "mirror --parallel=$M -R /tmp/$uuid /incoming/$uuid" >> /tmp/upload.scp
echo "bye" >> /tmp/upload.scp
