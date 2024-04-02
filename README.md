# SAE-2.06-BDD

### Exo1: Comprendre les Données  
Q1: Analyse du fichier récupéré  
  1. Combien y-a t-il de lignes ? Justifiez !  
  2. Que représente une ligne ?   
  3. Combien y-a t-il de colonnes ? Justifiez !  
  4. Quelle colonne identifie un établissement ? (numéro et nom de col)  
  5. Quelle colonne identifie une formation ? (numéro et nom de col)  
  6. Combien de lignes font référence à notre BUT Informatique ?  
  7. Quelle colonne identifie un département ? (numéro et nom) 
  8. Comment envisagez vous importer ces données ?  
  9. Quels problèmes identifiez vous dans ces données initiales ? (il y en a surement plusieurs, expliquez les clairement)  

Q2. Importer les données  
  1. Fournir un fichier dico.xls permettant la correspondance entre les numéros de colonnes et les noms du fichier         initial. Expliquez comment vous vous y êtes pris pour le constituer.  
  2. Créer une table import permettant l’importation de ces données (fournir le code)  
  3. S’assurer que les types de colonnes soient les plus restrictifs possibles (des int pour les colonnes contenant des
    entiers, des char(x) pour les données textuelles de taille x etc ...)  
  4. Remplir cette table avec les données récupérées (fournir le code)  
  5. En s’appuyant sur la table import fournir les requêtes et les réponses qui permettent de savoir  
    * (a) Combien il y a de formations gérés par ParcourSup ?   
    * (b) Combien il y a d’établissements gérés par ParcourSup ?  
    * (c) Combien il y a de formations pour l’université de Lille ?  
    * (d) Combien il y a de formations pour notre IUT ?  
    * (e) Quel est le code du BUT Informatique de l’unversité de Lille ? 
    * (f) Citez 5 colonnes contenant des valeurs nulles   


### Exo 2 : Ventiler les données
Q1. Normalisation des données
  1. Fournir le MCD correspondant à votre structuration
  2. Ecrire le script parcourssup.sql qui permet de réaliser toutes les actions d’importation et de                        création/remplissage des différentes parcourssup.

Q2. Une question de taille !
  1. Quelle taille en octet fait le fichier récupéré ? 
  2. Quelle taille en octet fait la table import ? 
  3. Quelle taille en octet fait la somme des tables créées ?
  4. Quelle taille en octet fait la somme des tailles des fichiers exportés correspondant à ces tables ?
