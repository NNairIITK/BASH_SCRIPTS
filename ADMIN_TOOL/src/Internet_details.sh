# Bash script to print Nerwork Information.
#
# Authour : ANJI BABU KAPAKAYALA
#             IIT KANPUR, INDIA.
#
#!/bin/bash
red=`tput setaf 1`
grn=`tput setaf 2`
ylw=`tput setaf 3`
blue=`tput setaf 4`
reset=`tput sgr0`
bold=`tput bold`
echo
echo " --------------------------------- "
echo " $bold $ylw      Network Information $reset "
echo " --------------------------------- "
echo
#ping -c 1 google.com &> /dev/null && echo "$bold Internet    :$bold $red  Connected $reset" || echo "$bold Internet    :$bold $red Disconnected $reset"
net=`ping -c 1 google.com &>/dev/null`
 if [ $? -eq 0 ]; then
echo "$bold Internet    :$bold $red  Connected $reset"
else
echo "$bold Internet    :$bold $red Disconnected $reset"
fi
#/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'
#IP=`/sbin/ifconfig p1p1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
IP=`/sbin/ifconfig |grep -A4 "encap:Ethernet"|grep "inet addr" | cut -d ":" -f2 |awk '{ print $1}'`
#cho -e "Your IP address : $IP "
#echo -e "\e[31;44m Your IP Address : $IP \e[0m"
#
domine=`cat /etc/resolv.conf | sed  '/^#/d' | awk '{print $2}'|sed -n '1p'`
DNS1=`cat /etc/resolv.conf | sed  '/^#/d' | awk '{print $2}'|sed -n '2p'`
DNS2=`cat /etc/resolv.conf | sed  '/^#/d' | awk '{print $2}'|sed -n '3p'`
Mask=`/sbin/ifconfig |grep -A4 "encap:Ethernet" |grep 'Mask' |awk '{ print $4 }' |cut -d ":" -f2`
Gateway=`/sbin/ifconfig |grep -A4 "encap:Ethernet" |grep 'Mask' |awk '{ print $3 }' |cut -d ":" -f2`
host=`hostname`
user=`who |head -n 1|awk '{print $1}'`
echo "$bold IP Address  :$blue $IP $reset"
echo "$bold Username    :$blue $user $reset"
echo "$bold Host        :$blue $host $reset"
echo "$bold Domine      :$blue $domine $reset"
echo "$bold Gateway     :$blue $Gateway $reset"
echo "$bold Subnet Mask :$blue $Mask $reset"
echo "$bold DNS 1       :$blue $DNS1 $reset"
echo "$bold DNS 2       :$blue $DNS2 $reset"
echo " --------------------------------- "
#===============================================================#
#             Written By ANJI BABU KAPAKAYALA                   #
#===============================================================#
                                                            
