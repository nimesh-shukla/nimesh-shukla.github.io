clear
clc
%enter file names
% F_n={'1BH6_Results_%d_1BH6_1BH_minimised.pdbqt.txt',};
F_n={'4wor_Results_%d_sucralose.pdbqt.txt',
    '4wor_Results_%d_sucrose.pdbqt.txt',
    '4wor_Results_%d_4WOR_THP_minimised.pdbqt.txt',
    '1BH6_Results_%d_1BH6_1BH_minimised.pdbqt.txt',
    '1BH6_Results_%d_sucralose.pdbqt.txt',
    '1BH6_Results_%d_sucrose.pdbqt.txt',
    '1HEW_Results_%d_sucralose.pdbqt.txt',
    '1HEW_Results_%d_sucrose.pdbqt.txt',
    '1HEW_Results_%d_1HEW_NAG_mini.pdbqt.txt',
    '3AGN_Results_%d_sucralose.pdbqt.txt',
    '3AGN_Results_%d_sucrose.pdbqt.txt',
    '3AGN_Results_%d_3AGN_3AM_minimised.pdbqt.txt',
    '5LYD_Results_%d_sucralose.pdbqt.txt',
    '5LYD_Results_%d_sucrose.pdbqt.txt',
    '5LYD_Results_%d_5LYD_7B0_minimised.pdbqt.txt',};
%%enter cluster centroid coordinates as one raw of the Lig matrix for each
%ligand as {ligand number} in the braket (found by visual inspection in
%PyMol),Enter radius of circle as fourth element%%
LigCdata{1}=[[ 14.3409996   14.86699963  -4.08799982]
 [ -3.23799992  17.05400085  14.02400017]];
LigCdata{2}=[14.4519996643 16.0119991302 -3.67899990082
-4.6970000267 15.751999855 14.4759998322
];
LigCdata{3}=[10.22553253	10.08333683	-2.822468758
3.920470238	24.07520294	-13.63466549
16.51343346	24.59917068	5.600122452
];
LigCdata{4}=[34.08679199	26.47248268	4.052627563
40.42284393	5.297267914	8.468057632
32.79387665	3.138944626	37.55557251
28.33399582	23.74159431	23.05330849
14.09607792	25.15534973	13.70872211
];
LigCdata{5}=[44.50728226	18.7884655	20.13210869
39.32154083	4.795928955	7.016786098
32.46372223	12.83782291	39.0453949
24.82236099	-8.513108253	16.41196442
4.567714691	18.0923233	20.93206787
15.09975147	23.0365715	10.23046589
25.47935677	22.23735809	27.72250557
];
LigCdata{6}=[43.87374115	19.71206284	20.77861023
38.94290161	3.43364501	7.789741993
26.89480591	-8.155869484	16.62290192
29.11832619	-1.783838749	-0.965387106
24.26361275	2.387258053	39.23851776
32.50909424	10.35248375	39.41077423
26.68593597	22.12960815	25.04400253
4.823226929	18.0956459	20.80596542
];
LigCdata{7}=[9.689533234	24.3438549	13.96160889
-7.14800024	8.710000038	10.89017868
-16.52692413	25.62961006	5.967499733
-9.791999817	35.00635529	15.62007141
-1.807856917	32.01824951	5.332679749
-7.71199989319 33.1409988403 26.8740005493
];
LigCdata{8}=[-5.76700019836 21.0009994507 34.9760017395
10.8599996567 24.6790008545 20.0429992676
-10.654999733 32.9160003662 16.0410003662
];
LigCdata{9}=[-0.824900091	33.93545151	8.310699463
11.4014492	25.88710022	25.49450111
10.89349937	17.60145187	12.74514866
10.29330063	7.733449459	25.74745178
-8.463050842	10.78469944	10.71210003
-14.96584797	26.06129837	5.825199604
-9.335999489	34.44364929	15.1388998
8.84899997711 24.7989997864 17.1840000153
];
LigCdata{10}=[0.728999972343 -7.21600008011 -0.236000001431
-4.08300018311 9.0640001297 25.1030006409
7.10300016403 8.51000022888 16.7250003815
-8.24300003052 10.5329999924 15.7189998627
-14.6079998016 -6.20300006866 -0.948000013828
];
LigCdata{11}=[-16.6849994659 -6.24100017548 0.108000002801
-1.04799997807 -9.56499958038 3.02300000191
2.6099998951 1.59800004959 27.9120006561
-4.44000005722 7.66900014877 25.9939994812
8.31900024414 5.38899993896 21.4130001068];

