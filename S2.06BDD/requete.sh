#!/bin/bash

cp fr-esr-parcoursup.csv tmp.csv     //copy for backup
head -n 1 tmp.csv | tr ';' '\n' | wc -l -> nb_lignes.txt
head -n 1 tmp.csv >> dico.xls

# marche po
# tail -n $(expr $(wc -l tmp.csv | cut -d ' ' -f 1) -1)tmp.csv >> data.csv