#! /bin/bash

#memory=`free -h`

#echo $memory

memory(){
	local used=$(free -h | awk 'FNR == 2 {print $3}')
	local total=$(free -h | awk 'FNR == 2 {print $2}')
	cat << EOF

----
memory usage : ${used} / ${total}
----
EOF
}

memory
