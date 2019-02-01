#!/bin/bash
#  Bash Script to get users home disc space of Linux server as root
#
#  Authour  : ANJI BABU KAPAKAYALA
#              IIT KANPUR, INDIA.
#
#  USGAE    : sh check_users_home_space.sh
#

root=`id -u`
#text Colours
red=$(tput setaf 1)
grn=$(tput setaf 2)
ylw=$(tput setaf 3)
blu=$(tput setaf 4)
pur=$(tput setaf 5)
cyn=$(tput setaf 6)
rst=$(tput sgr0)
bold=$(tput bold)
#-------------------
function header() {
echo; echo "$red----------------------------------------------------$rst"
echo "          $bold $red $@ $rst" 
echo "$red----------------------------------------------------$rst"
}
#--------------------
function not_root_user() {
 header "Access denied . 
 Only root can access this fecility."
    exit
}
#---------------------
KB_to_GB=1000000
u_quota=200000000
user_quota=`echo "$(($u_quota/$KB_to_GB))"`
list=`ls /home/`
#--------------------
function home_space() {
u_home=`du -ks /home/$i |awk '{print $1}'`
u_home_GB=` echo "$(($u_home / $KB_to_GB))"`

if [ $u_home -gt $u_quota ];then
echo "$bold $blu $i   :  $ylw $u_home_GB GB $red [ Exceeded User Quota Limit ]$rst"
else
echo "$bold $blu $i   :  $ylw $u_home_GB GB $rst"
fi
}
#----------Main

#---Main
if [ $root -eq 0 ]; then                      # id -u = 0 for root ( default)
header " USER HOME SCPACE ANALYSIS "
for i in $list;do
home_space $i
done
else
not_root_user
fi
echo;echo
header "    Written By ANJI BABU KAPAKAYALA     "
#----------------------------------------#
#     Written By ANJI BABU KAPAKAYALA    #
#----------------------------------------#


