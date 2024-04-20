-- le lien fonctionne
-- \! wget "https://data.enseignementsup-recherche.gouv.fr/api/explore/v2.1/catalog/datasets/fr-esr-parcoursup/exports/csv?lang=fr&timezone=Europe%2FBerlin&use_labels=true&delimiter=%3B" -O tmp.csv

--créé dico.xls--
\! ./dico.sh

--drop--
DROP TABLE IF EXISTS import, département, établissement, formation, proposition, candidature CASCADE;

--import--
CREATE TEMP TABLE import(n1 INT, n2 TEXT, n3 CHAR(10), n4 TEXT, n5 CHAR(3),
 n6 TEXT, n7 TEXT, n8 TEXT, n9 TEXT, n10 TEXT, n11 TEXT, n12 TEXT, n13 TEXT,
 n14 TEXT, n15 TEXT, n16 TEXT, n17 TEXT, n18 INT, n19 INT, n20 INT, n21 INT, 
 n22 INT, n23 INT, n24 INT, n25 INT, n26 INT, n27 INT, n28 INT, n29 INT, 
 n30 INT, n31 INT, n32 INT, n33 INT, n34 INT, n35 INT, n36 INT, n37 INT, 
 n38 INT, n39 INT, n40 INT, n41 INT, n42 INT, n43 INT, n44 INT, n45 INT, 
 n46 INT, n47 INT, n48 INT, n49 INT, n50 INT, n51 FLOAT, n52 FLOAT, n53 FLOAT, 
 n54 FLOAT, n55 INT, n56 INT, n57 INT, n58 INT, n59 INT, n60 INT, n61 INT, 
 n62 INT, n63 INT, n64 INT, n65 INT, n66 FLOAT, n67 INT, n68 INT, n69 INT, 
 n70 INT, n71 INT, n72 INT, n73 INT, n74 FLOAT, n75 FLOAT, n76 FLOAT, n77 FLOAT, 
 n78 FLOAT, n79 FLOAT, n80 FLOAT, n81 FLOAT, n82 FLOAT, n83 FLOAT, n84 FLOAT, 
 n85 FLOAT, n86 FLOAT, n87 FLOAT, n88 FLOAT, n89 FLOAT, n90 FLOAT, n91 FLOAT, 
 n92 FLOAT, n93 FLOAT, n94 FLOAT, n95 FLOAT, n96 FLOAT, n97 FLOAT, n98 FLOAT, 
 n99 FLOAT, n100 FLOAT, n101 FLOAT, n102 TEXT, n103 TEXT, n104 TEXT, n105 TEXT, 
 n106 TEXT, n107 TEXT, n108 TEXT, n109 TEXT, n110 INT, n111 TEXT, n112 TEXT, 
 n113 TEXT, n114 FLOAT, n115 FLOAT, n116 FLOAT, n117 CHAR(6), n118 CHAR(6)
 );
\copy import FROM data.csv CSV DELIMITER ';'; 

--département--
CREATE TABLE département(
    dno CHAR(3), 
    nom TEXT, 
    région TEXT, 
    académie TEXT,
    CONSTRAINT pk_département PRIMARY KEY(dno)
);

INSERT INTO département 
SELECT DISTINCT n5, n6, n7, n8 
FROM import 
ORDER BY n5;

--établissement--
CREATE TABLE établissement(
    eno CHAR(10), 
    nom TEXT, 
    statut TEXT, 
    dno CHAR(3),
    CONSTRAINT pk_établissement PRIMARY KEY (eno),
    CONSTRAINT fk_département FOREIGN KEY (dno)
        REFERENCES département(dno)
);

INSERT INTO établissement 
SELECT DISTINCT n3, n4, n2, n5 
FROM import;

--formation--
CREATE TABLE formation(
    fno INT, 
    nom TEXT, 
    capacitéÉtablissement INT,
    CONSTRAINT pk_formation PRIMARY KEY(fno)
);

INSERT INTO formation 
SELECT DISTINCT n110, n10, n18 
FROM import; 

--candidature--
CREATE TABLE candidature(
    fno INT, 
    effGen INT, 
    effTechno INT, 
    effPro INT, 
    effAutre INT,
    CONSTRAINT pk_candidature PRIMARY KEY (fno),
    CONSTRAINT fk_candidature FOREIGN KEY (fno)
        REFERENCES formation(fno)
);

INSERT INTO candidature 
SELECT n110, n23, n25, n27, n29 
FROM import;
