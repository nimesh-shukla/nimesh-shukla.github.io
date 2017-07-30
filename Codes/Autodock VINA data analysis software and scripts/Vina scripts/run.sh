for x in {1..500}; do sed "s/Resultss/Results_$x/"   vina_4WOR_P_THP_minimised.sh > vina_4WOR_P_THP_minimised_$x.sh ; done

for x in {1..500}; do bsub < vina_4WOR_P_THP_minimised_$x.sh ; done

for x in {1..500}; do sed "s/Resultss/Results_$x/"   vina_1BH6_P_1BH_minimised.sh > vina_1BH6_P_1BH_minimised_$x.sh ; done

for x in {1..500}; do bsub < vina_1BH6_P_1BH_minimised_$x.sh ; done

for x in {1..500}; do sed "s/Resultss/Results_$x/"   vina_1HEW_P_NAG_minimised.sh > vina_1HEW_P_NAG_minimised_$x.sh ; done

for x in {1..500}; do bsub < vina_1HEW_P_NAG_minimised_$x.sh ; done

for x in {1..500}; do sed "s/Resultss/Results_$x/"   vina_3AGN_P_3AM_minimised.sh > vina_3AGN_P_3AM_minimised_$x.sh ; done

for x in {1..500}; do bsub < vina_3AGN_P_3AM_minimised_$x.sh ; done

for x in {1..500}; do sed "s/Resultss/Results_$x/"   vina_5LYD_P_7B0_minimised.sh > vina_5LYD_P_7B0_minimised_$x.sh ; done

for x in {1..500}; do bsub < vina_5LYD_P_7B0_minimised_$x.sh ; done


