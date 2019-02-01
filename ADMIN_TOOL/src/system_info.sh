#!/bin/bash
red=$(tput setaf 1)
grn=$(tput setaf 2)
ylw=$(tput setaf 3)
blu=$(tput setaf 4)
pur=$(tput setaf 5)
cyn=$(tput setaf 6)
rst=$(tput sgr0)
bold=`tput bold`
#---------------------#
# Purpose: Display pause prompt
# $1-> Message (optional)
function pause(){
local msg="$@"
[ -z $msg ] && msg="$bold $blu Press [Enter] key to continue...$rst"
read -p "$msg" readEnterKey
}
function header() {
echo "---------------------------------------------"
echo " $bold $pur         $@     $rst  "
echo "---------------------------------------------"
}
function booter() {
echo
echo "---------------------------------------------"
echo
}
#---Menu
function menu() {
echo " ============================================================================"
echo "  $bold           $red           SYSTEM INFORMATION                  $rst "
echo " ============================================================================"
echo
echo " 1.Show IP                             6. Disk Space "
echo " 2.OS Info.                            7. Free Memory"
echo " 3.HostName Info.                      8. Currently Loggedin Users  "
echo " 4.Hardware Info.(lscpu)               9. Top 5 Memory Consuming Processes"
echo " 5.Last Loggin Users                   10.System Uptime "
echo "$bold $pur 11. Back to Main Menu                $rst "
echo
echo " ============================================================================"
echo 
}
while true ;do
menu
read -p "$bold $ylw  Choose option [ 1-10 ] :$rst" opt
case "$opt" in
1) 
#IP info
IP=`/sbin/ifconfig p1p1 |grep "inet addr" |cut -d: -f2|awk '{print $1}'`
echo ""
#cho -e "\e[31;44m***** IP ADDRESS INFORMATION *****\e[0m"
header  "   IP ADDRESS INFORMATION "
echo 
echo "$bold $ylw IP address : $pur $IP $rst"
booter
;;
2)
#OS Info
echo ""
header  "  OS INFORMATION "
echo
lsb_release -a
booter;;
3)
# -Hostname information:
header " HOSTNAME INFORMATION "
hostnamectl
booter
;;
4) header " Hardware Information "
echo
lscpu
booter;;
5) header " Last logins "
echo
 last
booter 
;;
6) 
# -File system disk space usage:
header " FILE SYSTEM DISK SPACE USAGE "
echo 
df -h >> dummy
sed -i '$d' dummy
sed '' dummy
#df -h |sed -i '$d'
last=`df -h |grep "/home"`
echo "$bold $ylw $last $rst "
rm dummy
booter
;;
7)
# -Free and used memory in the system:
header   "   FREE AND USED MEMORY   "
free -h
booter
;;
10)
# -System uptime and load:
header " SYSTEM UPTIME AND LOAD "
uptime
booter
;;
8)
# -Logged-in users:
header " CURRENTLY LOGGED-IN USERS "
who
booter
;;
9)
# -Top 5 processes as far as memory usage is concerned
header "  TOP 5 MEMORY-CONSUMING PROCESSES"
ps -eo pid,%mem,%cpu,comm --sort=-%mem | head -n 6
booter
;;
11 ) exit ;;
*) echo "$bold $red  INVALID OPTION $rst" ;;
esac
#==================================
pause
clear
done
