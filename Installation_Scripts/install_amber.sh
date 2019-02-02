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
#	folder=`echo "${zipfile%.*}"`
     folder=`basename $file .tar.gz`
	#echo "$folder"
	cd amber14
	path=`pwd`
	echo "$PATH"
#-----------
# export AMBER environment
	export AMBERHOME=$path
	echo " Configuring $folder..."
	./configure -mpi gnu
		 if [ $? -eq '0' ] ;then    #-------------------if2 starts
			echo " Configuration Done."
			source $path/amber.sh
			echo " Source sourceme.sh Done !."
#			make -j 10
#	 		if [ $? -eq '0' ] ;then   #---------------if3 starts
#					echo " Complilation Successful. !"
					make install
		 				if [ $? -eq '0' ] ;then  #------------If4 starts
							echo " Installation Successful. !"
							cd ../
cat >> ~/.bashrc << EOF
#-------------------------#
#  AMBER ENVIRONMENT      #
export AMBERHOME=$path
source $path/sourceme.sh
#-------------------------#
EOF
						else
							echo " Installation Failed. !"
						fi                     #---------------IF4 ends	

#			else
#					echo " Compilation Failed. !"
#			fi 					#----------------IF3 ends
		else
	echo " Configuration Failed. !"   #--------------If2 Ends
	echo " Configuring without X11 Libraries. !"   #--------------If2 Ends
	./configure -mpi gnu -noX11
		 				if [ $? -eq '0' ] ;then  #------------If4 starts
							echo " Configuration Successful. !"
							make install
							 if [ $? -eq '0' ] ;then 
echo " Installation Sucess. !"
cat >> ~/.bashrc << EOF
#-------------------------#
#  AMBER ENVIRONMENT      #
export AMBERHOME=$path
source $path/sourceme.sh
#-------------------------#
EOF
							else
							echo " Installation Failed. !"
							fi
						else
							echo " Installation Failed. !"
						fi                     #---------------IF4 ends	


		fi
else
	echo "$zipfile could not found. !"
fi       #-----------If1 ends
#---------------------------------------#
#   Written By ANJI BABU KAPAKAYALA	#
#---------------------------------------#



