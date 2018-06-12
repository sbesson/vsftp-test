mkdir in 
cd in
for x in $(seq 1 1000); do (uuidgen;uuidgen;uuidgen) > $(uuidgen); done
