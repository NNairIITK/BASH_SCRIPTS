#!/bin/bash
#this script will send mail to given gmail for given option (subject,message,gmailid,ect.)
red=`tput setaf 1`
grn=`tput setaf 2`
ylw=`tput setaf 3`
blu=`tput setaf 4`
reset=`tput sgr0`
bold=`tput bold`

echo "==================================================="
echo "$bold $red  WELCOME TO ANJI BABU MAILING SERVICE $reset"
echo "==================================================="
yes="y"
no="n"
echo ""
read -p "$bold $blu Enter mail-id          :$reset"  mailid                      #enter mailid of reciver
read -p "$bold $blu Enter Subject          :$reset"  subject                    #enter Subject of mail
# if [[ $subject == *"$no"* ]] 
# then
#    echo "You choosed not to enter subject"
# fi
read -p "$bold $ylw Write Message here     :$reset" msg                  # write body of message here
# if [[ $msg == *"$no"* ]] 
# then
#    echo "You have choosed not to enter Message"
# fi
read -p "$bold $red Any Attachments ( y/n) :$reset " choice                           #enter y if you want to attach file else enter n
 if [[ $choice == *"$yes"* ]] 
 then
    read -p "Enter attachment :" filename                           #enter filename of attachment
    echo ""
    echo "sending mail to $mailid"
    echo "$msg" |mutt -s "$subject" $mailid -a $filename   
 else
    echo ""
    echo "$bold $ylw No file is attached$reset" 
    echo "sending mail to $mailid"
    echo "$msg" |mutt -s "$subject" $mailid   
 fi
echo ""
echo "$bold Your mail has been sent.$reset"
notify-send "ANJI BABU MAILING SERVICE" " Your mail has been sent successfulyy."
echo ""
echo "===================================================="
echo "$bold $red  THANKS FOR USING ANJI BABU SERVICES  $reset"
echo "===================================================="
#==========================================================#
#    written by ANJI BABU KAPKAYALA                        #
#==========================================================#
