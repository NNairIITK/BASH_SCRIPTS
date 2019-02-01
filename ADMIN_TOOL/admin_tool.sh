#!/bin/bash
red=$(tput setaf 1)
grn=$(tput setaf 2)
ylw=$(tput setaf 3)
blu=$(tput setaf 4)
pur=$(tput setaf 5)
cyn=$(tput setaf 6)
reset=$(tput sgr0)
bold=$(tput bold)
#---------------------#
# DATE
now=$(date +"%D %r")
#echo "$now"
# Purpose: Display pause prompt
# $1-> Message (optional)
function pause(){
local msg="$@"
[ -z $msg ] && msg="$bold $red Press [Enter] key to continue... $reset"
read -p "$msg" readEnterKey
}

# Purpose - Display a menu on screen
function show_menu(){
#date
echo "-------------------------------------------------------------------------------------------"
echo "$bold $red                                SERVER ADMIN TOOLS                $reset  " 
echo "$bold $blu [K.ANJI BABU ] $red                    Main Menu                   $ylw [ $now ]  $reset  " 
echo "-------------------------------------------------------------------------------------------"
echo "1. System Info.                            11. Add User               ($bold $red root only $reset)"
echo "2. Network Info.                           12. Delete User            ($bold $red root only $reset)"
echo "3. Send Mail                               13. Shutdown Server        ($bold $red root only $reset)"
echo "4. Send SMS                                14. Check Users /Home Space($bold $red root only $reset)"
echo "5. Server Status                           15. Clean /tmp & /swap     ($bold $red root only $reset)"
echo "6. Compress file/folder                    16. Node Status "
echo "7. Decompress Folder                       17. Encrypt/Decrypt File($bold $ylw Protect file $reset)"
echo "8. Make Passwordless Login                 18. Author Details"
echo "9. Make Secure zip ($bold$red Protected $reset)           19. Help"
echo "10.PBS sample script                       20.$bold$pur Exit $reset"
echo "-------------------------------------------------------------------------------------------";echo
}
# Purpose - Display header message
function header(){
local h="$@"
echo "---------------------------------------------------------------"
echo "$bold $red               ${h}                  $reset"
echo "---------------------------------------------------------------"
}
#----booter
function booter() {
echo "---------------------------------------------------------------"
}
#
#-----SYSTEM INFO :
function system_info() {
clear
sh src/system_info.sh
}
#-----HELP
function HELP() {
echo
sh src/HELP.sh 
}
#-----Send Mail
function send_mail() {
a=`which mutt`
if [ "$?" == "0" ]
then
clear
sh src/send_mail.sh
notify-send " ANJI BABU SERVICES" " Mail has been sent Successfully."
#echo "Mutt has Installed"
else
header " Could not found the Mutt Package.
             Install Mutt Package to use this option."
notify-send " ANJI BABU SERVICES" " Mutt has not found."
fi
}
#----Send SMS
function send_sms() {
clear
header "         ANJI BABU SMS SERVICE     " 
python  src/smsonline.py
notify-send " ANJI BABU SERVICES" " SMS has been sent Successfully."
}
#-----Add User
function add_user() {
sh src/add_user.sh
notify-send " ANJI BABU SERVICES" " User Has been added Successfully."
}
#-----Delete User
function delete_user() {
sh src/delete_user.sh
notify-send " ANJI BABU SERVICES" " User Has been Removed Successfully."
}
#----------------
function check_users() {
sh src/check_users_home_space.sh
}
#----Network Information
function network_info() {
sh src/Internet_details.sh
}
#----Create Passwordless login to remote server
function access_free() {
clear
sh src/access-free.sh
notify-send " ANJI BABU SERVICES" " Password less login has been created."
}
#---PBS Sample Script
function pbsscript() {
clear
sh src/pbsscript.sh
}
#----Server Status
function server() {
sh src/server_status.sh
}
#----Node Status
function nodestatus() {
pbsnodes &>/dev/null
if [ "$?" == "0" ]
then
clear
sh src/nodestatus.sh
#notify-send " ANJI BABU SERVICES" " Mail has been sent Successfully."
#echo "Mutt has Installed"
else
echo "$bold $pur  No Multiple Nodes Found. 
                  If It is server , Modify this script acc. to server $reset"
fi
}
#----Authour Info
function author() {
sh src/authour_info.sh
}
#---- Encrypt/Decrypt Your File
function protectfile() {
echo " $bold $pur 1.Encrypt File $reset"
echo " $bold $pur 2.Decrypt File $reset " ;echo
read -p "$bold $blu Choose Option [1-2] :$reset" option
case "$option" in
1)echo; sh src/encrypt.sh ;;
2)echo; sh src/decrypt.sh ;;
*)echo "$bold $red Invalid Option. Bye $reset";echo;exit ;;
esac
}
#==============MAIN PROGRAM=====================#
while true ;do
show_menu
read -p " $bold $ylw Choose Number between [1-20] : $reset" c
case "$c" in
1) system_info
 ;;
2)  network_info  ;;
3)  send_mail ;;
4) header " ANJI BABU SMS SERVICE " 
   send_sms ;;
5) header " Server Status " ; server ;booter ;;
6) echo " Compreess Folder " ;;
7) echo " will update soon..." ;;
8) access_free ;;
10)pbsscript ;;
11)add_user ;;
12) delete_user ;;
14) check_users ;;
16) header " Nodes Status " ;nodestatus; booter ;;
17) header " Encrypt/Decrypt Your File"
    protectfile ;booter;;
18) header " Authour Information ";author;booter;;
19) HELP ;;
20) header " Thanks for Using This Service." 
   exit
;;
*) header "  Invalid Option " ;;
esac
pause
clear
done
