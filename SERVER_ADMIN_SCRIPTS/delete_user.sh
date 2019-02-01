# Bash Script to delete a user from Linux system as root.
#
# Authour : ANJI BABU KAPAKAYALA
#           IIT KANPUR.
#
#!/bin/bash
root=`id -u`
#text Colours
txtred=$(tput setaf 1)
txtgrn=$(tput setaf 2)
txtylw=$(tput setaf 3)
txtblu=$(tput setaf 4)
txtpur=$(tput setaf 5)
txtcyn=$(tput setaf 6)
txtrst=$(tput sgr0)
yes="y"
function header()  {
echo; echo "$txtred=========================================$txtrst"
echo "$txtred $@ $txtrst" 
echo "$txtred=========================================$txtrst"
}
function remove_user() {
    header " $txtred    Removing User $txtrst "
    read -p "$txtblu Enter username : $txtrst" username
    egrep "^$username" /etc/passwd >/dev/null
    if [ $? -eq 0 ]; then
#     userdel -r $username        
     read -p " $txtred WARNING : Are you sure to remove user $username ?? [y/n] : $txtrst" choice
     [ $yes != "$choice" ] &&  echo "$txtblu  Exiting...Bye.$txtrst" && exit ||   userdel -r $username  &&  echo "$txtblu $username has removed Successfully .$txtrst"      
    else
       echo -e " $txtblu \nUser Ac. $username Doesn't exists. ! $txtrst"       
    fi
}
function booter() {
echo 
header " $txtred Written By ANJI BABU KAPAKAPAYALA $txtrst"
}
#------Main
if [ $(id -u) -eq 0 ]; then
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
