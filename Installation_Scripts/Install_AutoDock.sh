
#  A Bash script to download and install the mgtools and Autodockpackages.
#
#  Authour:   Anji Babu Kapakayala
#	      C/O Prof. Nisanth Nair
#             Dept. of Chemistry
#	      IIT Kanpur, India.
#
#
#  USAGE:  bash Install_Autodock.sh
#
#!/bin/bash
#--------------------------MGLtoolbox------------------------------------
function Install_mgltools() {
# Download mgltools
wget "mgltools.scripps.edu/downloads/downloads/tars/releases/REL1.5.6/mgltools_i86Linux2_1.5.6.tar.gz"
tar -xvf mgltools_*.tar.gz
mv mgltools_i86Linux2_1.5.6 MGTOOLS
cd MGTOOLS
./install.sh
cd bin
current_dir=$(pwd)
#echo $current_dir
#Now export the path of the bin
cat >> ~/.bashrc <<EOF
#-------------------MGL TOOLS--------------#
export PATH=$PATH:$current_dir
EOF
cd ../..
}
#---------------------------AUTODOCK-------------------------------------
function Install_Autodock() {
wget "http://autodock.scripps.edu/downloads/autodock-registration/tars/dist426/autodocksuite-4.2.6-x86_64Linux2.tar"
tar -xvf autodocksuite-4.2.6-x86_64Linux2.tar
mv x86_64Linux2 AutoDock
cd AutoDock
current_dir=$(pwd)
#echo $current_dir
#For autodock and autogrid just export the path of the folder have executables
cat >> ~/.bashrc<<EOF
#-------------------AutoDock--------------#
export PATH=$PATH:$current_dir
EOF
cd ..
}
#------------------------------------------------#
#             Main Code Starts 			 #
#------------------------------------------------#
Install_mgltools
Install_Autodock
#-----------------------------------------------#
#     ANJI BABU KAPAKAYALA  		        #
#-----------------------------------------------#
