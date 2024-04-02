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
&nbsp;  
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
&nbsp;  
&nbsp;  
### Exo 2 : Ventiler les données
Q1. Normalisation des données
  1. Fournir le MCD correspondant à votre structuration
  2. Ecrire le script parcourssup.sql qui permet de réaliser toutes les actions d’importation et de                        création/remplissage des différentes parcourssup.

Q2. Une question de taille !
  1. Quelle taille en octet fait le fichier récupéré ? 
  2. Quelle taille en octet fait la table import ? 
  3. Quelle taille en octet fait la somme des tables créées ?
  4. Quelle taille en octet fait la somme des tailles des fichiers exportés correspondant à ces tables ?


### Exercice 3 : Requêtage
Q1. Ecrire une requête qui, à partir de import affiche le contenu de la colonne n56 et le re-calcul de celle-ci à        partir d’autres colonnes de import (2 cols).
Q2. Quelle requête vous permet de savoir que ce re-calcul est parfaitement exact ?
Q3. Ecrire une requête qui, à partir de import affiche le contenu de la colonne n74 et le re-calcul de celle-ci à        partir d’autres colonnes de import (2 cols).
Q4. Quelle requête vous permet de savoir que ce re-calcul est parfaitement exact ?
Q5. Ecrire une requête qui, à partir de import affiche le contenu de la colonne n76 et le re-calcul de celle-ci à        partir d’autres colonnes de import (2 cols). A partir de combien de décimales ces données sont exactes ?
Q6. Fournir la même requête sur vos tables ventilées
Q7. Ecrire une requête qui, à partir de import affiche la n81 et la manière de la recalculer. A partir de combien de
  décimales ces données sont exactes ?
Q8. Fournir la même requête sur vos tables ventilées

---

### À rendre pour la partie BDD
Une archive zip déposée sur Moodle le 20 avril maxi avec :
1. Un rapport explicatif en PDF avec une page de garde (titre, logos,noms des étudiants) ainsi que le MCD, la réponse
  aux différentes questions de ce document (notamment (mais pas uniquement) Exo1 Q1, Exo1 Q2, Exo2 Q2 et Exo3) et les    commentaires que vous jugerez necessaires.
2. Le fichier dico.xls qui contient les correspondances de noms de colonnes
3. Le fichier parcourssup.sql qui permet de tout recréer
4. Le fichier requetes.sql qui permet d’exécuter vos différentes requêtes.
