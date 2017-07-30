clear
clc
%Enter number of vina runs
n=500;
%Enter ligand PDB file Name
Lname={'4wor_Results_%d_sucralose.pdbqt',
    '4wor_Results_%d_sucrose.pdbqt',
    '4wor_Results_%d_4WOR_THP_minimised.pdbqt',
    '1BH6_Results_%d_1BH6_1BH_minimised.pdbqt',
    '1BH6_Results_%d_sucralose.pdbqt',
    '1BH6_Results_%d_sucrose.pdbqt',
    '1HEW_Results_%d_sucralose.pdbqt',
    '1HEW_Results_%d_sucrose.pdbqt',
    '1HEW_Results_%d_1HEW_NAG_mini.pdbqt',
    '3AGN_Results_%d_sucrose.pdbqt',
    '3AGN_Results_%d_sucralose.pdbqt',
    '5LYD_Results_%d_sucrose.pdbqt',
    '5LYD_Results_%d_sucralose.pdbqt',
    '3AGN_Results_%d_3AGN_3AM_minimised.pdbqt',
    '5LYD_Results_%d_5LYD_7B0_minimised.pdbqt',};
%read pdb files
for l=1:1:size(Lname,1)
    %declear Lmatrix
    c=1;
    %read binding energies
    BEFileName=strcat('BE_',Lname(l,1),'.txt');
    BE=dlmread(BEFileName{1,1});
    
    L(l,1)=BE(501,1)
    L(l,2)=BE(501,2)
    end
 dlmwrite('summary',L,'newline','pc')
