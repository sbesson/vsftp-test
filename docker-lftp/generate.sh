N=${N:-100}

for i in $(seq 1 $N); do
  echo $date > $i
done

find * -type f -exec sha1sum {} \; |  grep -v SHASUMS > SHASUMS
