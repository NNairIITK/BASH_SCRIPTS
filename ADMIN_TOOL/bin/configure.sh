#!/bin/bash
path=$(pwd)
echo "$path"
#  check for Mutt package
#  check for Python

mkdir bin
shc -f server_admin.sh
mv server_admin.sh.x bin
cd bin
mv server_admin.sh.x server_admin
chmod 777 server_admin
cd ../

 
