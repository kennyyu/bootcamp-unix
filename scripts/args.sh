#!/bin/bash

# Comments must start with the '#' character
# Command line arguments are found in $0, $1, $2, ...
# Note that $0 is always the name of the current program.

# '-z $1' will return true if the first argument is NOT set.
# '-o' will perform a logical OR
if [ -z $1 -o -z $2 ]
then
    echo "usage: $0 arg1 arg2"
    exit
fi

echo "hello $1 and $2!"
