#!/bin/bash

# Figure out the length of the base URL so that we can extract
# the name of the file later by cutting off the base URL.
cutpoint=$(echo "http://ecx.images-amazon.com/images/I/" \
    | wc -m \
    | grep '[0-9]\{1,\}' --only-matching)

# Make the directory for images. The "-p" option means
# make all the nested subdirectories if they don't already exist.
# e.g. mkdir -p foo/bar/baz will make the "foo", "bar", and "baz"
# directories if they don't already exist.
mkdir -p images

# 1. Get the HTML from amazon for the search query "ocaml"
# 2. Find all images that start with http://ecx.images-amazon.com/images/I/
# 3. For each image
#        chop off the base URL (leaving only the name) and save it
#        in a variable called "suffix"
#        download the image, using the chopped off name
#        e.g. http://ecx.images-amazon.com/images/I/foo.jpg --> foo.jpg
#
# Other notes:
# The "--silent" option on curl suppresses extraneous output.
# The "-O" option on wget downloads a file to the given file name (e.g. image/foo.jpg)
curl --silent http://www.amazon.com/s/\&field-keywords\=ocaml \
    | grep 'http://ecx.images-amazon.com/images/I/[0-9A-Za-z\.\_\,\%\\-]\{0,\}.jpg' --only-matching \
    | while read image
      do
          suffix=$(echo $image | cut -c $cutpoint-)
          wget $image -O images/$suffix
      done
