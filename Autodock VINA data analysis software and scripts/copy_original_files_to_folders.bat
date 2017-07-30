set Plist=5LYD 1HEW 1BH6 4WOR 3AGN
set Llist=sucrose sucralose 5LYD_7B0_minimised 1HEW_NAG_mini 1BH6_1BH_minimised 4WOR_THP_minimised 3AGN_3AM_minimised
Pause
FOR %%P IN (%Plist%) DO (
MD %%P
FOR %%L IN (%Llist%) DO (
MD %%P\%%L
FOR /L %%G IN (1,1,500) DO COPY "%%P_Results_%%G_%%L.pdbqt" "%%P\%%L\%%P_Results_%%G_%%L.pdbqt"
))
Pause