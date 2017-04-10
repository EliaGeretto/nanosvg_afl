#!/bin/bash

EXECUTABLE=svg_parser
FINDINGS_PATH=findings
TESTS_PATH=tests

CC=afl-gcc
MAKE=make
FUZZ=afl-fuzz

verify_command () {
       echo -n "Looking for $1... "
       if ! type "$1" &> /dev/null
       then
               echo "Not found."
               exit 1
       else
               echo "Found."
       fi
}

verify_command $CC
verify_command $MAKE
verify_command $FUZZ

echo -n "Looking for $EXECUTABLE... "
if [ ! -f "$EXECUTABLE" ]
then
       echo "Not found."
       echo "Building..."
       $MAKE
else
       echo "Found."
fi

mkdir -p $FINDINGS_PATH

afl-fuzz -m 800 -i $TESTS_PATH -o $FINDINGS_PATH -- ./$EXECUTABLE @@
