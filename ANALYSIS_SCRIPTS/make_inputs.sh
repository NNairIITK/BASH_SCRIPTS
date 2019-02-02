#!/bin/bash
# This Script generates required input files to run REMD sumulation using Gromacs
#
# AUTHOUR : KAPAKAYALA ANJI BABU
#           IIT KANPUR, INDIA.
#
# INPUT   : test.gro , test.mdp , test.top 
#
# USAGE   : sh make_inputs.sh -i 300.0 -f 350.0 -d 2.0 -n 15000000 -g "test.gro" -m "test.mdp"
# FLAGS   :
#    -i   : Initial Temperature
#    -f   : Final Temperature
#    -d   : Temp. defference
#    -n   : No. of MD steps
#    -m   :  mdp file
#    -g   :   gro file
#
# OUTPUT  : Generates Default names remd_$i.gro, remd_$i.mdp , remd_$i.tpr and submit.sh 
#
while getopts "i:f:d:n:g:m:"  option 
do
   case "${option}" 
 in
   i)   T0=${OPTARG} 
;;
   f)   Tf=${OPTARG}
;;
   d)   dt=${OPTARG}
;;
   n)   mdsteps=${OPTARG}
 ;;
   g)   gro=${OPTARG}
  ;;
   m)   mdp=${OPTARG}
 ;;
   esac
done
#----------------
# USAGE :  sh make_inputs.sh -i 300.0 -f 350.0 -d 2.0 -n 15000000
#========================
N=$(echo "($Tf-$T0)/$dt"|bc -l)
#a=`expr 450 - 300 `
#N=`expr $a / 2 `
for i in `seq 0 $N`;do
cp $mdp remd_$i.mdp
cp $gro remd_$i.gro
old="ref_t           = 300.0  300.0"
new="ref_t           = $T0 $T0  "
sed -i '/nsteps/d '  remd_$i.mdp
sed -i "4i nsteps          = $mdsteps" remd_$i.mdp
sed -i '/^ref_t/d' remd_$i.mdp
sed -i "35i $new" remd_$i.mdp
T0=$(echo "$T0+$dt"|bc -l)
#Generating Tpr files
gmx grompp -f remd_$i.mdp -c remd_$i.gro -p *.top -o remd_$i.tpr
#echo "$old" 
#echo "$new"
echo -e "\e[31;44m Replica $i tpr Completed.\e[0m"
echo ""
done
rm \#*
clear
intM=${N%.*}
#echo $intM
echo " $intM Replicas generated"
echo ""
cat >> submit.sh << EOF
# Submit REMD simulation by using this command
# NOTE : parallal environment shoud be available
mpirun -np $intM gmx_mpi mdrun -v -deffnm remd_ -plumed plumed.dat -multi $intM -replex 5000 
#
#  -np         :  No. of Processors  ( Always multiple of No. of replicas.
# -v -deffnm   :  Gromacs geneates all outputs with default extensions.
#  -plumed     :  Switches ON plumed package .
#  -multi      :  Switches ON gromacs multi simulation option.
#  -replex     :  How oftenly you want to exchange coordinates.
#
#
# By ANJI BABU KAPAKAYALA
EOF
echo -e "\e[31;44m  ==================================== \e[0m"
echo -e "\e[31;44m           Written By                  \e[0m"
echo -e "\e[31;44m      ANJI BABU KAPAKAYALA             \e[0m"
echo -e "\e[31;44m  ==================================== \e[0m"

