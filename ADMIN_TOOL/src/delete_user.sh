# Bash Script to delete a user from Linux system as root.
#
# Authour : ANJI BABU KAPAKAYALA
#           IIT KANPUR.
#
#!/bin/bash
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
yes="y"
function header() {
echo; echo "$red=========================================$rst"
echo "$bold $red        $@     $rst" 
echo "$red=========================================$rst"
}

function remove_user() {
    header "     Removing User  "
    read -p "$bold $blu Enter username : $rst" username
    egrep "^$username" /etc/passwd >/dev/null
    if [ $? -eq 0 ]; then
#     userdel -r $username        
     read -p " $bold $red WARNING : Are you sure to remove user $username ?? [y/n] : $rst" choice
     [ $yes != "$choice" ] &&  echo "$bold $blu  Exiting...Bye.$rst" && exit ||   userdel -r $username  &&  echo "$bold $red  $username has removed Successfully .$rst"      
    else
       echo -e " $bold $blu \nUser Ac. $username Doesn't exists. ! $rst"       
    fi

}
function booter() {
echo 
header "  Written By ANJI BABU KAPAKAPAYALA "
}
#------Main
if [ $(id -u) -eq 0 ]; then
clear
remove_user
booter
else
header  "Accedd Denied ..!
 Only root can delete a user "
 exit
fi
#----------
#========================================#
#   Written By ANJI BABU KAPAKAYALA      #
#========================================#
