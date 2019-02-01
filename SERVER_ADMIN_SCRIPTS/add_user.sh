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
txtred=$(tput setaf 1)
txtgrn=$(tput setaf 2)
txtylw=$(tput setaf 3)
txtblu=$(tput setaf 4)
txtpur=$(tput setaf 5)
txtcyn=$(tput setaf 6)
txtrst=$(tput sgr0)
function header() {
echo; echo "$txtred=========================================$txtrst"
echo "$txtred $@ $txtrst" 
echo "$txtred=========================================$txtrst"
}
function add_user() {
    header " Adding New User "
    read -p "Enter username : " username         # Choose username
    read -s -p "Enter password : " password      # Choose Password, -s tag will not echo password when typed in terminal
    egrep "^$username" /etc/passwd >/dev/null    # /etc/passwd stores all the info about existed user accounts.
    if [ $? -eq 0 ]; then                         # Checking Whether given username has exist or not and redirect data to black hole
        echo "$username exists!"        
        exit 
    else
        pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)               # encrypting given password
        useradd -m -p $pass $username                                               # Adding user with given details
       [ $? -eq 0 ] && echo "$txtred User has been added to system! $txtrst" || echo "$txtred Failed to add a user! $txtrst"
   fi
}
function not_root_user() {
 header "Access denied . 
 Only root may add a user to the system"
    exit 
}
#---Main
if [ $root -eq 0 ]; then                      # id -u = 0 for root ( default)
add_user
else
not_root_user
fi
header "    Written By ANJI BABU KAPAKAYALA     "
#============================================================#
#           Written By ANJI BABU KAPAKAYALA                  #
#============================================================#
