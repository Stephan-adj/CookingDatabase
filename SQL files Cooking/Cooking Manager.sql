#Commande de la semaine triée par ordre décroissant de nombre de commande
SELECT a.nom_recette, count(a.nom_recette) FROM ayant a natural join recette r natural join commande c where r.id_cdr IS NOT NULL and DATE_FORMAT(c.date_commande, "%u") = DATE_FORMAT(CURRENT_DATE(), "%u") group by a.nom_recette order by count(a.nom_recette) DESC;
#La recette ayant été le plus commandé cette semaine et ayant été fabriqué par un Cdr.
SELECT a.nom_recette FROM ayant a natural join recette r natural join commande c where r.id_cdr IS NOT NULL and DATE_FORMAT(c.date_commande, "%u") = DATE_FORMAT(CURRENT_DATE(), "%u") group by a.nom_recette order by count(a.nom_recette) DESC LIMIT 1;
#le CdR ayant eu la recette la plus commandée cette semaine 
select nom_client from client where id_cdr=(SELECT r.id_cdr FROM ayant a natural join recette r natural join commande c where r.id_cdr IS NOT NULL and DATE_FORMAT(c.date_commande, "%u") = DATE_FORMAT(CURRENT_DATE(), "%u") group by a.nom_recette order by count(a.nom_recette) DESC LIMIT 1);
#Les cdr rangés par nombre de recettes commandés cette semaine
SELECT id_cdr, count(p.nom_recette) FROM ayant p natural join recette r natural join commande c where r.id_cdr IS NOT NULL and DATE_FORMAT(date_commande, "%u") = (select DATE_FORMAT(CURRENT_DATE(), "%u")) group by id_cdr order by count(nom_recette) DESC;

#Le tableau de bord de la semaine 
#A
#Le CdR ayant le plus été commandé cette semaine !! Avec le nombre de commande de ses recettes.
SELECT r.id_cdr, count(p.nom_recette) FROM ayant p natural join recette r natural join commande c where r.id_cdr IS NOT NULL and DATE_FORMAT(date_commande, "%u") = (select DATE_FORMAT(CURRENT_DATE(), "%u")) group by id_cdr order by count(nom_recette) DESC limit 1;
#Si on veut son nom
SELECT nom_client from client where id_cdr=(SELECT r.id_cdr FROM ayant p natural join recette r natural join commande c where r.id_cdr IS NOT NULL and DATE_FORMAT(date_commande, "%u") = (select DATE_FORMAT(CURRENT_DATE(), "%u")) group by id_cdr order by count(nom_recette) DESC limit 1);

#B
#Le top 5 recettes : les 5 recettes ayant été les plus commandées (avec toutes informations utiles,type de recette, cuisinier) 
SELECT * FROM recette order by nbr_commande_passee DESC limit 5;

#C
# Le CdR d'or : le CdR ayant été le plus commandé depuis l'ouverture du site 
SELECT id_cdr, count(p.nom_recette) FROM ayant p natural join recette r where r.id_cdr IS NOT NULL group by id_cdr order by count(nom_recette) DESC limit 1;
SELECT id_cdr, count(p.nom_recette) FROM ayant p natural join recette r where  r.id_cdr IS NOT NULL group by id_cdr order by count(nom_recette) DESC;
#Ainsi que la liste de ses 5 recettes les plus commandées. 
SELECT nom_recette, count(nom_recette), r.id_cdr FROM ayant natural join recette r where r.id_cdr=(SELECT id_cdr FROM ayant p natural join recette r where r.id_cdr IS NOT NULL group by id_cdr order by count(nom_recette) DESC limit 1) group by nom_recette order by count(nom_recette) DESC Limit 5;

#Le réapprovisionnement hebdomadaire des produits.
#Mise à jour des Qte max et Qte min des produits : tout produit n'ayant pas été utilisé depuis les 30 derniers jours verra ses quantités max et min divisées par 2. 
SELECT nom_produit from produit where date_derniere_utilisation is NULL or ((DATE_FORMAT(CURRENT_DATE(), "%j")-DATE_FORMAT(date_derniere_utilisation, "%j"))>30);
UPDATE `cooking`.`produit` SET `stock_mini` = `stock_mini`/2, `stock_maxi` = `stock_maxi`/2 WHERE (`nom_produit` = 'Thym');


# Supprimer une recette.
DELETE FROM `cooking`.`composee_de` WHERE (`nom_recette` = 'L\'oeuf à la coque');
DELETE FROM `cooking`.`ayant` WHERE (`nom_recette` = 'L\'oeuf à la coque');
DELETE FROM `cooking`.`recette` WHERE (`nom_recette` = 'L\'oeuf à la coque');
#Supprimer un cuisiner (et toutes ses recettes), mais (il reste client ou non à votre choix).
#Pour pouvoir supprimer un cuisinier ou une recette veiller à bien supprimer ce qu'il faut comme montrer ci-dessus 
DELETE FROM `cooking`.`cuisinier` WHERE (`id_cuistot` = 'Cyril Lignac');
DELETE FROM `cooking`.`recette` WHERE (`id_cuistot` = 'Cyril Lignac');
SELECT nom_recette FROM recette WHERE (`id_cuistot` = 'Cyril Lignac');

#Pour avoir les dernières commandes passées : ajouter limit 5
SELECT * FROM ayant ORDER BY SUBSTR(ref_commande, length(ref_commande)-1) DESC limit 8;

