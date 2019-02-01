#!/bin/bash
a=`which mutt`
if [ "$?" == "0" ]
then
echo "Mutt has Installed"
else
echo "Mutt has Not Installed"
fi
#echo "$?"