LigCdata{12}=[6.267736435	5.259892941	19.35024834
3.953206539	-9.956035614	2.988746166
-14.8401165	-7.445968628	-0.945647955
-6.06668663	6.369213104	25.99106216
];
LigCdata{13}=[69.7490005493 20.5580005646 65.5670013428
73.7440032959 7.84200000763 40.3720016479
80.7490005493 34.6269989014 55.9889984131
65.5120010376 43.0390014648 43.9099998474
47.513999939 11.3350000381 53.1949996948
];
LigCdata{14}=[79.90599823 34.8559989929 53.5480003357
66.0070037842 43.3470001221 43.1180000305
46.5789985657 33.5960006714 30.9300003052
62.3540000916 40.1910018921 26.3540000916
46.2799987793 10.2279996872 55.5709991455
68.9150009155 4.21199989319 52.5800018311
74.8929977417 9.92399978638 42.6259994507
];
LigCdata{15}=[79.5220031738 35.7400016785 56.2249984741
65.1470031738 42.8300018311 43.8470001221
72.81199646 9.02200031281 43.1319999695
48.4910011292 34.3849983215 29.7140007019
46.3120002747 11.0150003433 54.5040016174];

%ini
FinalF=[1 NaN NaN NaN NaN];
%size of F_n
n=size(F_n,1);

for i=1:1:n
    LData=dlmread(F_n{i,1});
    
    % plot data 
   figure
    scatter3(LData(:,1),LData(:,2),LData(:,3),'Marker','.')
   hold on
    scatter3(LigCdata{1,i}(:,1),LigCdata{1,i}(:,2),LigCdata{1,i}(:,3),'Marker','o','LineWidth',3)
    
    %count conformations in clusters
    R=LData(:,1:3);
    Cluster=zeros(size(LigCdata{1,i},1),2);
    D=zeros(size(LigCdata{1,i},1),1);
    for j=1:1:size(R,1)
        for lc=1:1:size(LigCdata{1,i},1)
          D(lc,1)=norm(R(j,:)-LigCdata{1,i}(lc,1:3));
        end
     [M,I]=min(D);
     Cluster(I,1)=Cluster(I,1)+1;
     Cluster(I,2)=Cluster(I,2)+LData(j,6);
    end
    for lc=1:1:size(LigCdata{1,i},1)
     Cluster(lc,2)=Cluster(lc,2)/Cluster(lc,1); 
    end
     %Cluster(lc+1,1)=sum(Cluster(:,1));
     %Cluster(lc+1,2)=size(R,1);
     Cluster=[LigCdata{1,i}(:,1:3) Cluster];
     Cluster(lc+1,1)=i+1;
     Cluster(lc+1,2)=NaN;
     FinalF=[FinalF;Cluster];
     
     NameFile=strcat(F_n{i,1},'_PythonScript','.txt');
     fid = fopen( NameFile, 'wt+');
     fprintf(fid, 'python\nimport numpy as np\na = np.array([')
    for k=1:1:(size(Cluster,1)-1)
        if k==(size(Cluster,1)-1)
            fprintf(fid, '[%4.2f,%4.2f,%4.2f,%4.2f,-%4.2f]',Cluster(k,1),Cluster(k,2),Cluster(k,3),Cluster(k,4),Cluster(k,5))
        else
            fprintf(fid, '[%4.2f,%4.2f,%4.2f,%4.2f,-%4.2f],',Cluster(k,1),Cluster(k,2),Cluster(k,3),Cluster(k,4),Cluster(k,5))
        end
    end
    fprintf(fid, '])\nposition=a[:,0:3]\nlbl=a[:,3:]\nn=len(a)\nfor x in range(0,n):\n  cl="c"+str(x)\n  P=position[x,:]\n  P=tuple(P)\n  print P\n  LB=tuple(lbl[x,:])\n  cmd.pseudoatom(cl,pos=P)\n  cmd.label(cl,LB)\npython end\nset label_size,-2\nset label_position,(5,5,5)')
    fclose(fid);
     clearvars Cluster LData R D M I lc  j NameFile i
 end
