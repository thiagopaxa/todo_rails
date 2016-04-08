#!/bin/bash

# copy yml.example to yml files
FILE_PATH=$(echo $0 | sed 's,/init.sh,,')

for yml in `ls ${FILE_PATH}/*.example`; do
  cp $yml `echo $yml | sed 's,\.example,,'`
done
