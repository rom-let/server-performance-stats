#! /bin/bash

#memory=`free -h`

#echo $memory

memory(){
	local used=$(free -h | awk 'FNR == 2 {print $3}')
	local total=$(free -h | awk 'FNR == 2 {print $2}')
	local free=$(free -h | awk 'FNR == 2 {print $7}')
	local totalorder=$(echo ${total} | sed 's/[^a-zA-Z]*//g')
	local freeorder=$(echo ${free} | sed 's/[^a-zA-Z]*//g')
	local usedorder=$(echo ${used} | sed 's/[^a-zA-Z]*//g')
	local totalunit=$(echo ${total} | sed 's/[a-z]*[A-Z]*//g')
	local usedunit=$(echo ${used} | sed 's/[a-z]*[A-Z]*//g')
	local freeunit=$(echo ${free} | sed 's/[a-z]*[A-Z]*//g')
	local usedpercent=$(echo "${usedunit} * 100.0 / ${totalunit}" | bc)
	local freepercent=$(echo "${freeunit} * 100.0 / ${totalunit}" | bc)
	cat << EOF

----
memory usage :	${used}	/	${total}	(${free}	free)
	in % :	${usedpercent}%	/ 	100%	(${freepercent}%	free)
---
EOF
}

memory