%dlmwrite('Conf_count_BE.txt', FinalF,'delimiter',',','newline','pc')

fid = fopen('Conf_count_BEE.txt', 'wt+');
for i=1:1:size(FinalF,1)
 fprintf(fid, '[%4.2f,%4.2f,%4.2f,%4.2f,-%4.2f],\n',FinalF(i,1),FinalF(i,2),FinalF(i,3),FinalF(i,4),FinalF(i,5))
end
fclose(fid);





















% % % StRadius=30;
% % %calculate distances between two clusters
% % % n=size(F_n,1);
% % % for i=1:1:n
% % %     for lc=1:1:size(LigCdata{1,i},1)
% % %         for j=1:1:size(LigCdata{1,i},1)
% % %             if j==lc
% % %             else
% % %                d=norm(LigCdata{1,i}(j,1:3)-LigCdata{1,i}(lc,1:3));
% % %                if d<=StRadius
% % %                    LigCdata{1,i}(j,4)=d/2;
% % %                    LigCdata{1,i}(lc,4)=d/2;
% % %                else
% % %                   LigCdata{1,i}(j,4)=StRadius/2;
% % %                   LigCdata{1,i}(lc,4)=StRadius/2;
% % %                end
% % %             end
% % %         end
% % %     end
% % % end
% % FinalF=[1 NaN NaN NaN NaN];
% % %size of F_n
% % n=size(F_n,1);
% % 
% % for i=1:1:n
% %     LData=dlmread(F_n{i,1});
% %    % figure
% %     %scatter3(LData(:,1),LData(:,2),LData(:,3),'Marker','.')
% %    % hold on
% %     %scatter3(LigCdata{1,i}(:,1),LigCdata{1,i}(:,2),LigCdata{1,i}(:,3),'Marker','o','LineWidth',3)
% %     R=LData(:,1:3);
% %     Cluster=zeros(size(LigCdata{1,i},1),2);
% %     D=zeros(size(LigCdata{1,i},1),1);
% %     for j=1:1:size(R,1)
% %         for lc=1:1:size(LigCdata{1,i},1)
% %           D(lc,1)=norm(R(j,:)-LigCdata{1,i}(lc,1:3));
% %         end
% %      [M,I]=min(D);
% %      Cluster(I,1)=Cluster(I,1)+1;
% %      Cluster(I,2)=Cluster(I,2)+LData(j,6);
% %     end
% %     for lc=1:1:size(LigCdata{1,i},1)
% %      Cluster(lc,2)=Cluster(lc,2)/Cluster(lc,1); 
% %     end
% %      %Cluster(lc+1,1)=sum(Cluster(:,1));
% %      %Cluster(lc+1,2)=size(R,1);
% %      Cluster=[LigCdata{1,i}(:,1:3) Cluster];
% %      Cluster(lc+1,1)=i+1;
% %      Cluster(lc+1,2)=NaN;
% %      FinalF=[FinalF;Cluster];
% %      clearvars Cluster LData R D M I lc  j
% %  end
% % %dlmwrite('Conf_count_BE.txt', FinalF,'delimiter',',','newline','pc')
% % 
% % fid = fopen('Conf_count_BEE.txt', 'wt+');
% % for i=1:1:size(FinalF,1)
% %  fprintf(fid, '[%4.2f,%4.2f,%4.2f,%4.2f,-%4.2f],\n',FinalF(i,1),FinalF(i,2),FinalF(i,3),FinalF(i,4),FinalF(i,5))
% % end
% % fclose(fid);