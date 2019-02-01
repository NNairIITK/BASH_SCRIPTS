#!/bin/bash
read -p "Enter Folder Name:" folder
#echo $folder
echo "$folder is processing please wait ....."
echo ""
tar -cvjf $folder.tar.bz2  $folder 
echo ""
echo "Coverted to tar.bz2 format"
echo ""
echo -e "\e[31;44m Written by ANJI BABU KAPAKAYALA \e[0m"

