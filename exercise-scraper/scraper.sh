#!/bin/bash

# This is the base url for all the images. To use this variable,
# you have to prefix the variable with the '$' character, e.g.
# echo $BASE_URL
BASE_URL="http://ecx.images-amazon.com/images/I/"

# TODO
# 1. Find the length of BASE_URL, and save the value in variable
# called "cutpoint"



# When you are done with (1), uncomment the following line below.
# This extracts any extraneous whitespace and leaves only the
# numeric characters left in cutpoint.
#
# UNCOMMENT THIS LINE WHEN DONE WITH (1)
# cutpoint=$(echo $cutpoint | grep '[0-9]\{1,\}' --only-matching)

# Name of the directory containing the images.
IMAGE_DIR="images"

# TODO
# 2. Make the directory for IMAGE_DIR if it doesn't already exist.
# Hint: man mkdir



# Url to scrape images from
REQUEST_URL="http://www.amazon.com/s/&field-keywords=ocaml"

# TODO
# 3. Get the html for REQUEST_URL, and save it in a variable called "html"



# Since I haven't shown you what a *regular expression* is (take CS121 to find
# out), I'll extract all the links for you with following command.
#
# UNCOMMENT THIS LINE WHEN DONE WITH (3)
# urls=$(echo $html | grep 'http://ecx.images-amazon.com/images/I/[0-9A-Za-z\.\_\,\%\\-]\{0,\}.jpg' --only-matching)

# We feed into the loop all the urls that we just collected.
# For each url, we will download the file into the truncated file name
# (the url without the BASE_URL part).
#
# Here, we use a for loop because we know exactly the list of things that
# we want to loop over (urls). The variable "url" will be the current url
# in our list of urls.
for url in $urls
do
    # TODO
    # 4. Use the "cut" command to extract the part of the url
    # after BASE_URL. Hint: you'll want to use your variable $cutpoint.
    # Save this in a variable called "suffix".



    # TODO
    # 5. Download the image, and save it into the file $IMAGE_DIR/$suffix.
    # Look at the man page for "wget" to figure out the option you need
    # to provide to download something into a specific file name.


    # REMOVE THIS LINE WHEN YOU'RE DONE
    echo "noop"
done



