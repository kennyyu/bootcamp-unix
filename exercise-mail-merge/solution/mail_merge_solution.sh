#!/bin/bash

# check if command line arguments are provided
# $0 : program name
# $1, $2, $3, ... command line arguments. Example:
#
# ./mail_merge.sh foo bar baz cheese
#
# $0 == ./mail_merge.sh
# $1 == foo
# $2 == bar
# $3 == baz
# $4 == cheese
if [ -z $1 -o -z $2 ]
then
    echo "usage: $0 template-file data-file"
    exit
fi

echo "template file: $1"
echo "data file: $2"

# get command line arguments
# variables must be assigned varname=value (no spaces)
MAIL_FILE=$1
INFO_FILE=$2

# get the mail template
# variables can be assigned the value of the output of a command like so:
template=$(cat $MAIL_FILE)

# create the output directory where the mails will go
OUT_DIRECTORY=out
if [ ! -d $OUT_DIRECTORY ]
then
    mkdir $OUT_DIRECTORY
fi

# set delimiter for csv file
IFS=,

# read the contents of the info file like a CSV file
while read first last item location date sender
do
    # create the customized message by replacing --thing-- with $thing using
    # the sed command
    # note: this substitution won't work if any of the values contain a '/'
    message=$template
    message=$(echo $message | sed -e "s/--first--/${first}/g")
    message=$(echo $message | sed -e "s/--last--/${last}/g")
    message=$(echo $message | sed -e "s/--item--/${item}/g")
    message=$(echo $message | sed -e "s/--location--/${location}/g")
    message=$(echo $message | sed -e "s/--date--/${date}/g")
    message=$(echo $message | sed -e "s/--sender--/${sender}/g")

    # write message to file in the format first-last.txt
    file=$OUT_DIRECTORY/$first-$last.txt
    echo $message > $file
done < $INFO_FILE # feed the contents of the file into the while loop

