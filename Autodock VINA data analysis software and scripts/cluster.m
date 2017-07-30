clc
clear
Lname={'1BH6_Results_%d_1BH6_1BH_minimised.pdbqt',};
LClNo=[6];
for i=1:1:size(Lname,1)
    Name=strcat(Lname{i,1},'.txt');
    L=dlmread(Name);
    [K(:,1),K(:,2),K(:,3)]=cart2sph(L(:,1),L(:,2),L(:,3));
    [G,C] = kmeans(K(:,1:3), LClNo(1,i),'distance','cityblock','MaxIter',1000,'start','uniform','EmptyAction','drop','Replicates',50);
    scatter3(L(:,1), L(:,2), L(:,3), 36,'Marker','.')
    hold on
    [C1(:,1), C1(:,2), C1(:,3)]=sph2cart(C(:,1), C(:,2), C(:,3));
    scatter3(C1(:,1), C1(:,2), C1(:,3), 100,'Marker','o', 'LineWidth',3)
    L=[L,G];
    
    for j=1:1:LClNo(1,i)
        s=0;
        for k=1:1:size(G,1)
         if j==G(k,1)
             s=s+1;
         end
        end
        C(j,4)=s;
    end
end