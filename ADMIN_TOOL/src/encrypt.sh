#!/bin/bash
#file=$1
#------TEXT COLORS
red=`tput setaf 1`
ylw=`tput setaf 3`
blue=`tput setaf 4`
pur=`tput setaf 5`
bold=`tput bold`
rst=`tput sgr0`
#echo " $bold $red RED $ylw YELLOW $blue BLUE $pur PURPLE $rst"
#-------------------
read -p "$bold $ylw Enter File   :$rst" file
echo;echo " $bold $ylw Given File : $red $file $rst"
echo;echo " $bold $pur Give Password in GUI : $rst";echo
gpg -c $file
echo
echo "$bold $ylw $file has encrypted successfully...$rst"
rm -rf $file
mv $file.gpg $file.lock
echo "$bold $red $file has removed.$rst";echo;echo;echo
#echo "$bold $pur  $    Written By ANJI BABU KAPAKAYALA    $ $rst";echo
#---------------------------------#
# Written By ANJI BABU KAPAKAYALA #
#---------------------------------#
