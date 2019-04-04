#!/bin/bash
#
# Bash script to install required packages or tools after installation of new Operating System.
#
#  Authour: Anji Babu Kapakyala
#           Dept. of Chemistry
#           C/O Prof. Nisanth N. Nair
#           IIT Kanpur, India.
#
#
#  USAGE:  sudo bash package_installer.sh 
#
#
#  Packages List:
#		VMD
#		CHIMERA
#               Paymol
#   		molden
#		WPS Office
#		xfig
#		gv
#		tree
#		gnuplot
#		Autodoc
#		grace
#		Anaconda
#		Imp Libraries [ sudo apt-get install csh flex patch gfortran g++ make xorg-dev libbz2-dev zlib1g-dev libboost-dev libboost-thread-dev libboost-system-dev ffmpeg]
#         	Amber
#		Gromacs
#		Plumed
#		ParmEd
#		LateX
# 		SSH server
#		gwenview
#		mendely desktop
#		gimp
#		Teamviewer
#		sublimetext3 ot Atom
#		git
#               Dropbox Desktop Clint
# 		VLC
#		mutt
#		shc
#		pdftk
#		Trash-Cli
#		Google-Chrome
#		Franz Messenger
#		Okular
#		Shutter
#		Sayonara   : Music Player
#		Krita	   : Paint for ubuntu (from sudo ap-get install krita)
#		snapd
#		Spotify (using snap)
#		Youtube-dl  : Youtube downloader
#=======================================================================#
#  Defining Colors
red=$(tput setaf 1)
grn=$(tput setaf 2)
ylw=$(tput setaf 3)
blu=$(tput setaf 4)
pur=$(tput setaf 5)
cyn=$(tput setaf 6)
reset=$(tput sgr0)
bold=$(tput bold)
#-----------------------------------------------------------------------#
# Check internet connection before starting installations
# Download packages by webpages using wget
# wget "http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_10.1.0.6757_amd64.deb"						  #WPS OFFICE#
# wget "http://mgltools.scripps.edu/downloads/downloads/tars/releases/REL1.5.6/mgltools_i86Linux2_1.5.6.tar.gz"				  #ATODOC#
# wget "https://download.sublimetext.com/sublime_text_3_build_3176_x64.tar.bz2"								  #SUBLIMETEXT3#
# wget "https://repo.anaconda.com/archive/Anaconda3-2018.12-Linux-x86_64.sh"								  #ANACONDA#
# wget "https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.19.3-stable_amd64.deb"		  #MENDELEY#
# wget "https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"                                      			  #TEAMVIEWER#
# wget "https://www.cgl.ucsf.edu/chimera/cgi-bin/secure/chimera-get.py?file=alpha/chimera-alpha-linux_x86_64.bin"                         #CHIMERA#
# sudo snap install molden  #ref: https://blog.linuxcoffee.eu/install-molden-5-7-on-ubuntu-16-04/ #					  #MOLDEN#
# git clone "https://github.com/plumed/plumed2.git"											  #PLUMED2#
# wget "https://atom-installer.github.com/v1.34.0/atom-amd64.deb"         								  #ATOM#
# dpkg -i atom-amd64.deb
# wget "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2019.01.31_amd64.deb"  						  #Dropbox Desktop#
# wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"							  #Google-Chrome#
# wget "https://github.com/meetfranz/franz/releases/download/v5.0.0/franz_5.0.0_amd64.deb"						  #FRANZ#
# ( or you can also install using sudo apt-get install franz )

#  From Repositories
#  Paymol, xfig, gv, tree, gnuplot, grace, Imp libraries, gromacs, latex, ssh-server-update,gimp, gwenview, ffmpeg, git, vlc, mutt, youtube-dl, snapd, shutter, okular, pdftk
#  Krita,
#-----------------------#
#How to install:

#sudo add-apt-repository ppa:lucioc/sayonara
#sudo apt-get update
#sudo apt-get install sayonara
#---------------------------#



