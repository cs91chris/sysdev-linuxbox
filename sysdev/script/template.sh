#!/bin/bash

source ~/.script/color.conf 2> /dev/null


if [ "$1" == "--help" ]
then
	echo -e "this script required 2 argument:"
	echo -e "\t1 file ${orange}model${reset}"
	echo -e "\t2 file ${orange}name${reset} (optional)"
	exit 0
fi


FILE=""
MODEL=$1
NAME=$2
PATH_MODEL=~/.models
[ "$2" == "" ] && NAME=$1


echo -e "${green}"

for d in $(ls $PATH_MODEL)
do
	if [ -f $PATH_MODEL/$d/$MODEL.* ]; then
		FILE=$NAME.$MODEL
		cp -v $PATH_MODEL/$d/$MODEL.* $FILE
		break

	elif [ -f $PATH_MODEL/$d/$MODEL ]; then
		FILE=$NAME
		cp -v $PATH_MODEL/$d/$MODEL $FILE
		break
	fi
done

sleep 0.5s
echo -e "${reset}"


[ "$FILE" != "" ] && $EDITOR $FILE || {
	echo -e "template $MODEL does ${red}not exist${reset}!"
	exit 1
}

