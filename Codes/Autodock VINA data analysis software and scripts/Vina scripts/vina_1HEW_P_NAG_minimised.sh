#BSUB -q hp12
#BSUB -n 2
#BSUB -o /home/nshukla/Outputlogs/log_1HEW_P.txt
#BSUB -R "span[hosts=1]"
#BSUB -J Nimesh_Dockings

# Parametersdock=SNase
ligset=Sugars
ligset_list="1HEW_NAG_mini sucrose sucralose"

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
	--receptor /home/nshukla/Input/Lysozyme/1HEW_P.pdbqt \
	--ligand /home/nshukla/Input/Sugars/$lig.pdbqt \
	--out /home/nshukla/Docking/result_pdbqts/1HEW_P_Resultss_$lig.pdbqt \
	--center_x -0.408 \
	--center_y 20.801 \
	--center_z 21.772 \
	--size_x 40 \
	--size_y 40 \
	--size_z 44 \
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
