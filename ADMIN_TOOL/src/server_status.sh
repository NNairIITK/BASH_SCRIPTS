#!/bin/bash
#ping -c1 -W1 ip_addr || echo 'server is down'
red=`tput setaf 1`
grn=`tput setaf 2`
ylw=`tput setaf 3`
blue=`tput setaf 4`
rst=`tput sgr0`
bold=`tput bold`
#echo " $bold $red RED $ylw YELLOW $blue BLUE $rst"
echo
read -p  "$bold $ylw Eneter Server IP : $rst" server
#server=172.31.100.63
ping -c1 -W1 -q $server &>/dev/null
status=$( echo $? )
if [[ $status == 0 ]] ; then
  echo
  echo "$bold $red Server is up! $rst";echo
else
    echo
    echo "$bold $red Server is down $rst";echo
fi
#------------------------------------------#
#    Written By ANJI BABU KAPAKAYALA       #
#------------------------------------------#
