create database cooking;
use cooking;

CREATE TABLE cooking (nomcooking VARCHAR(25) NOT NULL);

CREATE TABLE fournisseur (nom_fournisseur VARCHAR(35) NOT NULL, num_tel_fournisseur VARCHAR(20), ref_commande_fournisseur VARCHAR(25));

CREATE TABLE produit (nom_produit VARCHAR(30) NOT NULL, categorie VARCHAR(25), quantite INT, stock_annuel INT, stock_mini INT, stock_maxi INT, date_derniere_utilisation DATE, nom_fournisseur VARCHAR(35));

CREATE TABLE recette (nom_recette VARCHAR(50) NOT NULL, type VARCHAR(20), descriptif VARCHAR(500), prix FLOAT(10), nbr_commande_passee INT, id_cdr VARCHAR(25), id_cuistot varchar(25));

CREATE TABLE cuisinier (id_cuistot varchar(25) NOT NULL, solde_cuistot FLOAT(10));

CREATE TABLE client (id_client VARCHAR(25) NOT NULL, nom_client VARCHAR(50), num_tel_client VARCHAR(25), solde FLOAT(10), id_cdr VARCHAR(25));

CREATE TABLE cdr (id_cdr VARCHAR(25) NOT NULL, id_client VARCHAR(25));

CREATE TABLE commande (ref_commande varchar(50) NOT NULL, date_commande DATE, id_client VARCHAR(25));

CREATE TABLE achete (nomcooking VARCHAR(25) NOT NULL, nom_produit VARCHAR(30) NOT NULL, nom_fournisseur VARCHAR(35) NOT NULL);

CREATE TABLE composee_de (nom_produit VARCHAR(30) NOT NULL, nom_recette VARCHAR(50) NOT NULL);

CREATE TABLE ayant (nom_recette VARCHAR(50) NOT NULL, ref_commande varchar(50) NOT NULL, quantite_recette INT);

ALTER TABLE cooking ADD CONSTRAINT PK_cooking PRIMARY KEY (NomCooking);

ALTER TABLE fournisseur ADD CONSTRAINT PK_fournisseur PRIMARY KEY (Nom_Fournisseur);

ALTER TABLE produit ADD CONSTRAINT PK_produit PRIMARY KEY (Nom_produit);

ALTER TABLE recette ADD CONSTRAINT PK_recette PRIMARY KEY (Nom_recette);

ALTER TABLE cuisinier ADD CONSTRAINT PK_cuisinier PRIMARY KEY (ID_Cuistot);

ALTER TABLE client ADD CONSTRAINT PK_client PRIMARY KEY (ID_Client);

ALTER TABLE cdr ADD CONSTRAINT PK_cdr PRIMARY KEY (id_cdr);

ALTER TABLE commande ADD CONSTRAINT PK_commande PRIMARY KEY (ref_commande);

ALTER TABLE achete ADD CONSTRAINT PK_achete PRIMARY KEY (NomCooking, Nom_produit, Nom_Fournisseur);

ALTER TABLE composee_de ADD CONSTRAINT PK_composee_de PRIMARY KEY (Nom_produit, Nom_recette);

ALTER TABLE ayant ADD CONSTRAINT PK_ayant PRIMARY KEY (Nom_recette, ref_commande);

ALTER TABLE produit ADD CONSTRAINT FK_produit_Nom_Fournisseur FOREIGN KEY (Nom_Fournisseur) REFERENCES fournisseur (Nom_Fournisseur);

ALTER TABLE recette ADD CONSTRAINT FK_recette_id_cdr FOREIGN KEY (id_cdr) REFERENCES cdr (id_cdr);

ALTER TABLE recette ADD CONSTRAINT FK_recette_ID_Cuistot FOREIGN KEY (ID_Cuistot) REFERENCES cuisinier (ID_Cuistot);

ALTER TABLE client ADD CONSTRAINT FK_client_id_cdr FOREIGN KEY (id_cdr) REFERENCES cdr (id_cdr);

ALTER TABLE cdr ADD CONSTRAINT FK_cdr_ID_Client FOREIGN KEY (ID_Client) REFERENCES client (ID_Client);

ALTER TABLE commande ADD CONSTRAINT FK_commande_ID_Client FOREIGN KEY (ID_Client) REFERENCES client (ID_Client);

ALTER TABLE achete ADD CONSTRAINT FK_achete_NomCooking FOREIGN KEY (NomCooking) REFERENCES cooking (NomCooking);

ALTER TABLE achete ADD CONSTRAINT FK_achete_Nom_produit FOREIGN KEY (Nom_produit) REFERENCES produit (Nom_produit);

ALTER TABLE achete ADD CONSTRAINT FK_achete_Nom_Fournisseur FOREIGN KEY (Nom_Fournisseur) REFERENCES fournisseur (Nom_Fournisseur);

ALTER TABLE composee_de ADD CONSTRAINT FK_composee_de_Nom_produit FOREIGN KEY (Nom_produit) REFERENCES produit (Nom_produit);

ALTER TABLE composee_de ADD CONSTRAINT FK_composee_de_Nom_recette FOREIGN KEY (Nom_recette) REFERENCES recette (Nom_recette);

ALTER TABLE ayant ADD CONSTRAINT FK_ayant_Nom_recette FOREIGN KEY (Nom_recette) REFERENCES recette (Nom_recette);

ALTER TABLE ayant ADD CONSTRAINT FK_ayant_ref_commande FOREIGN KEY (ref_commande) REFERENCES commande (ref_commande);

