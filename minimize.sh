#!/bin/sh

EXECUTABLE=svg_parser
MINIMIZED_PATH=minimized
CRASHES_PATH=findings/crashes

mkdir -p $MINIMIZED_PATH

echo 'Minimizing crashes...'

for CRASH in $CRASHES_PATH/*
do
        NAME=`echo $CRASH | grep -o 'id:[0-9]*'`
        if [ "$NAME" != "" ]
        then
                echo "Minimizing $CRASH..."
                afl-tmin -m 800 -i $CRASH -o $MINIMIZED_PATH/$NAME -- \
                  ./$EXECUTABLE @@ 2> /dev/null
        fi
done

echo 'Eliminating duplicates...'

for FIRST in $MINIMIZED_PATH/*
do
        for SECOND in $MINIMIZED_PATH/*
        do
		if [ "$FIRST" != "$SECOND" ]
                then
                        if cmp -s $FIRST $SECOND
                        then
                                echo "Removing $SECOND..."
                                rm "$SECOND"
                        fi
                else
                        break
                fi
        done
done

mkdir -p $MINIMIZED_PATH/out

echo 'Generating ASAN output...'
for CRASH in $MINIMIZED_PATH/id*
do
	./$EXECUTABLE $CRASH 2> "$MINIMIZED_PATH/out/$(basename $CRASH).out"
done
