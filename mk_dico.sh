#!/bin/bash

# créé dico.xls
cp fr-esr-parcoursup.csv tmp.csv        # fait une copie temporaire
javac Colonne.java                      # compile Colonne.java
java Colonne $(head -1 tmp.csv | tr ';' '\n' | wc -l) > nb_ligne_tmp.txt        # execute Colonne.java et met le resultat dans nb_ligne_tmp.txt
cat nb_ligne_tmp.txt | tr ',' ';' > nb_ligne.txt            # change les ',' par des ';'
cat nb_ligne.txt > dico.xls             # met le contenu de nb_ligne_tmp.txt dans dico.xls 
head -1 tmp.csv >> dico.xls             # garde juste la première ligne pour avoir le nom des colonnes et le met dans dico.xls
tail -$(expr $(wc -l tmp.csv | cut -d ' ' -f 1) - 1) tmp.csv > data.csv