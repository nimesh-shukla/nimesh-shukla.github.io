#BSUB -q hp12
#BSUB -n 2
#BSUB -o /home/nshukla/Outputlogs/log_5LYD_P.txt
#BSUB -R "span[hosts=1]"
#BSUB -J Nimesh_dockings

# Parametersdock=SNase
ligset=Sugars
ligset_list="5LYD_7B0_minimised sucrose sucralose"

# Create the docking and output directories
mkdir /home/nshukla/Docking/
mkdir /home/nshukla/Docking/result_pdbqts

vina_start_time=$(date "+%Y%m%d%H%M%S")
printf '\n~~~> Vina docking %s started %s' "$dock" "$vina_start_time"

# Vina command
for lig in $ligset_list
do
	lig_start_time=$(date "+%Y%m%d%H%M%S")
	printf '\n\n> Docking ligand <%s> starting at %s\n' "$lig" "$lig_start_time"
	/share/apps/autodock/autodock_vina_1_1_2_linux_x86/bin/vina \
	--receptor /home/nshukla/Input/Thrombin/5LYD_P.pdbqt \
	--ligand /home/nshukla/Input/Sugars/$lig.pdbqt \
	--out /home/nshukla/Docking/result_pdbqts/5LYD_P_Resultss_$lig.pdbqt \
	--center_x 61.369\
	--center_y 25.159\
	--center_z 46.938\
	--size_x 50 \
	--size_y 50 \
	--size_z 56 \
	--cpu 2 \
	--num_modes 20 \
	--exhaustiveness 100
	lig_end_time=$(date "+%Y%m%d%H%M%S")
	printf '> Finished at %s' "$lig_start_time"
	lig_duration=$(bc <<< "$lig_end_time - $lig_start_time")
	printf '\n> Docking of ligand %s took %s seconds' "$lig" "$lig_duration"
done

vina_end_time=$(date "+%Y%m%d%H%M%S")
printf '\n\n---> Vina job finished %s\n' "$vina_end_time"

vina_duration=$(bc <<< "$vina_end_time - $vina_start_time")
printf '\n---> Docking %s of ligset %s took %s seconds \n\n' "$dock" "$lig" "$vina_duration"
