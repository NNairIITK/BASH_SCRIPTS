# Bash Script to create passwordless login for remote servers.
#
# AUTHOUR  :  ANJI BABU KAPAKAYALA
#		c/O Prof.Nisanth N. Nair
#              IIT KANPUR, INDIA.
#
# USAGE    : sh Create_Passwordless_Access-to-Remote_server.sh (Then follow instructions)
#
#!/bin/bash
red=`tput setaf 1`
grn=`tput setaf 2`
ylw=`tput setaf 3`
blue=`tput setaf 4`
reset=`tput sgr0`
bold=`tput bold`

echo "$bold $blue===================================================$reset"
echo "$bold $red WELCOME TO ANJI BABU SCRIPTING SERVICE $reset"
echo "$bold $blue===================================================$reset"
cd ~
#STEP1
#Create authentication ssh-keygen keys on remote server
read -p "$bold $ylw Eneter remote server username:$reset " user
read -p "$bold $ylw Eneter remote server IP: $reset" serverip
echo ""
echo  "$bold $red  If files are already exits, then dont over write. press n $reset"
ssh-keygen -t rsa
#STEP2 
#Create .ssh directory on remote  server
echo "$bold $blue  Plese Enter your semote server Password $reset"
ssh $user@$serverip mkdir -p .ssh
#enter password here
#STEP3
#Upload generated public keys to remote server
echo "$bold $blue Enter your semote server Password Again $reset"
cat .ssh/id_rsa.pub|ssh $user@$serverip 'cat >> ~/.ssh/authorized_keys' &>null
#enter password here
echo ""
#STEP4
#Set permissions on remote servers
ssh $user@$serverip "chmod 700 .ssh ; chmod 640 ~/.ssh/authorized_keys" &>null
#enter password here
#
#STEP5
#now you can login or copy files without password
#ssh -X $user@$serverip
echo "$bold $red  Congrats....!!!  $reset"
echo "$bold $red  Now you can login your server without password by using below command $reset"
echo ""
echo "$bold $grn ssh -X $user@$serverip $reset"
echo""
rm null
echo "$bold $blue====================================================$reset"

#========================================#
#       Written by anjibabu              #
#=============================================================================================#
#Reference : http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/  #
#=============================================================================================#
