#####################################################################################################################################################
#AJOUT DES CUISTOTS
#####################################################################################################################################################
INSERT INTO `cooking`.`cuisinier`(`id_cuistot`,`solde_cuistot`) VALUES("Luigi Renato",0);
INSERT INTO `cooking`.`cuisinier`(`id_cuistot`,`solde_cuistot`) VALUES("Cyril Lignac",1000);
INSERT INTO `cooking`.`cuisinier`(`id_cuistot`,`solde_cuistot`) VALUES("Alexandraaa",250);
INSERT INTO `cooking`.`cuisinier`(`id_cuistot`,`solde_cuistot`) VALUES("Philippe Etchebest",10000000);
#####################################################################################################################################################
#AJOUT DES CLIENTS
#####################################################################################################################################################
INSERT INTO `cooking`.`client`(`id_client`,`nom_client`,`num_tel_client`,`solde`,`id_cdr`) VALUES("ADJ1","ADJARIAN","0695082942",50000,NULL);
INSERT INTO `cooking`.`client`(`id_client`,`nom_client`,`num_tel_client`,`solde`,`id_cdr`) VALUES("JM2","Jean-Michel","0678451296",1500,NULL);
INSERT INTO `cooking`.`client`(`id_client`,`nom_client`,`num_tel_client`,`solde`,`id_cdr`) VALUES("TANG3","Tanguy","0678945612",300,NULL);
INSERT INTO `cooking`.`client`(`id_client`,`nom_client`,`num_tel_client`,`solde`,`id_cdr`) VALUES("BIG4","Bigard","0674185236",90000,NULL);
INSERT INTO `cooking`.`client`(`id_client`,`nom_client`,`num_tel_client`,`solde`,`id_cdr`) VALUES("MAR5","Marie","0645967823",0,NULL);
INSERT INTO `cooking`.`client`(`id_client`,`nom_client`,`num_tel_client`,`solde`,`id_cdr`) VALUES("TT6","Thérèse","0680877261",9999,NULL);
INSERT INTO `cooking`.`client`(`id_client`,`nom_client`,`num_tel_client`,`solde`,`id_cdr`) VALUES("ALEX7","Alexandra","064589321",1300,NULL);
#####################################################################################################################################################
#AJOUT DES CDR
#####################################################################################################################################################
INSERT INTO `cooking`.`cdr`(`id_cdr`,`id_client`) VALUES ("CDR_ADJ","ADJ1");
UPDATE `cooking`.`client` SET `id_cdr` = 'CDR_ADJ' WHERE (`id_client` = 'ADJ1');
INSERT INTO `cooking`.`cdr`(`id_cdr`,`id_client`) VALUES ("CDR_MAR","MAR5");
UPDATE `cooking`.`client` SET `id_cdr` = 'CDR_MAR' WHERE (`id_client` = 'MAR5');
INSERT INTO `cooking`.`cdr`(`id_cdr`,`id_client`) VALUES ("CDR_TANG","TANG3");
UPDATE `cooking`.`client` SET `id_cdr` = 'CDR_TANG' WHERE (`id_client` = 'TANG3');
INSERT INTO `cooking`.`cdr`(`id_cdr`,`id_client`) VALUES ("CDR_TT","TT6");
UPDATE `cooking`.`client` SET `id_cdr` = 'CDR_TT' WHERE (`id_client` = 'TT6');
INSERT INTO `cooking`.`cdr`(`id_cdr`,`id_client`) VALUES ("CDR_ALEX","ALEX7");
UPDATE `cooking`.`client` SET `id_cdr` = 'CDR_ALEX' WHERE (`id_client` = 'ALEX7');
#####################################################################################################################################################
#AJOUT DES FOURNISSEURS
#####################################################################################################################################################
INSERT INTO `cooking`.`fournisseur`(`nom_fournisseur`,`num_tel_fournisseur`,`ref_commande_fournisseur`) VALUES
("ACTION",NULL,"ACT10");
INSERT INTO `cooking`.`fournisseur`(`nom_fournisseur`,`num_tel_fournisseur`,`ref_commande_fournisseur`) VALUES
("BOUCHERIE",NULL,"BOUCH10");
#####################################################################################################################################################
#AJOUT DES PRODUITS
#####################################################################################################################################################
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Oeufs","Frais",150,1500,100,300,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Thym","Herbes",10,25,5,300,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Boeuf","Viande",25,100,10,50,NULL,"BOUCHERIE");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Vin","Brevage",2500,5000,2000,6000,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Glace vanille","Surgelé",10,15,5,20,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Chantilly","crême",10,15,5,20,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Farine","Céréales",10,15,5,20,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Levure","Surgelé",10,15,5,20,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Tomate","Fruit",10,15,5,20,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Champignon de Paris","Champignon",10,15,5,20,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Chèvre","Fromage",10,15,5,20,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Jambon","Viande",10,15,5,20,NULL,"BOUCHERIE");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Miel","Miel",10,15,5,20,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Rhum","brevage",10,15,5,20,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Lait","Produit laitier",100,150,50,200,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Chocolat","Sucre",100,150,50,200,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Poivre","Epices",100,150,50,200,NULL,"ACTION");
INSERT INTO `cooking`.`produit`(`nom_produit`,`categorie`,`quantite`,`stock_annuel`,`stock_mini`,`stock_maxi`,`date_derniere_utilisation`,`nom_fournisseur`)VALUES
("Pain au chocolat","Viennoiserie",100,150,50,200,NULL,"ACTION");
#####################################################################################################################################################
#AJOUT DE LA SOCIETE COOKING
#####################################################################################################################################################
INSERT INTO `cooking`.`cooking`(`nomcooking`) VALUES ("Bienvenue chez Cooking");
#####################################################################################################################################################
#AJOUT DES RECETTES
#####################################################################################################################################################
INSERT INTO `cooking`.`recette`(`nom_recette`,`type`,`descriptif`,`prix`,`nbr_commande_passee`,`id_cdr`,`id_cuistot`) VALUES
('Boeuf bourguignon',
'Plat',
'Le Boeuf bourguignon est une recette de cuisine d\'estouffade de bœuf, traditionnelle de la cuisine bourguignonne, cuisinée au vin rouge de Bourgogne, avec une garniture de champignons, de petits oignons et de lardons. ',
25,
0,
NULL,
"Luigi Renato");
INSERT INTO `cooking`.`recette`(`nom_recette`,`type`,`descriptif`,`prix`,`nbr_commande_passee`,`id_cdr`,`id_cuistot`) VALUES
('Omelette spécial Stephou',
'Plat',
"L'omelette spécial Stephou se déguste avec du thym.",
5,
0,
"CDR_ADJ",
"Philippe Etchebest");
INSERT INTO `cooking`.`recette`(`nom_recette`,`type`,`descriptif`,`prix`,`nbr_commande_passee`,`id_cdr`,`id_cuistot`) VALUES
('Glace vanille',
'Dessert',
'La glace vanille servie avec chantilly crêmeuse',
6,
0,
"CDR_MAR",
"Cyril Lignac");
INSERT INTO `cooking`.`recette`(`nom_recette`,`type`,`descriptif`,`prix`,`nbr_commande_passee`,`id_cdr`,`id_cuistot`) VALUES
('Pizza',
'Plat',
'Une pizza soi-disant italienne',
6,
0,
"CDR_TANG",
"Philippe Etchebest");
INSERT INTO `cooking`.`recette`(`nom_recette`,`type`,`descriptif`,`prix`,`nbr_commande_passee`,`id_cdr`,`id_cuistot`) VALUES
('Mielade',
'Plat',
'Une pizza au chèvre miel',
6,
0,
"CDR_TANG",
"Philippe Etchebest");
INSERT INTO `cooking`.`recette`(`nom_recette`,`type`,`descriptif`,`prix`,`nbr_commande_passee`,`id_cdr`,`id_cuistot`) VALUES
('Canelé',
'Dessert',
'Un savoureux canelé préparé avec amour',
10,
0,
"CDR_TT",
"Philippe Etchebest");
INSERT INTO `cooking`.`recette`(`nom_recette`,`type`,`descriptif`,`prix`,`nbr_commande_passee`,`id_cdr`,`id_cuistot`) VALUES
("L'oeuf à la coque",
'Entrée',
'Un oeuf délicatemant coqué',
5,
0,
NULL,
"Cyril Lignac");
INSERT INTO `cooking`.`recette`(`nom_recette`,`type`,`descriptif`,`prix`,`nbr_commande_passee`,`id_cdr`,`id_cuistot`) VALUES
('Pancakes',
'Dessert',
'Pancakes toujours préparés avec amour',
7.80,
0,
'CDR_MAR',
"Philippe Etchebest");
INSERT INTO `cooking`.`recette`(`nom_recette`,`type`,`descriptif`,`prix`,`nbr_commande_passee`,`id_cdr`,`id_cuistot`) VALUES
('Crêpes',
'Dessert',
'Toujours préparés avec amour',
7.80,
0,
'CDR_MAR',
"Philippe Etchebest");
INSERT INTO `cooking`.`recette`(`nom_recette`,`type`,`descriptif`,`prix`,`nbr_commande_passee`,`id_cdr`,`id_cuistot`) VALUES
('Pain au chocolat',
'Dessert',
'Toujours préparés avec amour',
3.50,
0,
'CDR_ALEX',
"Philippe Etchebest");
#####################################################################################################################################################
#MISE EN RELATION DES RECETTES AVEC LES PRODUITS
#####################################################################################################################################################
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Boeuf",'Boeuf bourguignon');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Vin",'Boeuf bourguignon');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Oeufs",'Omelette spécial Stephou');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Thym",'Omelette spécial Stephou');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Miel",'Mielade');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Chèvre",'Mielade');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Jambon",'Pizza');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Champignon de Paris",'Pizza');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Tomate",'Pizza');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Farine",'Pizza');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Glace vanille",'Glace vanille');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Chantilly",'Glace vanille');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Levure",'Canelé');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Oeufs",'Canelé');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Rhum",'Canelé');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Farine",'Canelé');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Oeufs",'L\'oeuf à la coque');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Poivre",'L\'oeuf à la coque');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Farine",'Pancakes');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Oeufs",'Pancakes');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Lait",'Pancakes');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Chocolat",'Pancakes');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Lait",'Crêpes');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Oeufs",'Crêpes');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Farine",'Crêpes');
INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES ("Pain au chocolat",'Pain au chocolat');
#####################################################################################################################################################
#AJOUT DES ACHATS AUX FOURNISSEURS
#####################################################################################################################################################
INSERT INTO `cooking`.`achete`(`nomcooking`,`nom_produit`,`nom_fournisseur`) VALUES ("Bienvenue chez Cooking","Vin","ACTION");
INSERT INTO `cooking`.`achete`(`nomcooking`,`nom_produit`,`nom_fournisseur`) VALUES ("Bienvenue chez Cooking","Boeuf","BOUCHERIE");
#####################################################################################################################################################
#LES COMMANDES 
#####################################################################################################################################################
SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat("BIG4",' ',CURDATE(),' ',@compt),CURRENT_DATE(),"BIG4");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Boeuf bourguignon',Concat("BIG4",' ',CURDATE(),' ',@compt),1);
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES
('Omelette spécial Stephou',Concat("BIG4",' ',CURDATE(),' ',@compt),1);
#####################################################################################################################################################
#SUITE A CETTE COMMANDE UPDATE THE FOLLOWING TABLE
#####################################################################################################################################################
#Pour tous les produits mettre à jour la dernière date d'utilisation et la quantité
#select nom_produit from composee_de where nom_recette='Boeuf bourguignon';
#select nom_produit from composee_de where nom_recette='Omelette spécial Stephou';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Boeuf');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Vin');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Oeufs');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Boeuf');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Vin');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Oeufs');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Boeuf bourguignon';
#select id_cdr from recette where nom_recette='Boeuf bourguignon';
UPDATE `cooking`.`cuisinier` SET `solde_cuistot` = `solde_cuistot` + 25 WHERE (`id_cuistot` = 'Luigi Renato');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Boeuf bourguignon');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Omelette spécial Stephou');
#####################################################################################################################################################
#AUTRES COMMANDES
#####################################################################################################################################################
SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('ADJ1',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"ADJ1");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Mielade',Concat('ADJ1',' ',CURDATE(),' ',@compt),2);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Mielade';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Chèvre');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Miel');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Chèvre');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Miel');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Mielade';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Mielade') ;
#select prix from recette where nom_recette='Mielade';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 6 WHERE (`id_client` = 'TANG3');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Mielade');

SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('TANG3',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"TANG3");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES ('Pizza',
Concat('TANG3',' ',CURDATE(),' ',@compt),2);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Pizza';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Champignon de Paris');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Farine');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Champignon de Paris');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Farine');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Champignon de Paris');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Farine');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Pizza';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Pizza') ;
#select prix from recette where nom_recette='Pizza';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 6 WHERE (`id_client` = 'TANG3');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Pizza');

SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('TANG3',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"TANG3");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Pizza',Concat('TANG3',' ',CURDATE(),' ',@compt), 1);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Pizza';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Champignon de Paris');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Farine');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Jambon');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Tomate');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Champignon de Paris');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Farine');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Jambon');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Tomate');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Pizza';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Pizza') ;
#select prix from recette where nom_recette='Pizza';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 6 WHERE (`id_client` = 'TANG3');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Pizza');


SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('MAR5',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"MAR5");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Glace vanille',Concat('MAR5',' ',CURDATE(),' ',@compt), 1);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Glace vanille';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Chantilly');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Glace vanille');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Chantilly');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Glace vanille');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Glace vanille';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Glace vanille') ;
#select prix from recette where nom_recette='Glace vanille';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 6 WHERE (`id_client` = 'MAR5');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Glace vanille');


SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('BIG4',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"BIG4");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Glace vanille',Concat('BIG4',' ',CURDATE(),' ',@compt), 1);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Glace vanille';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Chantilly');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Glace vanille');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Chantilly');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Glace vanille');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Glace vanille';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Glace vanille') ;
#select prix from recette where nom_recette='Glace vanille';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 6 WHERE (`id_client` = 'BIG4');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Glace vanille');


SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('JM2',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"JM2");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Glace vanille',Concat('JM2',' ',CURDATE(),' ',@compt), 1);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Glace vanille';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Chantilly');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Glace vanille');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Chantilly');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Glace vanille');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Glace vanille';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Glace vanille') ;
#select prix from recette where nom_recette='Glace vanille';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 6 WHERE (`id_client` = 'JM2');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Glace vanille');

SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('TT6',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"TT6");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Glace vanille',Concat('TT6',' ',CURDATE(),' ',@compt), 1);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Glace vanille';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Chantilly');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Glace vanille');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Chantilly');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Glace vanille');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Glace vanille';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Glace vanille') ;
#select prix from recette where nom_recette='Glace vanille';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 6 WHERE (`id_client` = 'TT6');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Glace vanille');


SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('ADJ1',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"ADJ1");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Canelé',Concat('ADJ1',' ',CURDATE(),' ',@compt), 1);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Canelé';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Farine');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Levure');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Oeufs');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Rhum');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Farine');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Levure');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Oeufs');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Rhum');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Canelé';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Canelé') ;
#select prix from recette where nom_recette='Canelé';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 10 WHERE (`id_client` = 'TT6');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Canelé');


SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('ADJ1',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"ADJ1");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Pancakes',Concat('ADJ1',' ',CURDATE(),' ',@compt), 1);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Pancakes';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Farine');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Chocolat');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Oeufs');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Lait');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Farine');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Chocolat');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Oeufs');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Lait');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Pancakes';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Pancakes') ;
#select prix from recette where nom_recette='Pancakes';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 7.8 WHERE (`id_client` = 'MAR5');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Pancakes');

SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('ADJ1',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"ADJ1");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Crêpes',Concat('ADJ1',' ',CURDATE(),' ',@compt), 1);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Crêpes';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Farine');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Oeufs');
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Lait');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Farine');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Oeufs');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Lait');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Crêpes';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Crêpes') ;
#select prix from recette where nom_recette='Crêpes';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 7.8 WHERE (`id_client` = 'MAR5');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Crêpes');

SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('TT6',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"TT6");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('L\'oeuf à la coque',Concat('TT6',' ',CURDATE(),' ',@compt), 1);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='L\'oeuf à la coque';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Oeufs');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Oeufs');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='L\'oeuf à la coque';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='L\'oeuf à la coque') ;
#select prix from recette where nom_recette='L\'oeuf à la coque';
UPDATE `cooking`.`cuisinier` SET `solde_cuistot` = `solde_cuistot`+ 5 WHERE (`id_cuistot` = 'Cyril Lignac');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'L\'oeuf à la coque');

SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('ALEX7',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"ALEX7");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Pain au chocolat',Concat('ALEX7',' ',CURDATE(),' ',@compt), 4);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Pain au chocolat';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Pain au chocolat');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Pain au chocolat');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Pain au chocolat';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Pain au chocolat') ;
#select prix from recette where nom_recette='Pain au chocolat';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 3.5 WHERE (`id_client` = 'ALEX7');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Pain au chocolat');

SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('ADJ1',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"ADJ1");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Pain au chocolat',Concat('ADJ1',' ',CURDATE(),' ',@compt), 3);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Pain au chocolat';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Pain au chocolat');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Pain au chocolat');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Pain au chocolat';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Pain au chocolat') ;
#select prix from recette where nom_recette='Pain au chocolat';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 3.5 WHERE (`id_client` = 'ALEX7');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Pain au chocolat');

SET @compt = (select count(*) from commande);
INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES 
(Concat('ADJ1',' ',CURDATE(),' ',@compt),CURRENT_DATE(),"ADJ1");
INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES 
('Pain au chocolat',Concat('ADJ1',' ',CURDATE(),' ',@compt), 3);
#Suite à cette commande voilà ce qu'il faut modifier dans la database :
#select nom_produit from composee_de where nom_recette='Pain au chocolat';
UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE (`nom_produit` = 'Pain au chocolat');
UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE (`nom_produit` = 'Pain au chocolat');
#Et ne pas oublier de payer le Cdr ou le cuisinier (l'un ou l'autre)
#select id_cuistot from recette where nom_recette='Pain au chocolat';
#select id_client from client where id_cdr = (select id_cdr from recette where nom_recette='Pain au chocolat') ;
#select prix from recette where nom_recette='Pain au chocolat';
UPDATE `cooking`.`client` SET `solde` = `solde`+ 3.5 WHERE (`id_client` = 'ALEX7');
UPDATE `cooking`.`recette` SET `nbr_commande_passee` = `nbr_commande_passee` + 1 WHERE (`nom_recette` = 'Pain au chocolat');

