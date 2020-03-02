# Bash script to download and install cmake-15.2 
#
#  Authour: Anji Babu Kapakayala
#	    C/O Prof. Nisanth Nair
#           Dept. of Chemistry
#           IIT Kanpur, India.
#
# 
#  USAGE: sh Install_cmake.sh
#!/bin/bash
# Download cmake from web
function download_cmake() {

 wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2.tar.gz

}
# Extract tar file
function extract_tarfile() {
tar -zxvf cmake-3.15.2.tar.gz
}
# Compile and Install cmake as root
function install_cmake() {
cd cmake-3.15.2
./bootstrap
make
echo " Enter Root Password for Successful Installation:"
sudo make install
#----------------
  if [ $? -eq '0' ] ;then    
        echo " Congrats ! Installaton Sucessful !!"
  else
        echo " Sorry ! Installaton Failed !!"
  fi
#----------------
}
#--------------------------------------------#
#   Installing Cmake			     # 
#--------------------------------------------#
download_cmake
extract_tarfile
install_cmake
