# Bash Script to Increase Resolution of Image captured from VMD
#
# Authour : ANJI BABU KAPAKAYALA
# 
# USAGE   :  sh Double_Tachyon_Resolution.sh <filename>
#
#!/bin.bash
red=`tput setaf 1`
grn=`tput setaf 2`
ylw=`tput setaf 3`
pur=`tput setaf 4`
rst=`tput sgr0`
bold=`tput bold`
echo
echo "--------------------------------------"
echo " $bold $red  Increasing Resolution $rst "
echo "--------------------------------------"
file=$1
echo ;echo " $bold Given File         : $ylw $file $rst "
f1=`grep "Resolution" $file |awk '{print $2}'`
f2=`grep "Resolution" $file |awk '{print $3}'`
echo
echo "$bold $ylw Old Resolution     :$red $f1  $f2 $rst" 
f11=`echo $f1*2 |bc -l`
f22=`echo $f2*2|bc -l`
echo "$bold $ylw Current Resolution :$red $f11 $f22 $pur [ Doubled ]$rst"
sed -i '/^Resolution/d' $file
sed -i "11i Resolution $f11 $f22 " $file
echo
echo "$bold $red Processing $file.tga $rst"
echo "--------------------------------------"
tachyon  -aasamples 12 $file -format TARGA -o $file.tga
echo ""
echo "$bold $ylw Thanks . Bye $rst"
echo ""
echo "---------------------------------------"
echo "$bold $red Written By ANJI BABU KAPAKYALA $rst"
echo "---------------------------------------"
#===========================================#
#           ANJI BABU KAPKAYALA             #
#===========================================#



