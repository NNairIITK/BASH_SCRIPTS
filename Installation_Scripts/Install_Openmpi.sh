
#  A Bash script to download and install the openmpi for linux.
#
#  Authour:   Anji Babu Kapakayala
#	      C/O Prof. Nisanth Nair
#             Dept. of Chemistry
#	      IIT Kanpur, India.
#
#
#  USAGE:  bash Install_Openmpi.sh
#
#!/bin/bash
#--------------------------OPENMPI------------------------------------
function Install_openmpi() {
# Download openmpi
wget "https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.1.tar.bz2"
tar -xvf openmpi-4.0.1.tar.bz2
mv openmpi-4.0.1 openmpi
cd openmpi
current_dir=$(pwd)
./configure --prefix=$current_dir
if [ $? -eq '0' ];then
echo "Configuration Done. ! "
make all
make install
	if [ $? -eq '0' ];then
	echo "Installation Done. ! "
	else
	echo "Installation Failed! "
	exit
	fi
#-----
#Now export the path of the bin
cat >> ~/.bashrc <<EOF
#-------------------Open mpi--------------#
export PATH=$PATH:$current_dir
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$current_dir/lib
#-----------------------------------------#
EOF
cd ..
else
echo "Configuration Failed! "
exit
fi
}
#------------------------------------------------#
#             Main Code Starts 			 #
#------------------------------------------------#
Install_openmpi
#-----------------------------------------------#
#     ANJI BABU KAPAKAYALA  		        #
#-----------------------------------------------#
