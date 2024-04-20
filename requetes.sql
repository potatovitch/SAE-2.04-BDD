-- Question 1 --
SELECT n56 as "Effectif des admis néo bacheliers", n57+n58+n59 as "Re-calcul" FROM import;

-- Question 2 --
SELECT n56 , n57+n58+n59 FROM import WHERE n56 <> n57+n58+n59;

-- Question 3 --
SELECT n74 as "taux d’admis à l'ouverture de la procédure principale", ROUND((case WHEN n47 <> 0 THEN n51/n47 else 0 end)*100) as "Re-calcul" FROM import;

-- Question 4 --
SELECT n74, ROUND((case WHEN n47 <> 0 THEN n51/n47 else 0 end)*100) FROM import WHERE n74 <> ROUND((case WHEN n47 <> 0 THEN n51/n47 else 0 end)*100);

-- Question 5 --
SELECT n76 as "taux d’admis avant la fin de la procédure principale", ROUND((case WHEN n47 <> 0 THEN n53/n47 else 0 end)*100) as "Re-calcul" FROM import;

-- Vérif de la requète précédente --
SELECT n76, ROUND((case WHEN n47 <> 0 THEN n53/n47 else 0 end)*100) FROM import WHERE n76 <> ROUND((case WHEN n47 <> 0 THEN n53/n47 else 0 end)*100);

-- Question 6 --
SELECT ROUND((case WHEN nb_ayant_accepter_prop <> 0 THEN nb_admis_avant_fin_p/nb_ayant_accepter_prop else 0 end)*100) from effectifFormation;

-- Question 7 --
SELECT n81 as "taux d’admis néo bacheliers boursiers", ROUND((case WHEN (n57+n58+n59) <> 0 THEN n55/(n57+n58+n59+0.0) else 0.0 end)*100) FROM import GROUP BY n81, n55, (n57+n58+n59);

-- Vérif de la requète précédente --
SELECT n81, ROUND((case WHEN (n57+n58+n59) <> 0 THEN n55/(n57+n58+n59+0.0) else 0.0 end)*100) FROM import WHERE n81 <> ROUND((case WHEN (n57+n58+n59) <> 0 THEN n55/(n57+n58+n59+0.0) else 0.0 end)*100) GROUP BY n81, n55, (n57+n58+n59);

-- Question 8 --
SELECT ROUND((case WHEN (nb_nouveau_admis_G+nb_nouveau_admis_T+nb_nouveau_admis_P) <> 0 
then nb_admis_nouveau_boursier/(nb_nouveau_admis_G+nb_nouveau_admis_T+nb_nouveau_admis_P+0.0)
else 0.0 end)*100) from effectifFormation GROUP BY nb_admis_nouveau_boursier, (nb_nouveau_admis_G+nb_nouveau_admis_T+nb_nouveau_admis_P);
