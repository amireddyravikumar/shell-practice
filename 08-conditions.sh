#!/bin/bash

#1/bin/bash
NUM1=$1
NUM2=20
# gt - greater than
# lt - less than
# eq - equals to
# ne - not equals to
# ge - greater than or equals to
# le - less than or equals to

if [ $NUM1 -gt $NUM2 ]
then
    echo "$NUM1 is greater than $NUM2"
elif [ $NUM1 -eq $NUM2 ] 
then
    echo "$NUM1 is equals $NUM2"
else 
    echo "$NUM1 is less equals $NUM2"
fi