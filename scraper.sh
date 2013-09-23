#!/bin/bash

cutpoint=$(echo "http://ecx.images-amazon.com/images/I/" | wc -m | grep '[0-9]\{1,\}' --only-matching); mkdir -p images; curl --silent http://www.amazon.com/s/\&field-keywords\=ocaml | grep 'http://ecx.images-amazon.com/images/I/[0-9A-Za-z\.\_\,\%\\-]\{0,\}.jpg' --only-matching | while read image; do suffix=$(echo $image | cut -c $cutpoint-); wget $image -O images/$suffix; done
