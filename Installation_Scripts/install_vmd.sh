
#---------------------------------------------#
# BASH script to install VMD 
#
# Authour: Anji Babu Kapakayala
#          C/O Prof. Nisanth N. Nair
#          Dept. of Chemistry
#          IIT Kanpur, India.
# 
#
# UASGE: sh install_VMD.sh <vmd*.tar.gz> 
#        It need to be run as root admin
#
#
#---------------------------------------------#
#!/bin/bash
#read -p "Enter Zip file :" plumedfolder
file=$1
if [ -f $file ];then               #------------ if1 starts
        echo "$file found "
        extension="${file##*.}"
                case $extension in
                        zip)
                        echo "[Info] unzipping $file ...."
                        unzip $file;;
                        gz|bz2)
                        echo "[Info] Extracting $file ...."
                        tar -xvf $file;;
                        *)
                        echo "Unknown or NEW extension of file";;
                        esac
#       folder=`echo "${zipfile%.*}"`
     folder=`basename $file .tar.gz`
mv $folder VMD
cd VMD

#Default path /usr/local/bin or change the path in configure file $INSTALL_LIBRARY_DIP $INSTALL_LIBRARY_BIN
./configure
cd src
echo " Enter Root Password for Successful Installation:"
sudo make install
#----------------
  if [ $? -eq '0' ] ;then    #-------------------if2 starts
        echo " Congrats ! Installaton Sucessful !!"
  else
        echo " Sorry ! Installaton Failed !!"
  fi
#----------------
else
        echo "$zipfile could not found. !"
fi       #-----------If1 ends
#--------------------------------------------------------#
#   Written By ANJI BABU KAPAKAYALA                      #
#--------------------------------------------------------#
