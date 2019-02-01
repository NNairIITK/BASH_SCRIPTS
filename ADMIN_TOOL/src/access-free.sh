# Bash script to Create a Passwordless login to Remote Server (SSH).
#
# Authour  : ANJI BABU KAPAKAYALA
#             IIT KANPUR, INDIA.
#
# Usage    : sh access-free.sh
#
#!/bin/bash
function access_free() {
red=$(tput setaf 1)
grn=$(tput setaf 2)
ylw=$(tput setaf 3)
blu=$(tput setaf 4)
pur=$(tput setaf 5)
cyn=$(tput setaf 6)
rst=$(tput sgr0)
bold=`tput bold`
echo "   ============================================================"
echo "$bold $red         Create Password less Login for Remote Server $rst" 
echo "   ============================================================"
cd ~
echo ""
#STEP1
#Create authentication ssh-keygen keys on remote server
read -p "$bold $pur   Eneter remote server username :$rst " user 
read -p "$bold $pur   Eneter remote server IP       :$rst " serverip 
echo ""
echo "$bold $ylw  [ ****NOTE : If files are already exits, then dont over write. just press n ] $rst"
echo ""
ssh-keygen -t rsa
#STEP2
#Create .ssh directory on remote  server
echo;echo " $bold $red  Enter remote server Password $rst"
ssh $user@$serverip mkdir -p .ssh
#enter password here
#STEP3
#Upload generated public keys to remote server
#echo -e "\e[31;44m  Plese Enter your semote server Password \e[0m"
echo ;echo " $bold $red  Enter Password again $rst"
cat .ssh/id_rsa.pub|ssh $user@$serverip 'cat >> ~/.ssh/authorized_keys'
#enter password here
echo ""
#STEP4
#Set permissions on remote servers
ssh $user@$serverip "chmod 700 .ssh ; chmod 640 ~/.ssh/authorized_keys"
#enter password here
#
#STEP5
#now you can login or copy files without password
#ssh -X $user@$serverip
if [$? == 0]
 then
echo "$bold $pur  Congrats....!!!  $rst"
echo "$bold $pur  You can now login to remote server without password $rst"
else
echo " $bold $pur Sorry !. Failed to create free Access to $user@$serverip. $rst"
echo " $bold $pur Contact , System Admin.$rst"
echo " $bold $pur Bye.! $rst"
echo ""
fi
echo " $bold $blu             Use this command to Check  $rst "
echo " $bold $blu   #------------------------------------------#$rst"
echo " $bold $blu   #      ssh -X $user@$serverip              #$rst"
echo " $bold $blu   #------------------------------------------#$rst"
echo""
echo "   ============================================================"
echo "$bold $ylw                 Written By ANJI BABU KAPAKAYALA $rst" 
echo "   ============================================================"
}
access_free
#========================================#
#       Written by anjibabu              #
#========================================#





