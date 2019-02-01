# BASH SCRIPT TO SEND YOU NOTIFICATION WHEN REMOTE SERVER IS DOWN.
#
# AUTHOUR : ANJI BABU KAPAKAYALA
#            IIT KANPUR,INDIA.
#
#!/bin/bash
#ping -c1 -W1 ip_addr || echo 'server is down'
server=172.26.xx.xxx
mailid='anjibabu480@gmail.com'
ping -c1 -W1 -q $server &>/dev/null
status=$( echo $? )
if [[ $status == 0 ]] ; then
    echo " Tokyo is up!"
else
    echo "Tokyo is down"
    #you can trigger this script to send you updates of server using mailing service
    # mailx -s "Server $server is down" -t "$mailid" < /dev/null
    # mutt -s "Server $server is down" $mailid < /dev/null
fi
#reference:http://stackoverflow.com/questions/8937663/shell-script-to-check-wether-a-server-is-reacha
#reference :http://unix.stackexchange.com/questions/56340/bash-script-to-detect-when-my-server-is-down-or-offline

#======================================================================#
#                        ANJI BABU KAPKAYALA                           #
#======================================================================#


