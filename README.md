# SAE-2.04-BDD

### Exo1: Comprendre les Données  
Q1: Analyse du fichier récupéré  
  1. Combien y-a t-il de lignes ? Justifiez !  
     > Il y a **13870 lignes** (entête incluse), la commande pour le trouver le nombre de lignes `wc -l <fichier.csv>` donc la commande est `wc -l fr-esr-parcoursup.csv`.  
     
  2. Que représente une ligne ?  
     > chaque ligne représente **une école** que l'on retrouve dans Parcoursup.  
     
  3. Combien y-a t-il de colonnes ? Justifiez !  
     > Il y a **118 colonnes**. la commande pour le trouver le nombre de colonnes est `head -n 1 <fichier.csv> | tr ';' '\n' | wc -l` donc la commande que l'on utilise est `head -n 1 fr-esr-parcoursup.csv | tr ';' '\n' | wc -l`.  
     
  4. Quelle colonne identifie un établissement ? (numéro et nom de col)  
     > C’est la **3ème colonne** qui s’appelle _Code UAI de l'établissement_.  
     
  5. Quelle colonne identifie une formation ? (numéro et nom de col)  
      > C’est la **14ème colonnes** qui s’appelle _Filière de formation_.  

  6. Combien de lignes font référence à notre BUT Informatique ?
      > Il y a **1 lignes**. La commande pour connaitre le nombre de ligne qui fait référence au BUT - Informatique est `cat <fichier.csv> | grep 'BUT - Informatique' | grep 'Lille'| wc -l` donc la commande que l'on utilise est `cat fr-esr-                    parcoursup.csv | grep ‘BUT - Informatique’ | grep 'Lille' | wc -l`.  
      
  7. Quelle colonne identifie un département ? (numéro et nom)  
      > C’est la **5ème colonne** qui se nomme _Code départemental de l’établissement_.    

  8. Comment envisagez vous importer ces données ?
      > la commande pour **importer des données** est `\copy <nomTable> <nomFichier> DELIMITER ';'` donc la commande que l'on utilise `\copy <import> <fr-esr-parcoursup.csv> DELIMITER ';'`
      
  10. Quels problèmes identifiez vous dans ces données initiales ? (il y en a surement plusieurs, expliquez les clairement)
      > * Il y a **des doublons** dans les _filières de formation_
      > * il y a de **la redondance** (nombre d'admis neo-bachelier _n56_ qui est en réalité _n57 + n58 + n59_).
&nbsp;

Q2. Importer les données  
  1. Fournir un fichier dico.xls permettant la correspondance entre les numéros de colonnes et les noms du fichier initial. Expliquez comment vous vous y êtes pris pour le constituer.
     > le fichier mk_dico.sh, qui **créé le fichier** dico.xls, est appellé dans parcoursup.sql  
     > il fait **une boucle** qui à chaque tour de boucle _ajoute "n" et l'indice du tour puis ajoute le délimiteur ';'_  
     > il **enlève** ensuite le dernier ';' qui ne sert pas.
     
  3. Créer une table import permettant l’importation de ces données (fournir le code)
     > `CREATE TEMP TABLE import(n1 INT, n2 TEXT, n3 CHAR(10), n4 TEXT, n5 CHAR(3), n6 TEXT, n7 TEXT, n8 TEXT, n9 TEXT, n10 TEXT, n11 TEXT, n12 TEXT, n13 TEXT, n14 TEXT, n15 TEXT, n16 TEXT, n17 TEXT, n18 INT, n19 INT, n20 INT, n21 INT, n22 INT, n23 INT, n24 INT, n25 INT, n26 INT, n27 INT, n28 INT, n29 INT, n30 INT, n31 INT, n32 INT, n33 INT, n34 INT, n35 INT, n36 INT, n37 INT, n38 INT, n39 INT, n40 INT, n41 INT, n42 INT, n43 INT, n44 INT, n45 INT, n46 INT, n47 INT, n48 INT, n49 INT, n50 INT, n51 FLOAT, n52 FLOAT, n53 FLOAT, n54 FLOAT, n55 INT, n56 INT, n57 INT, n58 INT, n59 INT, n60 INT, n61 INT, n62 INT, n63 INT, n64 INT, n65 INT, n66 FLOAT, n67 INT, n68 INT, n69 INT, n70 INT, n71 INT, n72 INT, n73 INT, n74 FLOAT, n75 FLOAT, n76 FLOAT, n77 FLOAT, n78 FLOAT, n79 FLOAT, n80 FLOAT, n81 FLOAT, n82 FLOAT, n83 FLOAT, n84 FLOAT, n85 FLOAT, n86 FLOAT, n87 FLOAT, n88 FLOAT, n89 FLOAT, n90 FLOAT, n91 FLOAT, n92 FLOAT, n93 FLOAT, n94 FLOAT, n95 FLOAT, n96 FLOAT, n97 FLOAT, n98 FLOAT, n99 FLOAT, n100 FLOAT, n101 FLOAT, n102 TEXT, n103 TEXT, n104 TEXT, n105 TEXT, n106 TEXT, n107 TEXT, n108 TEXT, n109 TEXT, n110 INT, n111 TEXT, n112 TEXT, n113 TEXT, n114 FLOAT, n115 FLOAT, n116 FLOAT, n117 CHAR(6), n118 CHAR(6));`
     
  5. S’assurer que les types de colonnes soient les plus restrictifs possibles (des int pour les colonnes contenant desentiers, des char(x) pour les données textuelles de taille x etc ...)
     > **_ui_**
      
  7. Remplir cette table avec les données récupérées (fournir le code)
     > le code est dans parcoursup.sql dans :  
     > --import--
       
  9. En s’appuyant sur la table import fournir les requêtes et les réponses qui permettent de savoir  
    * (a) Combien il y a de formations gérés par ParcourSup ?  
       &nbsp; &nbsp; &nbsp; &nbsp; **_gpaslenombretucalculezebi_** `SELECT COUNT(*) AS "Nombre de ligne de la table import" FROM import;`  
    * (b) Combien il y a d’établissements gérés par ParcourSup ?  
       &nbsp; &nbsp; &nbsp; &nbsp; **_gpaslenombretucalculezebi_** `SELECT COUNT(DISTINCT n3) AS "Nombre d'établissement" FROM import;`  
    * (c) Combien il y a de formations pour l’université de Lille ?  
       &nbsp; &nbsp; &nbsp; &nbsp; **_gpaslenombretucalculezebi_** `SELECT COUNT(*) AS "Nombre formation Université de Lille" FROM import WHERE n4 LIKE '%Université de Lille%';`  
    * (d) Combien il y a de formations pour notre IUT ?  
       &nbsp; &nbsp; &nbsp; &nbsp; **_gpaslenombretucalculezebi_** `SELECT COUNT(*) AS "Nombre de formation de notre IUT" FROM import WHERE n4 = 'Institut universitaire de technologie de Lille - Université de Lille';`  
    * (e) Quel est le code du BUT Informatique de l’unversité de Lille ?  
       &nbsp; &nbsp; &nbsp; &nbsp; **_gpaslenombretucalculezebi_** `SELECT n3 AS "Code du BUT informatique de l'Université de Lille" FROM import WHERE n4 = 'Institut universitaire de technologie de Lille - Université de Lille' AND n10 = 'BUT - Informatique';`  
    * (f) Citez 5 colonnes contenant des valeurs nulles  
       &nbsp; &nbsp; &nbsp; &nbsp; **_gpaslenombretucalculezebi_** `\echo "5 colonnes avec des valeurs nulles : n22, n37, n38, n54, n70"`  
&nbsp;  
&nbsp;

### Exo 2 : Ventiler les données
Q1. Normalisation des données  
  1. Fournir le MCD correspondant à votre structuration  
     > c'est parcoursup.mcd  
     
  3. Ecrire le script parcourssup.sql qui permet de réaliser toutes les actions d’importation et de création/remplissage des différentes parcourssup.  
     > **_ui_**  
     
&nbsp;  

Q2. Une question de taille !  
  1. Quelle taille en octet fait le fichier récupéré ?  
     > 12423586 octets  
     
  3. Quelle taille en octet fait la table import ?  
     > 18644992 octets  
     
  5. Quelle taille en octet fait la somme des tables créées ?  
     > 983040 octets  
  7. Quelle taille en octet fait la somme des tailles des fichiers exportés correspondant à ces tables ?
     > 94090 octets commune.csv
       1681546 octets pour formation.csv
       308533 octets pour etablissement.csv
       695369 octets pour effectif_admis.csv
       632395 octets pour neo_bacheliers_effectif.csv
       286885 octets pour boursiers_effectif.csv
       Pour un total de 3698818 octets

&nbsp;  
&nbsp;  

### Exercice 3 : Requêtage  
**Réponses dans requete.sh**  
Q1. Ecrire une requête qui, à partir de import affiche le contenu de la colonne n56 et le re-calcul de celle-ci à partir d’autres colonnes de import (2 cols).  
Q2. Quelle requête vous permet de savoir que ce re-calcul est parfaitement exact ?  
Q3. Ecrire une requête qui, à partir de import affiche le contenu de la colonne n74 et le re-calcul de celle-ci à partir d’autres colonnes de import (2 cols).  
Q4. Quelle requête vous permet de savoir que ce re-calcul est parfaitement exact ?  
Q5. Ecrire une requête qui, à partir de import affiche le contenu de la colonne n76 et le re-calcul de celle-ci à partir d’autres colonnes de import (2 cols). A partir de combien de décimales ces données sont exactes ?  
Q6. Fournir la même requête sur vos tables ventilées.  
Q7. Ecrire une requête qui, à partir de import affiche la n81 et la manière de la recalculer. A partir de combien de décimales ces données sont exactes ?  
Q8. Fournir la même requête sur vos tables ventilées.  

---

### À rendre pour la partie BDD
Une archive zip déposée sur Moodle le 20 avril maxi avec :
1. Un rapport explicatif en PDF avec une page de garde (titre, logos,noms des étudiants) ainsi que le MCD, la réponseaux différentes questions de ce document (notamment (mais pas uniquement)
   Exo1 Q1, Exo1 Q2, Exo2 Q2 et Exo3) et les commentaires que vous jugerez necessaires.
3. Le fichier dico.xls qui contient les correspondances de noms de colonnes
4. Le fichier parcourssup.sql qui permet de tout recréer
5. Le fichier requetes.sql qui permet d’exécuter vos différentes requêtes.

---

### Ressources
* [link Google doc Sulli](https://docs.google.com/document/d/1VKuihwp69jx5l_nW6f0fuWjKfM6VWBlpy2XFYw0yvks/edit?hl=fr)
* [link Google doc Tomichauchocacao](https://docs.google.com/document/d/1CrlNWBCd3kbn-bDUzHO9uyTkWGhqtViBFkW06OsSnIQ/edit)
* [link Google Doc Tom R](https://docs.google.com/document/d/10zkqb5_JJX0VkCTB7wfoeanwxqDuwzun3aCV1rDVtqk/edit?usp=sharing)


---

### Ressources de la SAE
* [Site de Parcoursup](https://data.enseignementsup-recherche.gouv.fr/pages/parcoursupdata/?disjunctive.fili)
* [Données de Parcoursup](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-parcoursup/export/?timezone=Europe%2FBerlin&sort=tri)

