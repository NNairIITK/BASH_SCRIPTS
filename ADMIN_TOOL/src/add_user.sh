#  Bash Script to add a new user to Linux system as root
#
#  Authour  : ANJI BABU KAPAKAYALA
#              IIT KANPUR, INDIA.
#
#  USGAE    : sh add_user.sh
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
function header() {
echo; echo "$red=========================================$rst"
echo "          $bold $red $@ $rst" 
echo "$red=========================================$rst"
}
function add_user() {
    header " Adding New User "
    read -p "$bold $pur Enter username : $rst" username         # Choose username
    read -s -p "$bold $pur Enter password : $rst" password      # Choose Password, -s tag will not echo password when typed in terminal
    egrep "^$username" /etc/passwd >/dev/null    # /etc/passwd stores all the info about existed user accounts.
    if [ $? -eq 0 ]; then                         # Checking Whether given username has exist or not and redirect data to black hole
        echo "$bold $ylw $username exists! $rst"        
        exit 
    else
        pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)               # encrypting given password
        useradd -m -p $pass $username                                               # Adding user with given details
       [ $? -eq 0 ] && echo "$bold $red User has been added to system! $rst" || echo "$bold $red Failed to add a user! $rst"
   fi
}
function not_root_user() {
 header "Access denied . 
 Only root may add a user to the system"
    exit 
}
#---Main
if [ $root -eq 0 ]; then                      # id -u = 0 for root ( default)
clear
add_user
else
not_root_user
fi
header "    Written By ANJI BABU KAPAKAYALA     "
#============================================================#
#           Written By ANJI BABU KAPAKAYALA                  #
#============================================================#
