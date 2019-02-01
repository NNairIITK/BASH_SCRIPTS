#!/bin/bash
red=`tput setaf 1`
rst=`tput sgr0`
bold=`tput bold`
ylw=`tput setaf 3`
blue=`tput setaf 4`
#file=$1
user=`logname`
read -p "$bold $red Enter File Name : $rst" file
#echo $user
echo "$bold $ylw Searching for $red $file $rst $bold $ylw..... [ Please Wait ] $rst"
num=`find /home/$user -type f -name $file|wc -l`
if [ $num -ne 0 ];then
echo "--------------------------------------------------"
echo "$bold $ylw File Name :$red $file.        $ylw [ $blue $num $ylw files found ] $rst"           
echo "--------------------------------------------------"
find /home/$user -type f -name $file 
find /home/$user -type f -name $file > dummy
echo
echo "$bold $ylw No of Files Found :$red $num $rst"
echo "--------------------------------------------------"
else
echo "--------------------------------------------------"
echo "$bold $red No file Found $rst"
echo "--------------------------------------------------"
fi
read -p "$bold $blue Do You want to save data into file ? [$red y/n $blue]: $rst" opt
if [ $opt == "y" ];then
mv dummy data_$file
echo "$bold $red Above DATA has been stored in file : $ylw data_$file $rst "
else
rm dummy
fi
#--------------------------------------------------#
#      Written by ANJI BABU KAPAKAYALA             #
#--------------------------------------------------#
