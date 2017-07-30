clc
clear
n1=500; %number of dockings
Data=zeros(1,20);
%Enter file names file names
F_n={'4wor_Results_%d_sucralose.pdbqt',
    '4wor_Results_%d_sucrose.pdbqt',
    '4wor_Results_%d_4WOR_THP_minimised.pdbqt',
    '1BH6_Results_%d_1BH6_1BH_minimised.pdbqt',
    '1BH6_Results_%d_sucralose.pdbqt',
    '1BH6_Results_%d_sucrose.pdbqt',
    '1HEW_Results_%d_sucralose.pdbqt',
    '1HEW_Results_%d_sucrose.pdbqt',
    '1HEW_Results_%d_1HEW_NAG_mini.pdbqt',
    '3AGN_Results_%d_sucralose.pdbqt',
    '3AGN_Results_%d_sucralose.pdbqt',
    '5LYD_Results_%d_sucralose.pdbqt',
    '5LYD_Results_%d_sucralose.pdbqt',
    '3AGN_Results_%d_3AGN_3AM_minimised.pdbqt',
    '5LYD_Results_%d_5LYD_7B0_minimised.pdbqt',};
n=size(F_n,1);
s1='BE_';
s2='.txt';
for c=1:1:n
for i=1:1:n1
matFileName = sprintf(F_n{c,1},i);
filetext = fileread(matFileName);
numbers = str2double(regexp(filetext, '(?<=REMARK VINA RESULT[^0-9]*)[0-9]*\.?[0-9]+', 'match'));
k=size(numbers,2);
for m=k+1:1:20
    numbers(1,m)=numbers(1,k);
end
Data(i,:)= numbers;
end
Data(n1+1,2)=mean(Data(:));
Data(n1+1,1)=max(Data(:));
nfile=strcat(s1,F_n{c,1},s2);
dlmwrite(nfile,Data,'delimiter',' ')
Data=zeros(1,20);
end