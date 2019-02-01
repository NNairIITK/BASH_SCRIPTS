#!/bin/bash
now=$(date +"%e %b %y, %a %r")
num=`pbsnodes|grep "np ="|wc -l`
pbsnodes > dummy
sed -i 's/compute-0/Node/g' dummy 
sed -i 's/job-exclusive/Busy/g' dummy 
sed -i 's/     state =/Status = /g' dummy 
free=`grep "  free" dummy|wc -l`
busy=`grep " Busy" dummy|wc -l`
echo ""
#echo "Nodes Status of Tokyo"
echo -e "\e[31;44m***** Nodes Status of Tokyo *****\e[0m"
echo "================================="
echo "Queue : work"
echo ""
echo "No of Nodes: $num  Procs/node: 16"
echo "================================="
echo ""
echo |egrep -B 1 "Status ="  dummy >> file
j=0
for  i in `cat file|grep -v '\-\-'|cut -d "=" -f 2`;
do
        j=`expr $j + 1`
        k=`expr $j % 2`
        if [ $k = 1 ];
        then
                echo -n "$i  ";
        else
                echo $i;
        fi
done
#grep -B 1 -w "Status ="  dummy
#sed '' dummy
echo "================================="
echo -e "\e[31;44m No of Busy nodes : $busy  \e[0m"
echo -e "\e[31;44m No of free nodes : $free   \e[0m"
rm dummy
rm file
echo ""
echo "$now"
echo ""
#echo "$LOGNAME"
#echo -e "\e[31;44m***** $LOGNAME *****\e[0m"
echo -e "\e[31;44m***** written by ANJI BABU *****\e[0m"
echo "================================="
#=======================================================#
#         Written By Anji Babu Kapakayala               #
#=======================================================#         







