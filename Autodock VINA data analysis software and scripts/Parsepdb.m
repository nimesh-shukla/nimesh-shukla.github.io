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
    Lmatrix=zeros(n*20,6);
    c=1;
    %read binding energies
    BEFileName=strcat('BE_',Lname(l,1),'.txt');
    BE=dlmread(BEFileName{1,1});
    %Read ligand conformations coordinate data
    for i=1:1:n
    Lread=sprintf(Lname{l,1},i);
    L=pdbread(Lread);
    Mcount=size(L.Model,2)
    for m=1:1:Mcount
        x=0;
        y=0;
        z=0;
        Acount=size(L.Model(1,m).HeterogenAtom,2);
        for a=1:1:Acount
            x=x+L.Model(1,m).HeterogenAtom(1,a).X;
            y=y+L.Model(1,m).HeterogenAtom(1,a).Y;
            z=z+L.Model(1,m).HeterogenAtom(1,a).Z;
        end
        %create matrix of x y z dockno confno%
        Lmatrix(c,1)=x/Acount;
        Lmatrix(c,2)=y/Acount;
        Lmatrix(c,3)=z/Acount;
        Lmatrix(c,4)=i;
        Lmatrix(c,5)=m;
        Lmatrix(c,6)=BE(i,m);
        c=c+1;
    end
    clearvars L
    end
    Lmatrix(all(~Lmatrix,2), : ) = [];
    fname=strcat(Lname(l,1),'.txt');
    dlmwrite(fname{1,1},Lmatrix,'newline','pc')
    clearvars Lmatrix
end

