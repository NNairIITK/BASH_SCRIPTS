#!/bin/bash
begin=$(date +%s)
mkdir PLOTS_PROBS
mkdir PLOTS_FES
cd ../
#find PROB_* -type d > folders
filename='folders'
#read -p "Enter file name: " file
while read file;do
echo ""
echo "$file is processing...."
cd $file
cp ../PLOTTING_Scripts/XMGRACE/* .
cat > dummy << EOF
title "$file"
EOF
cat dummy grace_plot_3-6.bfile  >> plot_3-6.bfile 
gracebat -batch plot_3-6.bfile -nosafe -hardcopy -printfile "probs_3-6.png" -hdevice PNG
cat dummy grace_plot_6-10.bfile >> plot_6-10.bfile 
gracebat -batch plot_6-10.bfile -nosafe -hardcopy -printfile "probs_6-10.png" -hdevice PNG
cat dummy grace_plot_10-16.bfile  >> plot_10-16.bfile
gracebat -batch plot_10-16.bfile -nosafe -hardcopy -printfile "probs_10-16.png" -hdevice PNG
cat dummy grace_plot_16-22.bfile  >> plot_16-22.bfile 
gracebat -batch plot_16-22.bfile -nosafe -hardcopy -printfile "probs_16-22.png" -hdevice PNG
cat dummy grace_plot_22-28.bfile  >> plot_22-28.bfile
gracebat -batch plot_22-28.bfile -nosafe -hardcopy -printfile "probs_22-28.png" -hdevice PNG
cat dummy grace_plot_28-34.bfile  >> plot_28-34.bfile
gracebat -batch plot_28-34.bfile -nosafe -hardcopy -printfile "probs_28-34.png" -hdevice PNG
cat dummy grace_plot_34-38.bfile  >> plot_34-38.bfile 
gracebat -batch plot_34-38.bfile -nosafe -hardcopy -printfile "probs_34-38.png" -hdevice PNG
mkdir PLOTS_$file
mv *.png PLOTS_$file
cp -rp PLOTS_$file ../POST_PROCESS/PLOTS_PROBS/
echo ""
cp ../POST_PROCESS/find_minimum.x FES/
cp ../POST_PROCESS/grace_plot_fes_dummy.bfile FES/
cd FES/
./find_minimum.x < free_energy > fes_new
sed -i 's/Infinity/100/g' fes_new
cat > dummy << EOF
title "$file"
EOF
cat dummy  grace_plot_fes_dummy.bfile >> grace_plot_fes.bfile 
gracebat -batch grace_plot_fes.bfile -nosafe -hardcopy -printfile "fes.png" -hdevice PNG
cp fes_new ../../POST_PROCESS/PLOTS_FES/fes_$file
cp fes.png ../../POST_PROCESS/PLOTS_FES/fes_$file.png
echo "$file has completed"
echo ""
echo "===================================="
cd ../../
done < $filename
echo "$PWD"
cp ~/ANJI/NDM_Project/PLUMED_GROMACS_SIMULATIONS/US_modified_TOPOLOGY/UMBRELLA_SAMPLING/PLOTTING_Scripts/XMGRACE/overlap_*  ~/ANJI/NDM_Project/PLUMED_GROMACS_SIMULATIONS/US_modified_TOPOLOGY/UMBRELLA_SAMPLING/POST_PROCESS/PLOTS_FES 
cd /home/anjibabu/ANJI/NDM_Project/PLUMED_GROMACS_SIMULATIONS/US_modified_TOPOLOGY/UMBRELLA_SAMPLING/POST_PROCESS/PLOTS_FES
gracebat -batch  overlap_fes_plot_1_20.bfile -nosafe -hardcopy -printfile "overlap_fes_1_20.png" -hdevice PNG
gracebat -batch  overlap_fes_plot_5_30.bfile -nosafe -hardcopy -printfile "overlap_fes_5_30.png" -hdevice PNG
gracebat -batch  overlap_fes_plot_5_32-50.bfile -nosafe -hardcopy -printfile "overlap_fes_5_32_50.png" -hdevice PNG
gracebat -batch  overlap_fes_plot_10_50.bfile -nosafe -hardcopy -printfile "overlap_fes_10_50.png" -hdevice PNG
cd ../
echo ""
echo "$(date)"
echo ""
end=$(date +%s)
x=$(bc <<< "3600")
runtime=$(($end - $begin))
hours=$(bc <<< "$runtime/$x")
echo "Execution Time = $runtime sec"
echo ""
echo "Execution time = $hours hrs"
#=======================================================================================#
#              Written by Anji Babu Kapakayala                                          #
#=======================================================================================#

