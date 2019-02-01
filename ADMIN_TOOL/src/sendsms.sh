#!/bin/bash
red=$(tput setaf 1)
grn=$(tput setaf 2)
ylw=$(tput setaf 3)
blu=$(tput setaf 4)
pur=$(tput setaf 5)
cyn=$(tput setaf 6)
rst=$(tput sgr0)
echo ""
echo " ========================================="
echo  "$red  ANJI BABU SMS SERVICE $rst"
echo " ========================================="
python smsonline.py
echo ""
notify-send "ANJI BABU SERVICES" "SMS has been sent."
echo " Your SMS has been sent. "
echo " ========================================"
#echo "     ANJI BABU KAPAKAYALA                "
#echo " ========================================"
 