#-----------------------------------------------------------------------#
function check_for_sudo_privileges() {
root=`id -u`
if [ $root -eq 0 ]; then                      # id -u = 0 for root ( default)
echo "$bold $red Installing as sudo user... $reset"
else
echo
echo "$bold $red Access denied $reset"
echo "$bold $red Sudo privileges are required to install packages $reset"
echo
exit
fi
}
#-------------------------------------------------#
function check_network() {
echo
echo " $bold $ylw Checking for the Network Information $reset "
echo
#ping -c 1 google.com &> /dev/null && echo "$bold Internet    :$bold $red  Connected $reset" || echo "$bold Internet    :$bold $red Disconnected $reset"
#-------------------------------------------------#
ping -c 1 google.com &> /dev/null
if [ $? -eq 0 ]
then
echo "$bold Internet    :$bold $red  Connected $reset"
else
echo "$bold Internet    :$bold $red Not Connected $reset"
echo "$bold $red Fix Network Connection to install packages $reset"
echo "$bold $blu Thank you $reset"
exit
fi
}
#----------------------------------------#
# Update the Repository
function update_repository() {
echo "$bold $red Updating App repository ....$reset"
apt-get update &>/dev/null &
spinner
}
#----------------------------------------#
# Install packages from Ubuntu Repository
function Install_Package() {
echo "$bold $red Installing $1 : $reset"
#Checking for package
dpkg -l $1 &>/dev/null
if [ $? -eq 0 ];then
echo "$bold $grn $1 $reset $bold $red has alredy Installed. $reset"
else
# Installing Now
apt-get install $1 &>/dev/null &
spinner
if [ $? -eq 0 ]
then
echo "$bold $grn $1 $reset $bold $red Installed. $reset"
else
echo "$bold $grn $1 $reset $bold $red installation Failed. $reset"
fi
fi
}
#----------------------------------------#
# Install packages from Ubuntu Repository
function Install_Imp_Libraries() {
echo "$bold $red Installing Imp Libraries: $reset"
#Checking for package
# Installing Now
apt-get install csh flex patch gfortran g++ make xorg-dev libbz2-dev zlib1g-dev libboost-dev libboost-thread-dev libboost-system-dev ffmpeg &>/dev/null &
spinner
if [ $? -eq 0 ]
then
echo "$bold $grn Imp Libraries $reset $bold $red Installed. $reset"
else
echo "$bold $grn Imp Libraries $reset $bold $red installation Failed. $reset"
fi
}
#----------------------------------------#
# Install packages from Ubuntu Repository using snap
function Snap_Install() {
echo "$bold $red Installing $1 : $reset"
#Checking for package
dpkg -l $1 &>/dev/null
if [ $? -eq 0 ];then
echo "$bold $grn $1 $reset $bold $red has alredy Installed. $reset"
else
# Installing Now
snap install $1 &>/dev/null &
spinner
if [ $? -eq 0 ]
then
echo "$bold $grn $1 $reset $bold $red Installed. $reset"
else
echo "$bold $grn $1 $reset $bold $red installation Failed. $reset"
fi
fi
}
#---------------------------------------#
#USAGE: (a_long_running_task) &
#spinner
spinner()
{
    local pid=$!
    local delay=0.50
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  "  "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
#        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}
#-----------------------------------------#
# Check whether package has already Installed If yes!, update the package
function Is_installed() {
dpkg -l $1 &>/dev/null
if [ $? -eq 0 ];then
echo "$bold $grn $1 $reset $bold $red has alredy Installed. $reset"
else
echo "$bold $grn $1 $reset $bold $red is not installed. $reset"
fi
}
#----------------------------------------#
# Download packages by webpages using wget
function Download_and_Install_All_Packages() {
mkdir Downloaded_Packages
echo "$bold $grn Dowloading Required Packages ..... Please wait for a while$reset "
#-------------------------WPS OFFICE----------------------------#
 wget "http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_10.1.0.6757_amd64.deb"&>/dev/null &
spinner
if [ $? -eq 0 ];then
echo "$bold $red WPS Office has Dowloaded$reset "
echo "$bold $red WPS Office is Installing....$reset "
dpkg -i wps-office*.deb
else
echo "$bold $red WPS Office has failed to Dowloaded$reset "
fi
#--------------------------MGTOOLS/ AUTODOC----------------------------#
# dpkg -i atom-amd64.deb
# wget "http://mgltools.scripps.edu/downloads/downloads/tars/releases/REL1.5.6/mgltools_i86Linux2_1.5.6.tar.gz" &>/dev/null &
#tar -xvf mgltools_x86_64Linux2_1.5.6.tar.gz
#cd mgltool*
#./intall.sh
#Now export the path of the bin
#export PATH=$PATH:/home/sl302/Software/mgltools_x86_64Linux2_1.5.6/bin
#---------------------------AUTODOCK-------------------------------------
#For autodock and autogrid just export the path of the folder have executables
#export PATH=$PATH:/home/sl302/Software/autodock
#spinner
#echo "$bold $red mgtools has Dowloaded$reset "
# wget "https://download.sublimetext.com/sublime_text_3_build_3176_x64.tar.bz2"				
#-----------------------------------Anaconda Installer---------------#
echo "$bold $red Anaconda Installer is Downloading ....$reset "
wget "https://repo.anaconda.com/archive/Anaconda3-2018.12-Linux-x86_64.sh" &>/dev/null &
spinner
if [ $? -eq 0 ];then
echo "$bold $red Anaconda Installer has Dowloaded$reset "
echo "$bold $red Anaconda Installer is Installing ....$reset "
md5sum Anaconda3*.sh
echo "$bold $red Anacont Press Enter to Install in Home directory$reset "
bash Anaconda3*.sh
else
echo "$bold $red Anaconda Installer has failed Dowloaded$reset "
fi
#---------------------------------MENDELEY DESKTOP-----------------------#
echo "$bold $red Mendely Desktop is Downloading ....$reset "
 wget "https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.19.3-stable_amd64.deb" &>/dev/null &
spinner
if [ $? -eq 0 ];then
echo "$bold $red Mendely has Dowloaded$reset "
echo "$bold $red Mendely is Installing....$reset "
dpkg -i mendeleydesktop*.deb
else
echo "$bold $red Mendeley is failed to Dowloaded$reset "
fi
#---------------------------------------Team Viewer------------------------#
echo "$bold $red Teamviewer is Downloading ....$reset "
wget "https://download.teamviewer.com/download/linux/teamviewer_amd64.deb" &>/dev/null &
spinner
if [ $? -eq 0 ];then
echo "$bold $red Teamviwer has Dowloaded$reset "
echo "$bold $red Teamviewer is Installing....$reset "
dpkg -i teamviewer_*.deb
else
echo "$bold $red Teamviewer is failed to Dowloaded$reset "
fi
#-------------------------------------Chimera---------------------------------# 
echo "$bold $red Chimera is Dowloading ...$reset "
wget "https://www.cgl.ucsf.edu/chimera/cgi-bin/secure/chimera-get.py?file=alpha/chimera-alpha-linux_x86_64.bin" &>/dev/null &
spinner
if [ $? -eq 0 ];then
echo "$bold $red Chimera has Dowloaded$reset "
echo "$bold $red Chimera is Installing....$reset "
chmod +x chimera-alpha-linux_x86_64.bin
echo "$bold $blue Enter the Current Direcry Path here....$reset "
./chimera-alpha-linux_x86_64.bin

#Enter the path of current directory. It will create a folder named chimera and install chimera in it.
#It will also ask to create an universal link then select 1 i.e. ~/bin folder. Then no need to export the path else export the last lines.
#If chimera is not working then export the path.
#current_path="$PWD"
#echo "#Path for Chimera" >> ~/.bashrc
#echo "export PATH=\$PATH:$current_path/chimera/bin" >> ~/.bashrc
else
echo "$bold $red Chimera is failed to Dowloaded$reset "
fi

#-------------------------------------Plumed-------------------#
#echo "$bold $red Chimera has Dowloaded$reset "
# git clone "https://github.com/plumed/plumed2.git" &>/dev/null &
#spinner
#echo "$bold $red Plumed has Dowloaded$reset "
#------------------------------- Atom ------------------------#
echo "$bold $red Atom Editor is Dowloading....!$reset "
 wget "https://atom-installer.github.com/v1.34.0/atom-amd64.deb" &>/dev/null &
spinner
if [ $? -eq 0 ];then
echo "$bold $red Atom Editor has Dowloaded$reset "
echo "$bold $red Atom Editor is Installing....$reset "
dpkg -i atom-amd64.deb
else
echo "$bold $red Atom Editor is failed to Dowloaded$reset "
fi
#--------------------------------- Dropbox Desktop Client---------------------------------#
echo "$bold $red Dropbox Desktop clint is Dowloading....!!!$reset "
wget "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2019.01.31_amd64.deb" &>/dev/null &
spinner
if [ $? -eq 0 ];then
echo "$bold $red Dropbox has Dowloaded$reset "
echo "$bold $red Dropbox is Installing....$reset "
dpkg -i dropbox_2019.01.31_amd64.deb
else
echo "$bold $red Dropbox is failed to Dowloaded$reset "
fi
#---------------------------------------Google Chrome-----------------------------#
echo "$bold $red Google Chrome is Dowloading...!$reset "
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" &>/dev/null &
spinner
if [ $? -eq 0 ];then
echo "$bold $red Google Chrome has Dowloaded .....!$reset "
echo "$bold $red Google Chrome is Installing....$reset "
dpkg -i google-chrome-stable_current_amd64.deb
else
echo "$bold $red Google Chrome is failed to Dowloaded$reset "
fi
# wget "https://github.com/meetfranz/franz/releases/download/v5.0.0/franz_5.0.0_amd64.deb"						  #FRANZ#
# ( or you can also install using sudo apt-get install franz )
mv *.deb *.bin Downloaded_Packages
#mv plumed2 Downloaded_Packages
}
#----------------------------------------#
#   MAIN CODE
#-----------------------------------------#
# Array of packages to install
packages="snapd paymol xfig gv gnuplot grace gromacs tree gwenview gimp git franz vlc mutt youtube-dl shutter okular pdftk krita ffmpeg texlive-latex-extra"
# latex, ssh-server-update
# Checking for Admin privileges
check_for_sudo_privileges
check_network
update_repository
# Install_from_Ubuntu_Repository
#Iteate the loop through PACKAGE_LIST
for package in ${packages};do
Install_Package $package
done
Install_Imp_Libraries
# Install using snap
Snap_Install molden
Snap_Install spotify
# The packages which are not availble at ubuntu repository are can be downloaded and installed.
Download_and_Install_All_Packages
#
#-----------------------------------------#
#    Written By Anji Babu Kapakayala      #
#-----------------------------------------#
