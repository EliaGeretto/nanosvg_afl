#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

EXECUTABLE=svg_parser
MINIMIZED_PATH=minimized
CRASHES_PATH=findings/crashes

COUNT=0
for CRASH in $MINIMIZED_PATH/id*
do
	./$EXECUTABLE $CRASH &> /dev/null
	EXIT=$?

	echo -n "$CRASH: "
	if [ $EXIT == 1 ]
	then
		COUNT=$((COUNT + 1))
		echo -e "${RED}fail${NC}"
	else
		echo -e "${GREEN}pass${NC}"
	fi
done

echo
echo "$COUNT errors found."

if [ $COUNT == 0 ]
then
	echo 'Well done! Running full suite...'
	echo
	for CRASH in $CRASHES_PATH/id*
	do
		./$EXECUTABLE $CRASH &> /dev/null
		EXIT=$?

		echo -n "$CRASH: "
		if [ $EXIT == 1 ]
		then
			COUNT=$((COUNT + 1))
			echo -e "${RED}fail${NC}"
		else
			echo -e "${GREEN}pass${NC}"
		fi
	done

	echo
	echo "$COUNT errors found."
fi
