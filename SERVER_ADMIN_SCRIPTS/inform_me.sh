# Bash script to send LOGIN ALERT to your mail and through SMS
# by executing scripts from other remote server.
#
# Authour : ANJI BABU KAPAKAYALA
#            IIT KANPUR, INDIA.
#
# USAGE   : sh inform_me.sh ( add this in .bash_profile)
#
# When ever you login through ssh , you will be notified by mail and sms aswell.
#
# NOTE : Inorder to excecute this script successfuly, make sure you have mutt in other server.

#!/bin/bash
IP="$(echo $SSH_CONNECTION | cut -d " " -f 1)"
HOSTNAME=$(hostname)
USER=$(logname)
NOW=$(date +"%e %b %Y, %a %r")
me="anjibabu"
myip='172.2.0.1'
cat > filesms << EOF1
HPC2013 : Hello,$USER from $IP logged into Your HPC-2013 on $NOW .
EOF1
cat > filemail << EOF2
HPC2013 : Hello,$USER from $IP logged into Your HPC-2013 on $NOW .
EOF2
scp filesms filemail $me@$myip:
#============================#
# running script on remote server
ssh -x $me@$myip << EOF
python ~/bin/sendsms_via_way2sms.py < filesms                  
mutt -s "HPC2013 LOGIN ALERT" anjibabu480@gmail.com < filemail  
EOF
rm filesms
rm filemail

#====================================#
# Written By ANJI BABU KAPAKAYALA    #
#====================================#

