# Bash script to INSTALL PLUMED 
#
# USAGE: sh install.sh <filename>
#
#!/bin/bash
#read -p "Enter Zip file :" plumedfolder
#-------------------------------------
file=$1
if [ -f $file ];then            #--------------- if1 starts
echo "$file found "
extension="${file##*.}"
case $extension in
zip)
echo "[Info] unzipping $file ...."
unzip $file;;
gz)
echo "[Info] Extracting $file ...."
tar -xvf $file
*)
echo "Unknown or NEW extension of file";;
esac
#folder=`echo "${zipfile%.*}"`
folder=`basename $file .tar.gz`
#echo "$folder"
cd $folder
path=`pwd`
#echo "$PATH"
echo " Configuring $folder..."
./configure --prefix=$path
if [ $? -eq '0' ] ;then          #--------------- if2 starts
echo " Configuration Done."
source $path/sourceme.sh
echo " Source sourceme.sh Done !."
make -j 10
if [ $? -eq '0' ] ;then          #----------------if3 starts
echo " Complilation Successful. !"
make install
if [ $? -eq '0' ] ;then          #----------------If4 starts
echo " Installation Successful. !"
cd ../
cat >> ~/.bashrc << EOF
source $path/sourceme.sh
EOF
else
echo " Installation Failed. !"
fi                               #----------------IF4 ends	
else
echo " Compilation Failed. !"
fi 				 #----------------IF3 ends
else
echo " Configuration Failed. !"  #----------------If2 Ends
fi
else
echo "$zipfile could not found. !"
fi				 #----------------If1 ends
#---------------------------------------#
#   Written By ANJI BABU KAPAKAYALA	#
#---------------------------------------#



