#!/bin/bash
# This script will display the script file for submitting job in tokyo.
#Purpose of Process Usage Information

function pbs_info() {
txtred=$(tput setaf 1)
txtgrn=$(tput setaf 2)
txtylw=$(tput setaf 3)
txtblu=$(tput setaf 4)
txtpur=$(tput setaf 5)
txtcyn=$(tput setaf 6)
txtrst=$(tput sgr0)
bold=$(tput bold)
COLUMNS=$(tput cols)

center() {
        w=$(( $COLUMNS / 2 - 20 ))
        while IFS= read -r line
        do
                printf "%${w}s %s\n" ' ' "$line"
        done
}

centerwide() {
        w=$(( $COLUMNS / 2 - 30 ))
        while IFS= read -r line
        do
                printf "%${w}s %s\n" ' ' "$line"
        done
}

echo "${txtpur}#======================================================================================#${txtrst}"|center
echo "          ${txtpur}#${txtrst}   $bold          ${txtred}PBS Script to Submit Job${txtrst}                                                 ${txtpur}#${txtrst}"|centerwide
echo "${txtpur}#======================================================================================#${txtrst}"|center
echo "${txtpur}#                                                                                      #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     #!/bin/bash                                                               $txtpur     #${txtrst}" |center
echo "${txtpur}#$txtrst  $bold     #PBS -N job-title                                                         $txtpur     #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     #PBS -q work                                                              $txtpur     #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     #PBS -l nodes=1:ppn=16                                                    $txtpur     #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     #PBS -j oe                                                                $txtpur     #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     export I_MPI_FABRICS=shm:tmi                                              $txtpur     #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     export I_MPI_DEVICE=rdma:OpenIB-cma                                       $txtpur     #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     cd \$PBS_O_WORKDIR                                                        $txtpur      #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     export F_UFMTENDIAN=big                                                   $txtpur     #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     cat \$PBS_NODEFILE > pbs_nodes                                            $txtpur      #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     export I_MPI_MPD_TMPDIR=/tmp                                              $txtpur     #${txtrst} "|center
echo "${txtpur}#$txtrst  $bold     MYNP=8                                                                    $txtpur     #${txtrst}"|center
echo "${txtpur}#                                                                                      $txtpur#${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     # Your Executable path should be here.                                    $txtpur     #${txtrst}"|center
echo "${txtpur}#                                                                                     $txtp #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     #$txtred Example$txtrst $bold: For GROMACS Users :                                           $txtpur     #${txtrst}"|center
echo "${txtpur}#                                                                               $txtpur       #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     gmx_mpi grompp -f nvt.mdp -c topol.gro -ptopol.top  -o nvt.tpr   $txtpur              #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold     mpirun -machinefile \$PBS_NODEFILE -np \$MYNP  gmx_mpi mdrun -plumed plumed.dat $txtpur #${txtrst}"|center
echo "${txtpur}#$txtrst  $bold      -v -deffnm nvt -ntomp 16                                              $txtpur        #${txtrst} "|center
echo "${txtpur}#                                                                                      #${txtrst}"|center
echo "${txtpur}#======================================================================================#${txtrst}"|center
echo "${txtpur}#${txtrst}   $bold         ${txtblu} Written By ANJI BABU KAPAKAYALA${txtrst}                                          ${txtpur}#${txtrst}"|center
echo "${txtpur}#======================================================================================#${txtrst}"|center
}
#=============Main
pbs_info
#=============
#PATH=`pwd`
#file="$PATH/submit.sh"
#echo "$file"
# [ -f "$file" ] && mv -f $file #submit.sh#
#================
yes="y"
read -p "$bold ${txtylw} Do you like to Save Script  [y/n] : ${txtrst}"  responce 
#echo "$responce"
if [[ "$yes" ==  *"$responce"* ]]
then
cat >> submit.sh << EOF2
#PBS Script to Submit Job

#!/bin/bash                                                                    
#PBS -N job-title                                                              
#PBS -q work                                                                    
#PBS -l nodes=1:ppn=16                                                         
#PBS -j oe                                                             
export I_MPI_FABRICS=shm:tmi                              
export I_MPI_DEVICE=rdma:OpenIB-cma                                           
cd \$PBS_O_WORKDIR                                                
export F_UFMTENDIAN=big                                                   
cat \$PBS_NODEFILE > pbs_nodes                                                
export I_MPI_MPD_TMPDIR=/tmp                                                 
MYNP=8                                                                       

# Your Executable path should be here.                                         
#Example : For GROMACS Users :                                            

gmx_mpi grompp -f nvt.mdp -c topol.gro -p topol.top  -o nvt.tpr 
mpirun -machinefile \$PBS_NODEFILE -np \$MYNP  gmx_mpi mdrun -plumed plumed.dat -v -deffnm nvt -ntomp 16   

#======================================================================================#
#                                Written By ANJI BABU KAPAKAYALA                       #
#======================================================================================#
EOF2
echo;echo "$bold ${txtred} File  saved as submit.sh.  ${txtrst} "
else
echo;echo "$bold ${txtred} Thank you . Bye .${txtrst} ";echo
fi











